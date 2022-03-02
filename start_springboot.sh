#!/bin/bash
SERVER_PORT=$1
SPRING_PROFILE=$2
BOOT_JAR_PATH=$3

if [ -z "${SERVER_PORT}" ] || [ -z "${SPRING_PROFILE}" ] || [ -z "${BOOT_JAR_PATH}" ]
then
        echo "required argument not served"
fi

#start java project
nohup java -DServer.port=$1 -DSpring.profiles.active=$2 -jar $3 > /dev/null 2>&1 &

# waiting for start and check is Ok
echo "waiting for start spring boot project for 5 seconds"
for i in {1..5}; do
        echo "standby start spring $i seconds..."
        sleep 1
done

echo "spring start succeed"