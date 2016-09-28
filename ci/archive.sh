#!/bin/bash -ex

pushd `dirname $0`/.. > /dev/null
root=$(pwd -P)
popd > /dev/null

source $root/ci/vars.sh

## Install Dependencies ########################################################

pip_binary=$(which pip || which pip3)

mkdir -p vendor
$pip_binary install --download vendor -r requirements.txt

tar -xzvf fdh.sqlite.tar.gz -C data


## Run Tests ###################################################################


## Build #######################################################################

target_files="
data/
pytides/
templates/
vendor/
config.py
forms.py
tides.py
Procfile
requirements.txt
"

zip -r ${APP}.${EXT} ${target_files}
