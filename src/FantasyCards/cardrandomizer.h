#ifndef CARDRANDOMIZER_H
#define CARDRANDOMIZER_H

#include <QObject>
#include <QRandomGenerator>

class CardRandomizer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(qreal love READ love WRITE setLove NOTIFY loveChanged)
    Q_PROPERTY(qreal hate READ hate WRITE setHate NOTIFY hateChanged)

    Q_PROPERTY(qreal strength READ strength WRITE setStrength NOTIFY strengthChanged)
    Q_PROPERTY(qreal speed READ speed WRITE setSpeed NOTIFY speedChanged)

    Q_PROPERTY(qreal intelligence READ intelligence WRITE setIntelligence NOTIFY intelligenceChanged)
    Q_PROPERTY(qreal magic READ magic WRITE setMagic NOTIFY magicChanged)

    Q_PROPERTY(qreal brave READ brave WRITE setBrave NOTIFY braveChanged)
    Q_PROPERTY(qreal coward READ coward WRITE setCoward NOTIFY cowardChanged)

    Q_PROPERTY(qreal cute READ cute WRITE setCute NOTIFY cuteChanged)
    Q_PROPERTY(qreal fear READ fear WRITE setFear NOTIFY fearChanged)

    qreal m_love;
    qreal m_hate;
    qreal m_strength;
    qreal m_speed;
    qreal m_intelligence;
    qreal m_magic;
    qreal m_brave;
    qreal m_coward;
    qreal m_cute;
    qreal m_fear;

    QRandomGenerator m_randomizer;

public:
    CardRandomizer();

    qreal love() const;
    qreal hate() const;
    qreal strength() const;
    qreal speed() const;
    qreal intelligence() const;
    qreal magic() const;
    qreal brave() const;
    qreal coward() const;
    qreal cute() const;
    qreal fear() const;

    Q_INVOKABLE void randomize();

public slots:
    void setLove(qreal love);
    void setHate(qreal hate);
    void setStrength(qreal strength);
    void setSpeed(qreal speed);
    void setIntelligence(qreal intelligence);
    void setMagic(qreal magic);
    void setBrave(qreal brave);
    void setCoward(qreal coward);
    void setCute(qreal cute);
    void setFear(qreal fear);

signals:
    void loveChanged(qreal love);
    void hateChanged(qreal hate);
    void strengthChanged(qreal strength);
    void speedChanged(qreal speed);
    void intelligenceChanged(qreal intelligence);
    void magicChanged(qreal magic);
    void braveChanged(qreal brave);
    void cowardChanged(qreal coward);
    void cuteChanged(qreal cute);
    void fearChanged(qreal fear);
};

#endif // CARDRANDOMIZER_H
