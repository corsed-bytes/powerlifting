# powerlifting

There is an automated install that does:
1. Download an Installer / Updater / Starter Bash file into current directory
2. Set execution rights to downloaded Bash file
3. Run the installer downloading / preparing specified modules i.e. log-adapter,powerlifting-manager,user-manager
4. Run the final installation with Superuser / Admin rights - unfortunately we wont be able to use Port 80

## Run auto-install on x86-64-System with Linux by

``` wget -q https://raw.githubusercontent.com/the-corsed-bytes/powerlifting/master/run.sh && chmod +x ./run.sh && ./run.sh install log-adapter,powerlifting-manager,user-manager && sudo ./run.sh ```

## Run auto-install on ARMv7-System with Linux by

``` wget -q https://raw.githubusercontent.com/the-corsed-bytes/powerlifting/master/runRasp.sh && chmod +x ./runRasp.sh && ./runRasp.sh install log-adapter,powerlifting-manager,user-manager && sudo ./runRasp.sh ```

## NOTE - Known bugs

Sometimes the part of GUI is not loading - you can see by endless loading circles. In this case please refresh the page. Reason (technical): The microfrontends are loaded by systemjs / canopy tax single spa application on different views that dont clean up very well yet.
