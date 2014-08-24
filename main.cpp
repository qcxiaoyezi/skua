#include <QApplication>
#include <QQmlApplicationEngine>
#include "cursor.h"
#include <QQmlContext>
#include <QCursor>



int main(int argc, char *argv[])
{
    QApplication app(argc, argv);

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:///main.qml")));
    engine.rootContext()->setContextProperty("G_Cursor",new Cursor);


    return app.exec();
}
