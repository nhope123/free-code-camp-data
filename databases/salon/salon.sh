#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c "
INSERT_RESULT="INSERT 0 1"

echo -e "\n~~~ Welcome to Sheen's Beauty Salon ~~~"



MAIN_MENU() {
  if [[ $1 ]]
  then
    echo -e "\n$1"
  else
    echo -e "\nSelect the desired Service"
  fi

  SELECT_SALON_SERVICE

  GET_CUSTOMER_INFO

  GET_SERVICE_TIME

  CREATE_APPOINTMENT    
}

SELECT_SALON_SERVICE() {
  
  AVAILABLE_SERVICES=$($PSQL "SELECT service_id, name FROM services")
  echo "$AVAILABLE_SERVICES" | while IFS=" | " read SERVICE_ID NAME
  do  
    echo "$SERVICE_ID) $NAME"
  done

  read SERVICE_ID_SELECTED
  # Check if service exist
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
  then
    MAIN_MENU "Select a number from the list"
  else
    # check if the service exist
    SERVICE_INFO_RESULT=$($PSQL "SELECT service_id, name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    # if it does not exist 
    if [[ -z $SERVICE_INFO_RESULT ]]
    then 
      # Select a service  Number
      MAIN_MENU "Select a number from the list"
    fi

    IFS=" | " read SERVICE_ID SERVICE_NAME <<< "$SERVICE_INFO_RESULT"
  fi
}

GET_CUSTOMER_INFO(){
  # Ask for phone number 
    echo -e "\nEnter phone number"
    read CUSTOMER_PHONE
    CUSTOMER_INFO_RESULT=$($PSQL "SELECT name, phone, customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")

    if [[ -z $CUSTOMER_INFO_RESULT ]]
    then

      echo -e "\nEnter your name"
      read CUSTOMER_NAME
      INSERT_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
      
      if [[ $INSERT_CUSTOMER_RESULT  != $INSERT_RESULT ]]
      then
        MAIN_MENU "Customer record not created"
      fi

      CUSTOMER_INFO_RESULT=$($PSQL "SELECT name, phone, customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE';")
      
      if [[ -z $CUSTOMER_INFO_RESULT ]]
      then
        MAIN_MENU "Customer record not created"
      fi
    fi
  
    IFS=" | " read CUSTOMER_NAME CUSTOMER_PHONE CUSTOMER_ID  <<< "$CUSTOMER_INFO_RESULT"
}

GET_SERVICE_TIME() {
  if [[ $1 ]]
  then
    echo $1
  else
    echo -e "\nWhat time would you like for $SERVICE_NAME service"
  fi

  read SERVICE_TIME_INPUT
  if [[ -z $SERVICE_TIME_INPUT  ]]
  then
    GET_SERVICE_TIME "Please enter a valid time"
  fi

   SERVICE_TIME=$SERVICE_TIME_INPUT
}

CREATE_APPOINTMENT() {

  if [[ ! ($CUSTOMER_ID && $SERVICE_ID && $SERVICE_TIME )]]
  then
    MAIN_MENU "Missing appointment info"
  fi
  
  INSERT_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID, '$SERVICE_TIME');")
  

  if [[ ! ($INSERT_APPOINTMENT_RESULT = $INSERT_RESULT) ]]
  then
    MAIN_MENU "Missing appointment info"
  else  
    echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."
  fi

} 

MAIN_MENU
