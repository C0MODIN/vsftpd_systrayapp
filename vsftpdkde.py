#!/usr/bin/python
import pathlib
import subprocess
from PyQt5.QtWidgets import QApplication, QMenu, QAction, QSystemTrayIcon
from PyQt5.QtGui import QIcon
from PyQt5.QtCore import QTimer

"""
App by C0MODIN
"""

icon_green = pathlib.Path("icons/vsftpdkde_green.png").resolve()
icon_red = pathlib.Path("icons/vsftpdkde_red.png").resolve()
icon_black = pathlib.Path("icons/vsftpdkde_black.png").resolve()
icon_white = pathlib.Path("icons/vsftpdkde_white.png").resolve()

def start_vsftpd():
    result = subprocess.run(['systemctl', 'start', 'vsftpd'])
    if result.returncode == 0:
        tray_icon.setIcon(QIcon(str(icon_green)))
    else:
        tray_icon.setIcon(QIcon(str(icon_red)))

def stop_vsftpd_proccess():
    result = subprocess.run(['systemctl', 'stop', 'vsftpd'])
    if result.returncode == 0:
        tray_icon.setIcon(QIcon(str(icon_red)))
    else:
        tray_icon.setIcon(QIcon(str(icon_green)))

def check_vsftpd():
    # ejecutar el comando "systemctl start vsftpd"
    result = subprocess.run(['systemctl', 'status', 'vsftpd'], capture_output=True)
    # verificar el valor de retorno
    if result.returncode == 0:
        tray_icon.setIcon(QIcon(str(icon_green)))
    else:
        tray_icon.setIcon(QIcon(str(icon_red)))

app = QApplication([])
tray_icon = QSystemTrayIcon(QIcon(str(icon_white)), parent=None)
tray_icon.show()

# crear un objeto QMenu para el menú contextual
menu = QMenu()
tray_icon.setContextMenu(menu)

# agregar una acción de menú para iniciar vsftpd
start_action = QAction('Start vsftpd', parent=menu)
start_action.triggered.connect(start_vsftpd)
menu.addAction(start_action)

# agregar una acción de menú para frenar vsftpd
stop_action = QAction('Stop vsftpd', parent=menu)
stop_action.triggered.connect(stop_vsftpd_proccess)
menu.addAction(stop_action)

#agregar una accion para salir
action = QAction("Quit", app)
action.triggered.connect(app.quit)
menu.addAction(action)

# configurar un temporizador para comprobar vsftpd cada 60 segundos
timer = QTimer()
timer.timeout.connect(check_vsftpd)
timer.start(60000)

app.exec_()
