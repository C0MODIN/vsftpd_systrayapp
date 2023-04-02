 #!/bin/bash

if [ -d /opt/vsftpd_systrayapp ]; then
    echo "..."
else
    sudo mkdir /opt/vsftpd_systrayapp
    echo "Directory in /opt created"
fi

if [ -f /usr/share/applications/vsftpdkde.desktop ]; then
    echo "..."
else
    sudo touch /usr/share/applications/vsftpdkde.desktop
    echo "Desktop file created"
fi

sudo cp -r icons/ main.py /opt/vsftpd_systrayapp && sudo cp vsftpdkde.desktop /usr/share/applications/vsftpdkde.desktop && sudo chmod +x /opt/vsftpd_systrayapp/main.py && sudo chmod a+r /usr/share/applications/vsftpdkde.desktop && sudo ln -s /opt/vsftpd_systrayapp/main.py /usr/local/bin/vsftpdkde
if [ $? -eq 0 ]; then
    echo "Installation succesfully"
fi
