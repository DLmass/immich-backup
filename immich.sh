#!/bin/bash
EVENTNAME=$DUPLICATI__EVENTNAME
OPERATIONNAME=$DUPLICATI__OPERATIONNAME

if [ "$EVENTNAME" == "BEFORE" ]
then
        if [ "$OPERATIONNAME" == "Backup" ]
        then
            docker stop immich_server immich_postgres immich_redis immich_machine_learning
        elif [ "$OPERATIONNAME" == "Restore" ]
        then
            docker stop immich_server immich_postgres immich_redis immich_machine_learning
        fi
elif [ "$EVENTNAME" == "AFTER" ]
then
        if [ "$OPERATIONNAME" == "Backup" ]
        then
            docker start immich_server immich_postgres immich_redis immich_machine_learning
        elif [ "$OPERATIONNAME" == "Restore" ]
        then
            docker start immich_server immich_postgres immich_redis immich_machine_learning
        fi
else
    echo "Got unknown event \"$EVENTNAME\", ignoring" >&2
fi
exit 0