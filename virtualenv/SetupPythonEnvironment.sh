#!/bin/bash

# Usage:
#    bash SetupPythonEnvironment.sh [PYTHON_EXE_PATH] [ENV_DIR_NAME]
#
# If any additional setup is needed for this environment, it can be done at 
# the end of the script.  See the commented out pip call as an example.
#
# Note: This script will run on any platform that supports bash/uname.  This 
# includes platforms using msysgit (using Git Bash).
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
PYTHON_BIN=$1
if [ -z "$PYTHON_BIN" ];then
   PYTHON_BIN=$(which python)
fi

ENV_NAME=$2
if [ -z "$ENV_NAME" ];then
   OS=$(uname -s)
   ARCH=$(uname --machine)
   ENV_NAME=$OS.$ARCH
fi

#hack, if windows, append exe to python bin
if [ ! -z $(echo $OS | grep -i "mingw") ]; then
    PYTHON_BIN=$PYTHON_BIN.exe
fi
echo Creating environment "$ENV_NAME" using $PYTHON_BIN ...
python $SCRIPT_DIR/virtualenv.py -p "$PYTHON_BIN" "$ENV_NAME" || exit $?

if [ ! -z $(echo $OS | grep -i "mingw") ]; then
    INTERMEDIATE_DIR=Scripts
else
    INTERMEDIATE_DIR=bin
fi

. "$ENV_NAME/$INTERMEDIATE_DIR/activate"

#install packages
export PIP_DOWNLOAD_CACHE=$SCRIPT_DIR/pip-cache
pip install django==1.4.2 || exit $?
echo Done creating environment "$ENV_NAME" using $PYTHON_BIN ...

