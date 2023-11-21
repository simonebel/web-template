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
    esac
done

## DIRECTORIES ##
# The home firectory
BASE_DIR=$(pwd -P)
export BASE_DIR=$BASE_DIR

# The front end directory
export FRONT_DIR=$BASE_DIR/front

# bash CLI directory
export PATH=$PATH:$BASE_DIR/bin

# SQLite directory
export SQLITE_DIR=$DIR/sqlite

## VARIABLES ##
# Add our python package to the pythonpath
export PYTHONPATH="${PYTHONPATH}:$BASE_DIR/src"

# Environment mode
export ENV="$ENV"

if [ -d $SQLITE_DIR ]; then
    # Set our sqlite alias
    alias sqlite3=$SQLITE_DIR/sqlite-tools-linux-x86-3410200/sqlite3
else
    error "Sqlite isn't setup, yet"
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
