#include "cardstack.h"

CardStack::CardStack(QObject *parent) : QObject(parent), m_card(1,1,1,1,1,1,1,1,1,1)
{

    Card newCard(1,1,1,1,1,1,1,1,1,1);
    m_cards.append(newCard);
}

CardStack::Card CardStack::card() const
{
    return m_card;
}

