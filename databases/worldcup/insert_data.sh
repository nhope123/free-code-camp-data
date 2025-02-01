#! /bin/bash

if [[ $1 == "test" ]]
then
  PSQL="psql --username=postgres --dbname=worldcuptest -t --no-align -c"
else
  PSQL="psql --username=freecodecamp --dbname=worldcup -t --no-align -c"
fi

# Do not change code above this line. Use the PSQL variable above to query your database.

QUERY_RESULT="INSERT 0 1"

insertTeam() {
  local TEAM=$1
  
  # Check if team exist in teams
  TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM'")"
  # Not team not found 
  if [[ -z $TEAM_ID ]]
  then
    # Insert team
    TEAM_INSERT_RESULT="$($PSQL "INSERT INTO teams(name) VALUES('$TEAM')")"
    # Get team id    
    if [[ $TEAM_INSERT_RESULT = $QUERY_RESULT  ]]
    then
      TEAM_ID="$($PSQL "SELECT team_id FROM teams WHERE name='$TEAM'")"
    fi
  fi

  echo $TEAM_ID
} 


# echo -e "$($PSQL "TRUNCATE TABLE games, teams;")\n" 

cat games.csv | while IFS="," read YEAR ROUND WINNER OPPONENT WINNER_GOAL OPPONENT_GOAL
do
  if [[ $YEAR != 'year' ]]
  then
    # Insert and get winning team id
    WINNER_ID=$(insertTeam "$WINNER")
    # Insert and get opponent team id
    OPPONENT_ID=$(insertTeam "$OPPONENT")

    # Add record to games table
    INSERT_GAME_RESULT="$($PSQL "INSERT INTO games(year, round, winner_id, opponent_id,winner_goals, opponent_goals ) VALUES($YEAR, '$ROUND', $WINNER_ID, $OPPONENT_ID, $WINNER_GOAL, $OPPONENT_GOAL )")"    
    echo $INSERT_GAME_RESULT
  fi

done

