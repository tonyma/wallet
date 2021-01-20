//
//  ContentView.swift
//  Wallet
//
//  Created by Tony Ma on 20/1/21.
//

import SwiftUI

struct ContentView: View {
    
    @ViewBuilder
    var body: some View {
        ScrollView(showsIndicators: false){
            HeaderView()
            CreditCardListView(cards: cardsArray)
        }
    }
}

let screen = UIScreen.main.bounds
let herizentalMarginWidth: CGFloat = 30
let statusBarHeight: CGFloat = 44

let cardRatio: CGFloat = 0.629
let cardWidth = screen.width - 2 * herizentalMarginWidth
let cardHeight = cardRatio * cardWidth
let cardHeaderHeight: CGFloat = 0.23 * cardHeight

struct CreditCardListView: View {
    var cards:[CreditCard]
    @ViewBuilder
    var body: some View {
        VStack(spacing: 30){
            ForEach(cards) { card in
                GeometryReader { geometry in
                    ZStack{
                        CardView (card: card)
                            .offset(y: geometry.frame(in: .global).minY > 44 ?0 : 44 - geometry.frame(in: .global).minY)
                    }
                    Text("\(Int(geometry.frame(in: .global).minY))")
                }.frame(width:cardWidth,height:cardHeight).border(/*@START_MENU_TOKEN@*/Color.black/*@END_MENU_TOKEN@*/)
            } 
        }.padding(.horizontal, 30)
    }
}

struct HeaderView: View {
    var body: some View {
        GeometryReader { geometry in
            Text("Wallet\(Int(screen.height)) * \(Int(screen.width)) : \(Int(cardHeight))").font(.system(size: 32, weight: .bold, design: .rounded)).frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top,50)
                .padding(.horizontal,herizentalMarginWidth)
                .opacity((Double(geometry.frame(in: .global).minY)+30)/25)
                .offset(y: 50-geometry.frame(in: .global).minY < 50 ? 0: -geometry.frame(in: .global).minY )
        }.frame(height:88)
    }
}

struct ContentViewPreviews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
