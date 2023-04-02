 #!/bin/bash

sudo rm -rf /opt/vsftpd_systrayapp/
sudo rm /usr/share/applications/vsftpdkde.desktop
sudo rm /usr/local/bin/vsftpdkde
if [ $? -eq 0 ]; then
    echo "Uninstallation succesfully"
fi
