#include "cardrandomizer.h"
#include "cardstack.h"

#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>
#include <QtQml>

int main(int argc, char *argv[])
{
#if QT_VERSION < QT_VERSION_CHECK(6, 0, 0)
    QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#endif

    QGuiApplication app(argc, argv);

    //////////////////////////////
    QScopedPointer<CardRandomizer> worldCardRandomizer(new CardRandomizer);
    QScopedPointer<CardRandomizer> playerCardRandomizer(new CardRandomizer);

    QScopedPointer<CardStack> playerCards(new CardStack);


    QQmlApplicationEngine engine;

    //////////////////////////
    qmlRegisterSingletonInstance("My.example.playerCardRandomizer", 1, 0, "PlayerCardRandomizer", playerCardRandomizer.get());
    qmlRegisterSingletonInstance("My.example.worldCardRandomizer", 1, 0, "WorldCardRandomizer", worldCardRandomizer.get());

    qmlRegisterSingletonInstance("My.example.playerCards", 1, 0, "PlayerCards", playerCards.get());


    const QUrl url(QStringLiteral("qrc:/main.qml"));
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreated,
                     &app, [url](QObject *obj, const QUrl &objUrl) {
        if (!obj && url == objUrl)
            QCoreApplication::exit(-1);
    }, Qt::QueuedConnection);



    engine.load(url);

    return app.exec();
}
