#ifndef CARDRANDOMIZER_H
#define CARDRANDOMIZER_H

#include <QObject>
#include <QRandomGenerator>
#include <QString>

class CardRandomizer : public QObject
{
    Q_OBJECT

    Q_PROPERTY(qreal love READ love WRITE setLove NOTIFY loveChanged)
    Q_PROPERTY(qreal hate READ hate WRITE setHate NOTIFY hateChanged)

    Q_PROPERTY(qreal strength READ strength WRITE setStrength NOTIFY strengthChanged)
    Q_PROPERTY(qreal speed READ speed WRITE setSpeed NOTIFY speedChanged)

    Q_PROPERTY(qreal science READ science WRITE setScience NOTIFY scienceChanged)
    Q_PROPERTY(qreal magic READ magic WRITE setMagic NOTIFY magicChanged)

    Q_PROPERTY(qreal brave READ brave WRITE setBrave NOTIFY braveChanged)
    Q_PROPERTY(qreal coward READ coward WRITE setCoward NOTIFY cowardChanged)

    Q_PROPERTY(qreal cute READ cute WRITE setCute NOTIFY cuteChanged)
    Q_PROPERTY(qreal fear READ fear WRITE setFear NOTIFY fearChanged)

    Q_PROPERTY(QString imagePath READ imagePath WRITE setImagePath NOTIFY imagePathChanged)


    qreal m_love;
    qreal m_hate;
    qreal m_strength;
    qreal m_speed;
    qreal m_science;
    qreal m_magic;
    qreal m_brave;
    qreal m_coward;
    qreal m_cute;
    qreal m_fear;

    QString m_imagePath;

    QRandomGenerator m_randomizer;

public:
    CardRandomizer();

    qreal love() const;
    qreal hate() const;
    qreal strength() const;
    qreal speed() const;
    qreal science() const;
    qreal magic() const;
    qreal brave() const;
    qreal coward() const;
    qreal cute() const;
    qreal fear() const;

    Q_INVOKABLE void randomize();

    const QString &imagePath() const;
    void setImagePath(const QString &newImagePath);

public slots:
    void setLove(qreal love);
    void setHate(qreal hate);
    void setStrength(qreal strength);
    void setSpeed(qreal speed);
    void setScience(qreal science);
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
    void scienceChanged(qreal science);
    void magicChanged(qreal magic);
    void braveChanged(qreal brave);
    void cowardChanged(qreal coward);
    void cuteChanged(qreal cute);
    void fearChanged(qreal fear);
    void imagePathChanged();
};

#endif // CARDRANDOMIZER_H
