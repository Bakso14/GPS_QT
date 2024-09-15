# -*- coding: utf-8 -*-
"""
Created on Sun Sep 15 04:34:55 2024

@author: vivobook
"""

from PyQt5 import QtWidgets
from PyQt5.QtWidgets import QApplication, QMainWindow
import sys

class MyWindow(QMainWindow):
    def __init__(self):
        super(MyWindow, self).__init__()
        self.setGeometry(1500,200,300,300)
        self.setWindowTitle("Coba Sayyid")
        self.initUI()
    
    def initUI(self):
        self.label = QtWidgets.QLabel(self)
        self.label.setText("Mencoba coba")
        self.label.move(50,50)
        
        self.b1 = QtWidgets.QPushButton(self)
        self.b1.setText("Pencet")
        self.b1.clicked.connect(self.clicked)
        
    def clicked(self):
        self.label.setText("You pressed the button")
        self.update()
        
    def update(self):
        self.label.adjustSize()
        

def clicked():
    print("Clicked")

def window():
    app = QApplication(sys.argv)
    win = MyWindow()
    
    win.show()
    sys.exit(app.exec_())
    
    
window()