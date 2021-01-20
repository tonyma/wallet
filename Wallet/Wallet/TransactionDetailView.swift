//
//  CourseSectionDetail.swift
//  DesignCodeCourse
//
//  Created by Meng To on 2020-07-24.
//

import SwiftUI

struct TransactionDetailView: View {
    @Environment(\.presentationMode) var presentationMode
    var card:CreditCard
    
    var body: some View {
        ScrollView {
            Image("\(card.image)").resizable().aspectRatio(contentMode: .fit )
                .frame(height: 300)
            VStack(alignment: .leading, spacing: 30) {
                Text("Details here")
            }
        }.padding()
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(card: cardsArray[0])
    }
}
