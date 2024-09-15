#include "mainwindow.h"
#include "ui_mainwindow.h"

#include <QQuickItem>

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent)
    , ui(new Ui::MainWindow)
{
    ui->setupUi(this);
    ui->quickWidget_MapView->setSource(QUrl(QStringLiteral("qrc:/QmlMap.qml")));
    ui->quickWidget_MapView->show();

    auto Obje = ui->quickWidget_MapView->rootObject();
    connect(this, SIGNAL(setCenterPosition(QVariant,QVariant)), Obje, SLOT(on_setCenterPosition(QVariant,QVariant)));
    connect(this, SIGNAL(setLocationMarking(QVariant,QVariant)), Obje, SLOT(on_setLocationMarking(QVariant,QVariant)));

    emit setCenterPosition(-7.317415,112.726058);
    emit setLocationMarking(-7.317415,112.726058);
    emit setLocationMarking(-7.317235,112.726112);
}

MainWindow::~MainWindow()
{
    delete ui;
}
