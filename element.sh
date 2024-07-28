#! /bin/bash

PSQL="psql --username=freecodecamp --dbname=periodic_table -t --no-align --tuples-only -c"

FIND_ELEMENT() {
  # if there is no input
  if [[ -z $1 ]]
  # print a hint and exit 
    then echo "Please provide an element as an argument."
    else
  # if the input is atomic number
      if [[ $1 =~ [0-9] ]]
        then
  # search the element by the given atomic number 
          ELEMENT_FOUND=$($PSQL "SELECT * FROM properties WHERE atomic_number = $1")
  # if the element is not found
          if [[ -z $ELEMENT_FOUND ]]
  # print and exit
            then echo "I could not find that element in the database."
            else 
  # print the element info
              PRINT_ELEMENT_INFO $ELEMENT_FOUND
          fi
        else 
  # search the element by the given name or symbol
          if [[ ${#1} -le 2 ]]
            then ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE symbol = '$1'")
            else ATOMIC_NUMBER=$($PSQL "SELECT atomic_number FROM elements WHERE name = '$1'")
          fi
          ELEMENT_FOUND=$($PSQL "SELECT * FROM properties WHERE atomic_number = $ATOMIC_NUMBER")
          if [[ -z $ELEMENT_FOUND ]]
            then echo "I could not find that element in the database."
            else PRINT_ELEMENT_INFO $ELEMENT_FOUND
          fi
      fi
  fi
}

PRINT_ELEMENT_INFO() {
  echo "$1" | while IFS="|" read ATOMIC_NUMBER ATOMIC_MASS MELTING_POINT BOILING_POINT TYPE_ID
  do
    TYPE=$($PSQL "SELECT type FROM types WHERE type_id = $TYPE_ID")
    NAME=$($PSQL "SELECT name FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
    SYMBOL=$($PSQL "SELECT symbol FROM elements WHERE atomic_number = $ATOMIC_NUMBER")
    echo "The element with atomic number $ATOMIC_NUMBER is $NAME ($SYMBOL). It's a $TYPE, with a mass of $ATOMIC_MASS amu. $NAME has a melting point of $MELTING_POINT celsius and a boiling point of $BOILING_POINT celsius."
  done
}

FIND_ELEMENT "$1"
