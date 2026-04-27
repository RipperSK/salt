#!/bin/bash

server_list=/srv/salt/all-linux-minions-list.ini

function date_now() {
  date "+%F_%H:%M:%s" | tr -d '\n'
}

# generate a server list of all online Linux servers we want to update
echo "[I] $(date_now) : Generating Linux server list file $server_list"
salt -G 'kernel:Linux' test.ping 2>/dev/null | grep True$ -B1 | grep :$ | tr -d ':' | sort > $server_list

echo "[I] $(date_now) : Done"
