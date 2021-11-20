#include "cardrandomizer.h"

#include <QDir>
#include <QFile>
#include <QRandomGenerator>


CardRandomizer::CardRandomizer() : m_randomizer(1)
{
    randomize();
}

qreal CardRandomizer::love() const
{
    return m_love;
}

qreal CardRandomizer::hate() const
{
    return m_hate;
}

qreal CardRandomizer::strength() const
{
    return m_strength;
}

qreal CardRandomizer::speed() const
{
    return m_speed;
}

qreal CardRandomizer::science() const
{
    return m_science;
}

qreal CardRandomizer::magic() const
{
    return m_magic;
}

qreal CardRandomizer::brave() const
{
    return m_brave;
}

qreal CardRandomizer::coward() const
{
    return m_coward;
}

qreal CardRandomizer::cute() const
{
    return m_cute;
}

qreal CardRandomizer::fear() const
{
    return m_fear;
}

void CardRandomizer::randomize()
{
    setLove(m_randomizer.bounded(0,100));
    setHate(m_randomizer.bounded(0,100));

    setStrength(m_randomizer.bounded(0,100));
    setSpeed(m_randomizer.bounded(0,100));

    setScience(m_randomizer.bounded(0,100));
    setMagic(m_randomizer.bounded(0,100));

    setBrave(m_randomizer.bounded(0,100));
    setCoward(m_randomizer.bounded(0,100));

    setCute(m_randomizer.bounded(0,100));
    setFear(m_randomizer.bounded(0,100));


    QList<QString> list;


    list.append(QString("https://mesw.github.io/fantasyarts/faces/the archer of punk in beautiful sacred dome.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the dragon of sports in golden hidden cathedral.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the dragon of techno in beautiful cloud sand dune.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the ghost of peace in horror smoke sea.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the keeper of glass in serene cloud sea.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the knight of thunder in serene underwater forest.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the lion of fitness in burning secret vulcano.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the queen of steampunk in lovely underwater cave.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the spirit of rainbow in lightray sacred church.png"));
    list.append(QString("https://mesw.github.io/fantasyarts/faces/the toad of fitness in rotten secret church.png"));




    setImagePath(list.at(m_randomizer.bounded(0,list.length()-1)));



}

void CardRandomizer::setLove(qreal love)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_love, love))
        return;

    m_love = love;
    emit loveChanged(m_love);
}

void CardRandomizer::setHate(qreal hate)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_hate, hate))
        return;

    m_hate = hate;
    emit hateChanged(m_hate);
}

void CardRandomizer::setStrength(qreal strength)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_strength, strength))
        return;

    m_strength = strength;
    emit strengthChanged(m_strength);
}

void CardRandomizer::setSpeed(qreal speed)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_speed, speed))
        return;

    m_speed = speed;
    emit speedChanged(m_speed);
}

void CardRandomizer::setScience(qreal science)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_science, science))
        return;

    m_science = science;
    emit scienceChanged(m_science);
}

void CardRandomizer::setMagic(qreal magic)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_magic, magic))
        return;

    m_magic = magic;
    emit magicChanged(m_magic);
}

void CardRandomizer::setBrave(qreal brave)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_brave, brave))
        return;

    m_brave = brave;
    emit braveChanged(m_brave);
}

void CardRandomizer::setCoward(qreal coward)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_coward, coward))
        return;

    m_coward = coward;
    emit cowardChanged(m_coward);
}

void CardRandomizer::setCute(qreal cute)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_cute, cute))
        return;

    m_cute = cute;
    emit cuteChanged(m_cute);
}

void CardRandomizer::setFear(qreal fear)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_fear, fear))
        return;

    m_fear = fear;
    emit fearChanged(m_fear);
}

const QString &CardRandomizer::imagePath() const
{
    return m_imagePath;
}

void CardRandomizer::setImagePath(const QString &newImagePath)
{
    if (m_imagePath == newImagePath)
        return;
    m_imagePath = newImagePath;
    emit imagePathChanged();
}
