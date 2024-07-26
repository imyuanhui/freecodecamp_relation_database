#! /bin/bash

PSQL="psql -X --username=freecodecamp --dbname=salon --tuples-only -c"

echo -e "\n~~~~~ Hannah's Salon ~~~~~\n"

SERVICE_LIST() {
  if [[ $1 ]] 
    then echo -e "\n$1"
  else
    echo -e "\nHello, welcome to Hannah's Salon, how can I help you?"
  fi
  SERVICES=$($PSQL "SELECT service_id, name FROM services WHERE name != '' ORDER BY service_id ")
  echo "$SERVICES" | while read SERVICE_ID BAR SERVICE_NAME
    do 
      echo "$SERVICE_ID) $SERVICE_NAME"
    done
  read SERVICE_ID_SELECTED
  if [[ ! $SERVICE_ID_SELECTED =~ ^[0-9]+$ ]]
    then 
      SERVICE_LIST "Please enter a valid number. Which service would you like to book?"
  else
    SERVICE_NAME_TO_BOOK=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
    if [[ -z $SERVICE_NAME_TO_BOOK ]]
      then
        SERVICE_LIST "I could not find that service. What would you like today?"
      else
        echo -e "\nWhat's your phone number?"
        read CUSTOMER_PHONE
        CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
        # if customer doesn't exist
        if [[ -z $CUSTOMER_NAME ]]
          then
            # get customer's name
            echo -e "\nI don't have a record for that phone number, what's your name?"
            read CUSTOMER_NAME
            # insert into customers
            ADD_CUSTOMER_RESULT=$($PSQL "INSERT INTO customers(name, phone) VALUES('$CUSTOMER_NAME', '$CUSTOMER_PHONE')")
            CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
            # get appointment time
            echo -e "\nWhat time would you like your $SERVICE_NAME_TO_BOOK, $CUSTOMER_NAME?"
            read SERVICE_TIME
            # insert into appointments
            SET_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
            # print appointment info
            
            echo -e "\nI have put you down for a $SERVICE_NAME_TO_BOOK at $SERVICE_TIME, $CUSTOMER_NAME."
          else
            # get customer id
            CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
            # get appointment time
            echo -e "\nWhat time would you like your $SERVICE_NAME_TO_BOOK, $CUSTOMER_NAME?"
            read SERVICE_TIME
            # insert into appointments
            SET_APPOINTMENT_RESULT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")
            # print appointment info
            SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
            echo -e "\nI have put you down for a $SERVICE_NAME_TO_BOOK at $SERVICE_TIME, $CUSTOMER_NAME."
        fi   
    fi
  fi
}

SERVICE_LIST
