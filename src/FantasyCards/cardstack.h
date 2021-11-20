#ifndef CARDSTACK_H
#define CARDSTACK_H

#include <QObject>
#include <QPointer>
#include <QQueue>


class CardStack : public QObject
{
    Q_OBJECT

    Q_PROPERTY(Card card READ card NOTIFY cardChanged)

private:
    struct Card {
        Q_GADGET
    public:
        qreal love;
        qreal hate;
        qreal strength;
        qreal speed;
        qreal science;
        qreal magic;
        qreal brave;
        qreal coward;
        qreal cute;
        qreal fear;
        QString imagePath;
        Card(qreal love, qreal hate,
             qreal strength, qreal speed,
             qreal science, qreal magic,
             qreal brave, qreal coward,
             qreal cute, qreal fear)
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
        }
    };

    QQueue<Card> m_cards;
    Card m_card;

    QPointer<CardStack> m_opponent;

public:
    explicit CardStack(QObject *parent = nullptr);


    Card card() const;


signals:

    void cardChanged();
};

#endif // CARDSTACK_H
