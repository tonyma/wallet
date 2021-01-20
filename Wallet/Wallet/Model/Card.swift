//
//  Card.swift
//  Wallet
//
//  Created by Tony Ma on 20/1/21.
//

import SwiftUI

struct CreditCard:Identifiable {
    var id = UUID()
    var image: String
    var color: Color
    var show:Bool
}

var cardsArray=[
    CreditCard(image: "Card1", color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), show: false),
    CreditCard(image: "Card2", color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), show: false),
    CreditCard(image: "Card3", color: Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), show: false),
    CreditCard(image: "Card4", color: Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)), show: false),
    CreditCard(image: "Card5", color: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), show: false),
    CreditCard(image: "Card1", color: Color(#colorLiteral(red: 0.2196078449, green: 0.007843137719, blue: 0.8549019694, alpha: 1)), show: false),
    CreditCard(image: "Card2", color: Color(#colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)), show: false),
    CreditCard(image: "Card3", color: Color(#colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1)), show: false),
    CreditCard(image: "Card4", color: Color(#colorLiteral(red: 0.7254902124, green: 0.4784313738, blue: 0.09803921729, alpha: 1)), show: false),
    CreditCard(image: "Card5", color: Color(#colorLiteral(red: 0.1019607857, green: 0.2784313858, blue: 0.400000006, alpha: 1)), show: false)
]

