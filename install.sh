#!/bin/bash

# Create /opt/vsftpd_systrayapp folder
if [ -d /opt/vsftpd_systrayapp ]; then
    sudo rm -rf /opt/vsftpd_systrayapp
else
    sudo mkdir /opt/vsftpd_systrayapp
    echo "Directory in /opt created"
fi

# Create ~/.local/share/icons/hicolor/48x48/icons_vsftpdkde folder
if [ -d ~/.local/share/icons/hicolor/48x48/icons_vsftpdkde ]; then
    echo "..."
else
    sudo mkdir /opt/vsftpd_systrayapp
    echo "Directory in ~/.local/share/icons/hicolor/48x48/icons_vsftpdkde created"
fi

# Create /usr/share/applications/vsftpdkde.desktop folder
if [ -f /usr/share/applications/vsftpdkde.desktop ]; then
    echo "..."
else
    sudo touch /usr/share/applications/vsftpdkde.desktop
    echo "Desktop file created"
fi

sudo cp -r vsftpdkde.py /opt/vsftpd_systrayapp && sudo cp -r icons_vsftpdkde/ ~/.local/share/icons/hicolor/48x48 && sudo cp vsftpdkde.desktop /usr/share/applications/vsftpdkde.desktop && sudo chmod +x /opt/vsftpd_systrayapp/vsftpdkde.py && sudo chmod a+r /usr/share/applications/vsftpdkde.desktop && sudo ln -s /opt/vsftpd_systrayapp/vsftpdkde.py /usr/local/bin/vsftpdkde
if [ $? -eq 0 ]; then
    echo "Installation succesfully"
fi
