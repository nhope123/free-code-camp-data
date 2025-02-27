#! /bin/bash

ELEMENT_RESPONSE="" 

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align -c"

get_element () {
  local RESPONSE
  RESPONSE=$($PSQL "SELECT atomic_number, symbol, name FROM elements WHERE $1 ;")
  echo "$RESPONSE"
}

# Script ran with no args
if [[ $# -eq 0 ]]
then 
  echo "Please provide an element as an argument."
  exit
fi

# Args 1 is a number
if [[ $1 =~ ^[0-9]+$ ]]
then
  ELEMENT_RESPONSE=$(get_element "atomic_number=$1")

# Args 1 is a symbol
elif [[ $1 =~ ^[a-zA-Z]+$ && ${#1} -le 3 ]]
then
    ELEMENT_RESPONSE=$(get_element "symbol='$1'")

# Args 1 ia a name
else
    ELEMENT_RESPONSE=$(get_element "name='$1'")
fi

# Element does not exist
if [[ -z $ELEMENT_RESPONSE ]]
then 
  echo "I could not find that element in the database."
  exit
fi

IFS="|" read -r ATOMIC_NUMBER SYMBOL NAME <<< "$ELEMENT_RESPONSE"

# Get the properties and types table data
ELEMENT_PROPERTY_RESPONSE=$($PSQL "SELECT type, atomic_mass, melting_point_celsius, boiling_point_celsius FROM properties AS p FULL JOIN types as T ON p.type_id=t.type_id WHERE p.atomic_number = $ATOMIC_NUMBER;")

if [[ -n $ELEMENT_PROPERTY_RESPONSE ]]
then
  IFS="|" read -r TYPE ATOMIC_MASS MELTING_POINT BOILING_POINT <<< "$ELEMENT_PROPERTY_RESPONSE"
  echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
fi