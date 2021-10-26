#include "cardrandomizer.h"

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

qreal CardRandomizer::intelligence() const
{
    return m_intelligence;
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

    setIntelligence(m_randomizer.bounded(0,100));
    setMagic(m_randomizer.bounded(0,100));

    setBrave(m_randomizer.bounded(0,100));
    setCoward(m_randomizer.bounded(0,100));

    setCute(m_randomizer.bounded(0,100));
    setFear(m_randomizer.bounded(0,100));

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

void CardRandomizer::setIntelligence(qreal intelligence)
{
    qWarning("Floating point comparison needs context sanity check");
    if (qFuzzyCompare(m_intelligence, intelligence))
        return;

    m_intelligence = intelligence;
    emit intelligenceChanged(m_intelligence);
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
