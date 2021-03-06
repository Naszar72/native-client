#!/bin/bash

cd ./app

which node 2>/dev/null
echo NodeJS status = $?
if [ $? -eq 0 ]; then
  node -e "process.exit(Number(process.version.substr(1).split('.')[0]) > 5 ? 0 : 1)"
fi
if [ $? -eq 0 ]; then
  echo "Installer is using your system NodeJS."
  node install.js `which node` $1
else
  MACHINE_TYPE=`uname -m`
  echo "Installer is using the attached NodeJS"
  if [ ${MACHINE_TYPE} == 'x86_64' ]; then
    ../node/x64/node install.js --add_node $1
  else
    ../node/x86/node install.js --add_node $1
  fi
fi
