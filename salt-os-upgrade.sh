#!/bin/bash

server_list=/srv/salt/all-linux-minions-list.ini
log_file=/root/os_update-all/os_update-all-$(date +%F_%T).log
touch "$log_file"

function date_now() {
  date "+%F_%H:%M:%s" | tr -d '\n'
}

# generate a server list of all online Linux servers we want to update
echo "[I] $(date_now) : Generating server list file" >> "$log_file"
/srv/salt/generate_linux_minion_list.sh

# run os_update salt state against this list and log to logfile
echo "[I] $(date_now) : Updating servers from list file" >> "$log_file"
salt -L "$(<$server_list)" state.apply os_update &>> "$log_file"
