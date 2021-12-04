#ifndef FANTASYCARDSGAME_H
#define FANTASYCARDSGAME_H

#include <QObject>

#include "assets.h"

struct Card {
    Q_GADGET
    Q_PROPERTY(qreal love MEMBER love)
    Q_PROPERTY(qreal soul MEMBER soul)
    Q_PROPERTY(qreal hate MEMBER hate)
    Q_PROPERTY(qreal strength MEMBER strength)
    Q_PROPERTY(qreal body MEMBER body)
    Q_PROPERTY(qreal speed MEMBER speed)
    Q_PROPERTY(qreal science MEMBER science)
    Q_PROPERTY(qreal intelligence MEMBER intelligence)
    Q_PROPERTY(qreal magic MEMBER magic)
    Q_PROPERTY(qreal brave MEMBER brave)
    Q_PROPERTY(qreal wisdom MEMBER wisdom)
    Q_PROPERTY(qreal coward MEMBER coward)
    Q_PROPERTY(qreal cute MEMBER cute)
    Q_PROPERTY(qreal power MEMBER power)
    Q_PROPERTY(qreal fear MEMBER fear)
    Q_PROPERTY(QString cardName MEMBER cardName)
    Q_PROPERTY(QString imagePath MEMBER imagePath)


public:
    qreal love;
    qreal soul;
    qreal hate;

    qreal strength;
    qreal body;
    qreal speed;

    qreal science;
    qreal intelligence;
    qreal magic;

    qreal brave;
    qreal wisdom;
    qreal coward;


    qreal cute;
    qreal power;
    qreal fear;

    QString imagePath;
    QString cardName;

    Card() {};
    Card(qreal love, qreal hate,
         qreal strength, qreal speed,
         qreal science, qreal magic,
         qreal brave, qreal coward,
         qreal cute, qreal fear, QString cardName, QString imagePath)
    {
        this->love = love;
        this->hate = hate;
        this->strength = strength;
        this->speed = speed;
        this->science = science;
        this->magic = magic;
        this->brave = brave;
        this->coward = coward;
        this->cute = cute;
        this->fear = fear;

        this->body = abs(speed - strength);
        this->soul = abs(love-hate);
        this->intelligence = abs(magic-science);
        this->wisdom = abs(coward-brave);
        this->power = abs(cute-fear);
        this->cardName = cardName;
        this->imagePath = imagePath;
    }
};

class FantasyCardsGame : public QObject
{

    Q_OBJECT

    Q_PROPERTY(Card player READ player NOTIFY playerChanged)

    Q_PROPERTY(Card enemy READ enemy NOTIFY enemyChanged)

    Q_PROPERTY(qreal winner READ winner WRITE setWinner NOTIFY winnerChanged)

    Q_PROPERTY(quint16 playerCardCount READ playerCardCount WRITE setPlayerCardCount NOTIFY playerCardCountChanged)

    Q_PROPERTY(quint16 enemyCardCount READ enemyCardCount WRITE setEnemyCardCount NOTIFY enemyCardCountChanged)

    Q_PROPERTY(bool over READ over WRITE setOver NOTIFY overChanged)

    Q_PROPERTY(quint16 level READ getLevel WRITE setLevel RESET resetLevel NOTIFY levelChanged)

    quint16 level = 1;

public:


private:
    QList<Card> m_playerCards;
    QList<Card> m_enemyCards;

    quint16 m_playerCardCount;
    quint16 m_enemyCardCount;


    void win();
    void lose();
    qint8 m_winner = 0;


    bool m_over = false;



public:
    FantasyCardsGame();


    qint8 winner() const;
    void setWinner(qint8 newWinner);

    quint16 playerCardCount() const;
    void setPlayerCardCount(quint16 newPlayerCardCount);

    quint16 enemyCardCount() const;
    void setEnemyCardCount(quint16 newEnemyCardCount);

    bool over() const;
    void setOver(bool newOver);

    quint16 getLevel() const;
    void setLevel(quint16 newLevel);
    void resetLevel();

public slots:

    Card player() const;
    Card enemy() const;

    void enemySelect(QString statName);
    void shuffleEnemy();

signals:
    void playerChanged();
    void enemyChanged();
    void winnerChanged();
    void playerCardCountChanged();
    void enemyCardCountChanged();
    void overChanged();
    void levelChanged();
};

#endif // FANTASYCARDSGAME_H
