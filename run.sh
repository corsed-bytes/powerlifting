#!/bin/bash

echo 'Starting command line manager...'

cdn='https://github.com/the-corsed-bytes/powerlifting/raw/master/';

case "${BASH_ARGV[1]}" in
"install")
    echo 'Install mode - please run like: "run install log-adapter,persistence-adapter,etc"'

    IFS=',' read -ra ADDR <<< "package-manager,system-manager,${BASH_ARGV[0]}"
    for module in "${ADDR[@]}"; do
        rm -rf "./$module"
        mkdir "./$module"
        cd "./$module"
        wget -q "$cdn$module/$module" && chmod +x "$module";
#        if [[ $module == *"-manager"* ]]; then
            wget -q "$cdn$module/deploy.tar.gz" && tar -xzvf "deploy.tar.gz";
#        fi
        mkdir "./config"
        cd "./config"
        wget -q "$cdn$module/config/config.json"
#        if [[ $module == *"-manager"* ]]; then
            wget -q "$cdn$module/config/access.json"
            wget -q "$cdn$module/config/apps.json"
#        fi
        cd "../../"
    done
    echo "{\"log_port\": \"8083\", \"ip\": \"localhost\", \"port\": \"8081\", \"modules_root\": \"$PWD\", \"modules_available\": \"${BASH_ARGV[0]}\",
        \"modules_autostart\": \"system-manager\"}" > "./package-manager/config/config.json"
    ;;
"update")
    echo 'Update mode - please run like: "run update log-adapter,persistence-adapter,etc"'

    IFS=',' read -ra ADDR <<< "${BASH_ARGV[0]}"
    for module in "${ADDR[@]}"; do
        rm -rf "./$module/$module"
        cd "./$module"
        wget -q "$cdn$module/$module" && chmod +x "$module";
        cd "../"
    done
    ;;
*)
    echo 'Serve mode'

    cd "./package-manager"
    ./package-manager
    ;;
esac
