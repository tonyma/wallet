//
//  CardView.swift
//  Wallet
//
//  Created by Tony Ma on 20/1/21.
//

import SwiftUI

struct CardView: View {
    var card:CreditCard
    var body: some View {
        VStack{
            Image("\(card.image)").resizable().aspectRatio(contentMode: .fit )
        }.frame(maxWidth: .infinity)
        .shadow(color: card.color.opacity(0.1), radius: 1, x: 0, y: 1)
        .shadow(color: card.color.opacity(0.2), radius: 10, x: 0, y: 10)
        
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView(card: cardsArray[0])
    }
}
