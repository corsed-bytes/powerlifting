# powerlifting

There is an automated install that does:
1. Download an Installer / Updater / Starter Bash file into current directory
2. Set execution rights to downloaded Bash file
3. Run the installer downloading / preparing specified modules i.e. log-adapter,powerlifting-manager,user-manager
4. Run the final installation with Superuser / Admin rights - unfortunately we wont be able to use Port 80

## Run auto-install on 64-Bit-System with Linux by

``` wget -q https://raw.githubusercontent.com/the-corsed-bytes/powerlifting/master/run.sh && chmod +x ./run.sh && ./run.sh install log-adapter,powerlifting-manager,user-manager && sudo ./run.sh ```

