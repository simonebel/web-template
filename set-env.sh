# !/bin/bash
source bin/utils
function printUsage() {
    cat <<EOF

    Set the environment variables.

    Usage: set-env-local.sh [--env ENV]

	--env: Whether to run in dev or prod. Possible value are:  dev | prod. Default "dev"

EOF
}

ENV="dev"
DATA_DIR=""
while [ $# -gt 0 ]; do
    ARG=$1
    case $ARG in
    -h | --help)
        printUsage
        exit 1
        ;;
    --env)
        shift
        ENV=$1
        shift
        ;;
    --data-dir)
        shift
        DATA_DIR=$1
        shift
        ;;
    esac
done

## DIRECTORIES ##
# The home directory
BASE_DIR=$(pwd -P)
export BASE_DIR=$BASE_DIR

# Data direcotry
export DATA_DIR=$DATA_DIR

# The front end directory
export FRONT_DIR=$BASE_DIR/front

# bash CLI directory
export PATH=$PATH:$BASE_DIR/bin

# SQLite directory
export SQLITE_DIR=$DATA_DIR/sqlite

## VARIABLES ##
# Add our python package to the pythonpath
export PYTHONPATH="${PYTHONPATH}:$BASE_DIR/src"

# Environment mode
export ENV="$ENV"

if [ -z $DATA_DIR ]; then
    error "DATA_DIR is not set and is required for sqlite, exiting..."
    return 1
else
    mkdir -p $DATA_DIR
fi

if [ -d $SQLITE_DIR ]; then
    # Set our sqlite alias
    alias sqlite3=$SQLITE_DIR/sqlite-tools-linux-x86-3410200/sqlite3
else
    error "Sqlite is not setup yet, please run install script"
fi

info "Environnement set with :
        BASE_DIR=$BASE_DIR
        ENV="$ENV"
        SQLITE="$SQLITE_DIR""

# if [ -d .env/ ]; then
#     # activate the python virtual environment
#     source $BASE_DIR/.env/bin/activate
# else
#     error "No virtual environnement set-up"

# fi
