 #!/bin/bash

sudo rm -rf /opt/vsftpd_systrayapp/
sudo rm /usr/share/applications/vsftpdkde.desktop
sudo rm /usr/local/bin/vsftpdkde
sudo rm -rf ~/.local/share/icons/hicolor/48x48/icons_vsftpdkde
if [ $? -eq 0 ]; then
    echo "Uninstallation succesfully"
fi
