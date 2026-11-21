#!/bin/bash
PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

echo -e "\nEnter your username:"

read NAME
USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$NAME';")
if [[ -z $USER_ID ]]
then
  INSERT_USER_RESULT=$($PSQL "INSERT INTO users(name) VALUES('$NAME');")
  if [[ $INSERT_USER_RESULT == 'INSERT 0 1' ]]
  then
    echo -e "\nWelcome, $NAME! It looks like this is your first time here."
    USER_ID=$($PSQL "SELECT user_id FROM users WHERE name = '$NAME';")
  fi
else
  USER_INFO=$($PSQL "SELECT COUNT(*), MIN(number_guess) FROM guesses JOIN users USING(user_id) WHERE user_id = $USER_ID;")
  if [[ $USER_INFO ]]
  then
    IFS="|" read GAMES_PLAYED BEST_GAME <<< "$USER_INFO"
    echo -e "\nWelcome back, $NAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GAME guesses." 
  fi
fi

SECRET_NUMBER=$((RANDOM % 1000 + 1))
NUMBER_OF_GUESSES=1

echo Guess the secret number between 1 and 1000:
read USER_NUMBER
until (( USER_NUMBER == SECRET_NUMBER ))
do
  if [[ ! $USER_NUMBER =~ ^[0-9]+$ ]]
  then
    echo -e "\nThat is not an integer, guess again:"
  elif (( USER_NUMBER > SECRET_NUMBER ))
  then
    echo -e "\nIt's lower than that, guess again:"
  elif (( USER_NUMBER < SECRET_NUMBER ))
  then
    echo -e "\nIt's higher than that, guess again:"
  fi
    NUMBER_OF_GUESSES=$(( NUMBER_OF_GUESSES + 1 ))
    read USER_NUMBER
done

INSERT_GAME_RESULT=$($PSQL "INSERT INTO guesses(user_id, number_guess) VALUES($USER_ID, $NUMBER_OF_GUESSES);")
if [[ $INSERT_GAME_RESULT == "INSERT 0 1" ]]
then
  echo -e "\nYou guessed it in $NUMBER_OF_GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!\n"
fi
