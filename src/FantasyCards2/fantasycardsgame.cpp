#include "fantasycardsgame.h"
#include "assets.h"
#include <QRandomGenerator>
#include <QDebug>

FantasyCardsGame::FantasyCardsGame()
{

    ++level;
    shuffleEnemy();

    QRandomGenerator rand(42);


    for (int i = 1; i < 6; i++) {
        QString image = Assets::assetList.at(rand.bounded(0,Assets::assetList.length()));
        QString url = "https://mesw.github.io/fantasyarts/faces/"
                + image;
        m_playerCards.append(
                    Card(
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        rand.bounded(0,i),
                        image.remove(".png").remove(".jpg"),
                        url)
                    );
    }
    emit playerChanged();
    setEnemyCardCount(m_enemyCards.length());
    setPlayerCardCount(m_playerCards.length());

}

Card FantasyCardsGame::player() const
{
    if (m_playerCards.length() > 0)
        return m_playerCards.first();
    else
        return Card();
}

Card FantasyCardsGame::enemy() const
{
    if (m_enemyCards.length() > 0)
        return m_enemyCards.first();
    else
        return Card();
}

void FantasyCardsGame::shuffleEnemy() {

    QRandomGenerator rand(69+level);


    for (int i = 0; i < level * level; i++){
        QString image = Assets::assetList.at(rand.bounded(0,Assets::assetList.length()));
        QString url = "https://mesw.github.io/fantasyarts/faces/"
                + image;
        qDebug() << image
                 << url;
        m_enemyCards.append(
                    Card(
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        rand.bounded(level,level * level),
                        image.remove(".png").remove(".jpg"),
                        url)
                    );
    }

    setOver(false);
    emit enemyChanged();
    level++;
}

void FantasyCardsGame::enemySelect(QString statName)
{
    if(m_enemyCards.length() > 0 && m_playerCards.length() > 0)
        if (statName == "strength" && player().strength > enemy().strength)
            win();
        else if (statName == "speed" && player().speed > enemy().speed)
            win();
        else if (statName == "body" && player().body > enemy().body)
            win();
        else if (statName == "love" && player().love > enemy().love)
            win();
        else if (statName == "hate" && player().hate > enemy().hate)
            win();
        else if (statName == "soul" && player().soul > enemy().soul)
            win();
        else if (statName == "coward" && player().coward > enemy().coward)
            win();
        else if (statName == "brave" && player().brave > enemy().brave)
            win();
        else if (statName == "wisdom" && player().wisdom > enemy().wisdom)
            win();
        else if (statName == "cute" && player().cute > enemy().cute)
            win();
        else if (statName == "power" && player().power > enemy().power)
            win();
        else if (statName == "fear" && player().fear > enemy().fear)
            win();
        else if (statName == "intelligence" && player().intelligence > enemy().intelligence)
            win();
        else  if (statName == "magic" && player().magic > enemy().magic)
            win();
        else if (statName == "science" && player().science > enemy().science)
            win();
        else
            lose();

    setEnemyCardCount(m_enemyCards.length());
    setPlayerCardCount(m_playerCards.length());
    if (enemyCardCount() == 0 || playerCardCount() == 0)
        setOver(true);

}

quint16 FantasyCardsGame::playerCardCount() const
{
    return m_playerCardCount;
}

void FantasyCardsGame::setPlayerCardCount(quint16 newPlayerCardCount)
{
    if (m_playerCardCount == newPlayerCardCount)
        return;
    m_playerCardCount = newPlayerCardCount;
    emit playerCardCountChanged();
}

quint16 FantasyCardsGame::enemyCardCount() const
{
    return m_enemyCardCount;
}

void FantasyCardsGame::setEnemyCardCount(quint16 newEnemyCardCount)
{
    if (m_enemyCardCount == newEnemyCardCount)
        return;
    m_enemyCardCount = newEnemyCardCount;
    emit enemyCardCountChanged();
}

quint16 FantasyCardsGame::getLevel() const
{
    return level;
}

void FantasyCardsGame::setLevel(quint16 newLevel)
{
    if (level == newLevel)
        return;
    level = newLevel;
    emit levelChanged();
}

void FantasyCardsGame::resetLevel()
{
    setLevel({}); // TODO: Adapt to use your actual default value
}

void FantasyCardsGame::win() {
    m_playerCards.append(m_playerCards.first());
    m_playerCards.removeFirst();
    m_playerCards.append(m_enemyCards.first());
    m_enemyCards.removeFirst();
    emit playerChanged();
    emit enemyChanged();
    qDebug() << "WIN";
    setWinner(1);
}

void FantasyCardsGame::lose() {
    m_enemyCards.append(m_enemyCards.first());
    m_enemyCards.removeFirst();
    //    m_enemyCards.append(m_playerCards.first());
    m_playerCards.removeFirst();
    emit playerChanged();
    emit enemyChanged();
    qDebug() << "LOSE";
    setWinner(-1);
}

qint8 FantasyCardsGame::winner() const
{
    return m_winner;
}

void FantasyCardsGame::setWinner(qint8 newWinner)
{
    if (m_winner == newWinner)
        return;
    m_winner = newWinner;
    emit winnerChanged();
}

bool FantasyCardsGame::over() const
{
    return m_over;
}

void FantasyCardsGame::setOver(bool newOver)
{
    if (m_over == newOver)
        return;
    m_over = newOver;
    emit overChanged();
}
