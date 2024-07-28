#!/bin/bash

PSQL="psql --username=freecodecamp --dbname=number_guess -t --no-align -c"

GUESSING_GAME() {
  SECRET_NUMBER=$1
  GUESSES=$2
  USER_ID=$3
  echo -e $4
  read INPUT_NUMBER
  if [[ ! $INPUT_NUMBER =~ ^-?[0-9]+$ ]]
    then GUESSING_GAME $SECRET_NUMBER $GUESSES $USER_ID "That is not an integer, guess again:"
    else
      GUESSES=$((GUESSES + 1))
      if [[ $INPUT_NUMBER -eq $SECRET_NUMBER ]]
        then END_GAME $SECRET_NUMBER $GUESSES $USER_ID
      fi
      if [[ $INPUT_NUMBER -gt $SECRET_NUMBER ]]
        then GUESSING_GAME $SECRET_NUMBER $GUESSES $USER_ID "It's lower than that, guess again:"
      fi
      if [[ $INPUT_NUMBER -lt $SECRET_NUMBER ]]
        then GUESSING_GAME $SECRET_NUMBER $GUESSES $USER_ID "It's higher than that, guess again:"
      fi
  fi
}

START_GAME() {
  # guide the user to input a username
  echo -e "Enter your username:\n"
  read USERNAME
  # if the length of input are equal or less to 22 characters
  if [[ ${#USERNAME} -le 22 ]]
    then
      # search for the user by username 
      USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
      echo "$USER_ID"
      # if the user does not exist
      if [[ -z $USER_ID ]]
        then 
        # insert a new user
          USER_INSERT_RESULT=$($PSQL "INSERT INTO users(username) VALUES('$USERNAME')")
          USER_ID=$($PSQL "SELECT user_id FROM users WHERE username = '$USERNAME'")
        # initialize a game
          SECRET_NUMBER=$(( (RANDOM % 1000) + 1 ))
          echo -e "Welcome, $USERNAME! It looks like this is your first time here.\n"
          GUESSING_GAME $SECRET_NUMBER 0 $USER_ID "Guess the secret number between 1 and 1000:\n"
        else
        # else search the number of games played and the best guess
          GAMES_PLAYED=$($PSQL "SELECT COUNT(*) FROM games WHERE user_id = $USER_ID")
          BEST_GUESS=$($PSQL "SELECT MIN(guesses) FROM games WHERE user_id = $USER_ID")
        # initialize a game
          SECRET_NUMBER=$(( (RANDOM % 1000) + 1 ))
          echo "Welcome back, $USERNAME! You have played $GAMES_PLAYED games, and your best game took $BEST_GUESS guesses."
          GUESSING_GAME $SECRET_NUMBER 0 $USER_ID "Guess the secret number between 1 and 1000:\n"
      fi
    else echo "User name should not be greater than 22 characters."
  fi
}

END_GAME() {
  SECRET_NUMBER=$1
  GUESSES=$2
  USER_ID=$3
  # insert game result into games table
  INSERT_GAMES_RESULT=$($PSQL "INSERT INTO games(guesses, user_id) VALUES($GUESSES, $USER_ID)")
  # end the game
  echo "You guessed it in $GUESSES tries. The secret number was $SECRET_NUMBER. Nice job!"
  exit 0
}

START_GAME
