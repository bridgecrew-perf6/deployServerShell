#!/bin/bash
SERVER_PORT=$1

if [ -z "$SERVER_PORT" ]
then
        echo "required argument not served"
        exit 1
fi

PROCESS=$(netstat -nap | grep :${SERVER_PORT} | awk '{print $7}')

if [ -z "${PROCESS}" ]
then
        echo "process not exist"
        exit 1
else
        echo "find process using ${SERVER_PORT} port, PID ===> ${PROCESS}"
fi

# get PID and ProgramName with Port
IFS="/" read -r PID PROCESS <<< "${PROCESS}"

echo "trying to terminate server"

#kill process
kill -9 $PID

#check process state
for i in {1..5}; do
        echo "standby kill process $i seconds..."
        sleep 1
done

PROCESS=$(netstat -nap | grep :${SERVER_PORT} | awk '{print $7}')
if [ -z "${result}" ]
then
        echo "process kill success"
else
        echo "failed to kill process"
        exit 1
fi

echo "standby 30 seconds"
sleep 30

echo "done"