#!/bin/bash
exec sleep 9999&
exec sleep 9999&

ps -ef | grep sleep | pkill -9 -P 1

#pkill -9 -p 1
