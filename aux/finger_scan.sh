#!/bin/bash

if [[ $# != 2 ]]; then
   echo $0 host user-file
   exit 1
fi

while read user
do           
   USER_EXISTS=$(finger $user@$1 | grep "Login: $user" | wc -l)
   if [[ "$USER_EXISTS" == "1" ]]; then
      echo $user exists
   fi
done < $2
