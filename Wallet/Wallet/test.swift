//
//  test.swift
//  Wallet
//
//  Created by Tony Ma on 21/1/21.
//

import SwiftUI

struct test: View {
    var body: some View {
        NavigationView {
            HStack(alignment: .top) {
            List(transactions) { t in
              
                NavigationLink(destination: TransactionDetailView(card: cardsArray[0])) {
                                            VStack(alignment: .leading){
                                                Text("\(t.title)").font(.system(size: 16, weight: .bold, design: .rounded))
                                                Text("\(t.location)").font(.subheadline)
                                                Text("\(t.date)").font(.caption)
                                            }
                                            Spacer()
                                            Text("\(t.amount)")
                }
            }
            }
            .navigationTitle("Latest Transactions")
        }
//        VStack(alignment: .leading, spacing: 10.0) {
//            Text("Latest Transactions").font(.system(size: 28, weight: .bold, design: .rounded)).frame(maxWidth: .infinity, alignment: .leading)
//            HStack(alignment: .top) {
//                NavigationView {
//                    ForEach(transactions){t in
//                        VStack(alignment: .leading){
//                            Text("\(t.title)").font(.system(size: 16, weight: .bold, design: .rounded))
//                            Text("\(t.location)").font(.subheadline)
//                            Text("\(t.date)").font(.caption)
//                        }
//                        Spacer()
//                        Text("\(t.amount)")
//                    }
//                }
//            }
//        }
//        .padding(.horizontal, 30)
//        .frame(maxWidth: .infinity, maxHeight:  .infinity, alignment: .top)
////        .offset(y: 280 )
//        .background(Color.white)
//        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
//        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        
    }
}

struct test_Previews: PreviewProvider {
    static var previews: some View {
        test()
    }
}


