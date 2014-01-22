#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent) :
    QMainWindow(parent),
    ui(new Ui::MainWindow)
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

void MainWindow::on_pushButton_clicked()
{
    //if it's not installed
    system ("bash setFolder.sh");
    //if it's installed
    //system("cd /usr/local/bin && bash setFolder.sh");
}


void MainWindow::on_pushButton_4_clicked()
{
    system("bash downloaded.sh");
    //system("cd /usr/local/bin && bash downloaded.sh");
}



void MainWindow::on_pushButton_3_clicked()
{
     system("bash tube.sh");
    //system("cd /usr/local/bin && bash tube.sh");
}


void MainWindow::on_pushButton_5_clicked()
{
    system("bash latest.sh");
    //system("cd /usr/local/bin && bash latest.sh");
}



void MainWindow::on_pushButton_6_clicked()
{
    system("bash give_the_start.sh");
    //system("cd /usr/local/bin && bash give_the_start.sh");
}


void MainWindow::on_pushButton_7_clicked()
{
    system("bash youtube.sh");
    //system("cd /usr/local/bin && bash youtube.sh");
}


void MainWindow::on_pushButton_8_clicked()
{
    system("bash playlist.sh");
    //system("cd /usr/local/bin && bash playlist.sh");
}



void MainWindow::on_pushButton_9_clicked()
{
    system("bash playlistc.sh");
    //system("cd /usr/local/bin && bash playlistc.sh");
}


void MainWindow::on_pushButton_10_clicked()
{
    system("bash song.sh");
    //system ("cd /usr/local/bin && bash song.sh");
}
