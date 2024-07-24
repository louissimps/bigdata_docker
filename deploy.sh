#!/bin/bash

# Variables
MASTER_NODE="louie@main-001.local"
WORKER1_NODE="louie@worker-001.local"
WORKER2_NODE="louie@worker-002.local"
SETUP_MASTER_SCRIPT="setup_master.sh"
SETUP_WORKER_SCRIPT="setup_worker.sh"
START_MASTER_SCRIPT="start_master.sh"
START_WORKER_SCRIPT="start_worker.sh"
RESTART_APACHE_SCRIPT="manage_apache_services.sh"

# Copy setup scripts to master node
# scp $SETUP_MASTER_SCRIPT $MASTER_NODE:~/scripts
# scp $START_MASTER_SCRIPT $MASTER_NODE:~/scripts
# scp $RESTART_APACHE_SCRIPT $MASTER_NODE:~/scripts

scp .env $WORKER1_NODE:~/
scp docker-compose.yml $WORKER1_NODE:~/

# scp $START_WORKER_SCRIPT $WORKER1_NODE:~/scripts
# scp $RESTART_APACHE_SCRIPT $WORKER1_NODE:~/scripts

# scp $SETUP_WORKER_SCRIPT $WORKER2_NODE:~/scripts
# scp $START_WORKER_SCRIPT $WORKER2_NODE:~/scripts
# scp $RESTART_APACHE_SCRIPT $WORKER2_NODE:~/scripts

# # SSH into master node and execute the master setup script
# ssh $MASTER_NODE "bash /tmp/$SETUP_MASTER_SCRIPT"