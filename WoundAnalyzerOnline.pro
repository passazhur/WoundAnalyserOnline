#-------------------------------------------------
#
# Project created by QtCreator 2016-07-05T13:32:03
#
#-------------------------------------------------
CONFIG += c++11
CONFIG += console

#QT += core
#QT += gui
#QT += printsupport
#QT += sql

#greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = WoundAnalyzerOnline

#Wt Web ToolKit
CONFIG      += no_keywords # so Qt won't #define any non-all-caps 'keywords'
INCLUDEPATH += E:\Wt\Wt_3.3.0_boost_1.54.0_mingw_4.8.0_x32\include\
INCLUDEPATH += E:\Boost\boost_1_54_0
LIBS += E:\Wt\Wt_3.3.0_boost_1.54.0_mingw_4.8.0_x32\lib\libwt.a
LIBS += E:\Wt\Wt_3.3.0_boost_1.54.0_mingw_4.8.0_x32\lib\libwthttp.a
LIBS += E:\Boost\boost_1_54_0\lib\libboost_signals-mgw48-mt-1_54.a
LIBS += E:\Boost\boost_1_54_0\lib\libboost_system-mgw48-mt-1_54.a
LIBS += E:\Boost\boost_1_54_0\lib\libboost_thread-mgw48-mt-1_54.a
LIBS += E:\Boost\boost_1_54_0\lib\libboost_filesystem-mgw48-mt-1_54.a
LIBS += E:\Boost\boost_1_54_0\lib\libboost_regex-mgw48-mt-1_54.a
LIBS += E:\Boost\boost_1_54_0\lib\libboost_random-mgw48-mt-1_54.a
LIBS += E:\Boost\boost_1_54_0\lib\libboost_program_options-mgw48-mt-1_54.a
LIBS += E:\Boost\boost_1_54_0\lib\libboost_date_time-mgw48-mt-1_54.a
LIBS += -lws2_32
LIBS += -lwsock32

#OpenCV
INCLUDEPATH += e:\OpenCV_2.4.13\opencv\localBuild\include
LIBS += e:\OpenCV_2.4.13\opencv\localBuild_x32\lib\libopencv_core2413.dll.a
LIBS += e:\OpenCV_2.4.13\opencv\localBuild_x32\lib\libopencv_highgui2413.dll.a
LIBS += e:\OpenCV_2.4.13\opencv\localBuild_x32\lib\libopencv_imgproc2413.dll.a
LIBS += e:\OpenCV_2.4.13\opencv\localBuild_x32\lib\libopencv_photo2413.dll.a
LIBS += e:\OpenCV_2.4.13\opencv\localBuild_x32\lib\libopencv_video2413.dll.a

#For debugging
CONFIG(debug, release|debug):DEFINES += _DEBUG_MODE

SOURCES += main.cpp\
#    Ui/mainwindow.cpp \
#    DataBase/databasemanager.cpp \
#    Ui/databaseconnectionwidget.cpp \
#    Ui/databaseconnectionedititemwidget.cpp \
#    Image/imagemanager.cpp \
#    Ui/imageinterface.cpp \
#    Ui/settingswidget.cpp \
#    qcustomplot/qcustomplot.cpp \
#    Ui/chartwidget.cpp \
#    qcustomplot/qcpdocumentobject.cpp

HEADERS  += \#Ui/mainwindow.h \
#    DataBase/databasemanager.h \
    Utilities/Logger/logger.h \
#    Utilities/timer.h \
#    Ui/databaseconnectionwidget.h \
#    Ui/databaseconnectioneditwidget.h \
#    Ui/databaseconnectionedititemwidget.h \
#    Ui/databaseconnectioneditsubitemwidget.h \
#    Image/imagemanager.h \
#    Ui/imageinterface.h \
#    Ui/settingswidget.h \
#    Utilities/mathutilities.h \
#    DataBase/databasemodel.h \
#    qcustomplot/qcustomplot.h \
#    Ui/chartwidget.h \
#    qcustomplot/qcpdocumentobject.h \
    Web/webserver.h \
    configurationparameters.h

#FORMS    += Ui/mainwindow.ui \
#    Ui/databaseconnectionwidget.ui \
#    Ui/databaseconnectionedititemwidget.ui \
#    Ui/settingswidget.ui \
#    Ui/chartwidget.ui

#RESOURCES += \
#    woundanalyzer.qrc

#RC_FILE += woundanalyzer.rc