#! /bin/bash

SECRET_NUMBER=$(( RANDOM % 1000 + 1 ))
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

USERNAME=""
INSERT_RETURN="INSERT 0 1"
USER_GUESS=0
GUESS_COUNT=0

getUser () {
  local RESULT
  RESULT=$($PSQL "SELECT username, games_played, best_game FROM game_details WHERE username='$USERNAME';")
  echo "$RESULT"
}

setUser () {
  local RESULT
  RESULT=$($PSQL "INSERT INTO game_details(username) VALUES('$USERNAME');")
  if [[ "$RESULT" == "$INSERT_RETURN" ]]
  then echo true
  else echo false
  fi
}

updateGameDetail () {
  local RESULT
  RESULT=$($PSQL "UPDATE game_details SET games_played=$GAMES_PLAYED, best_game=$BEST_GAME WHERE username='$USERNAME';")
}

# Get username
echo "Enter your username:"


while [[ -z $USERNAME ]];
do
  read -r USERNAME
done

# Check database for user 
USER_QUERY_RESULT=$(getUser)

# User not in database
if [[ -z $USER_QUERY_RESULT ]]
then
  setUser
  echo "Welcome, $USERNAME! It looks like this is your first time here."

else 
  # Get user game detail
  IFS="|" read -r USERNAME GAMES_PLAYED BEST_GAME <<< "$USER_QUERY_RESULT" 
  echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
  
fi 

if [[ ! $GAMES_PLAYED ]]
then 
  GAMES_PLAYED=1
else
  GAMES_PLAYED=$(( GAMES_PLAYED + 1 ))
fi

echo "Guess the secret number between 1 and 1000:"

while [[ $USER_GUESS -ne $SECRET_NUMBER ]];
do

  read -r USER_GUESS
  GUESS_COUNT=$(( GUESS_COUNT + 1 ))
  
  if [[ ! $USER_GUESS =~ ^[0-9]+$ ]]
  then 
    echo "That is not an integer, guess again:" 

  elif [[ $USER_GUESS -gt $SECRET_NUMBER ]]
  then
    echo "It's lower than that, guess again:"

  elif [[ $USER_GUESS -lt $SECRET_NUMBER ]]
  then 
    echo "It's higher than that, guess again:"

  fi
done

if [[ ! $BEST_GAME || $BEST_GAME -gt $GUESS_COUNT ]]
then 
  BEST_GAME=$GUESS_COUNT
fi

updateGameDetail

echo "You guessed it in $GUESS_COUNT tries. The secret number was $SECRET_NUMBER. Nice job!"