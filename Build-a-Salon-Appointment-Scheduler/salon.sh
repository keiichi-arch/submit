#!/bin/bash

export PGPASSWORD='asai'
PSQL="psql --username=freecodecamp --dbname=salon -qtA -c"

MAIN_MENU() {
    echo -e "\n~~~~~ MY SALON ~~~~~\n"

    if [[ $1 ]]
    then
        echo $1
    else
        echo -e "Welcome to My Salon, how can I help you?\n"
    fi

    SERVICE=$($PSQL "SELECT service_id, name FROM services")
    echo "$SERVICE" | sed 's/|/) /g'

    read SERVICE_ID_SELECTED
    SERVICE_NAME=$($PSQL "SELECT name FROM services WHERE service_id = $SERVICE_ID_SELECTED")
}

MAIN_MENU
while [[ -z $SERVICE_NAME ]]
do
    MAIN_MENU "I could not find that service. What would you like today?"
done

# get phone number
echo -e "\nWhat's your phone number?"
read CUSTOMER_PHONE
CUSTOMER_NAME=$($PSQL "SELECT name FROM customers WHERE phone = '$CUSTOMER_PHONE'")
if [[ -z $CUSTOMER_NAME ]]
then
    # get customer name
    echo -e "\nI don't have a record for that phone number, what's your name?"
    read CUSTOMER_NAME
    # register cuntomer
    REGISTER_CUSTOMER=$($PSQL "INSERT INTO customers(phone, name) VALUES('$CUSTOMER_PHONE', '$CUSTOMER_NAME')")
fi

# get time
echo -e "\nWhat time would you like your $SERVICE_NAME, $CUSTOMER_NAME?"
read SERVICE_TIME

# register appointment
CUSTOMER_ID=$($PSQL "SELECT customer_id FROM customers WHERE phone = '$CUSTOMER_PHONE'")
REGISTER_APPOINTMENT=$($PSQL "INSERT INTO appointments(customer_id, service_id, time) VALUES($CUSTOMER_ID, $SERVICE_ID_SELECTED, '$SERVICE_TIME')")

echo -e "\nI have put you down for a $SERVICE_NAME at $SERVICE_TIME, $CUSTOMER_NAME."