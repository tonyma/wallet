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
    var transaction: Transaction
    
    var body: some View {
        ScrollView {
            VStack (spacing:16) {
                VStack(spacing:4){
                    Text("\(transaction.amount)").font(.system(size: 40, weight: .bold, design: .rounded))
                    Text("\(transaction.title), \(transaction.location)").font(.subheadline)
                    Text("\(transaction.date)").font(.caption)
                }
                VStack (alignment:.leading){
                    Text("Status: Pending").font(.system(size: 20, weight: .bold, design: .rounded))
                    Text("\(transaction.location)").font(.subheadline)
                    Divider().background(Color.yellow)
                    HStack {
                        Text("Total")
                        Spacer()
                        Text("\(transaction.amount)").font(.caption)
                    }
                }.padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                
                NavigationLink(destination: Text("Coles Details Page")){
                VStack (alignment:.leading){
                    Image("Coles").resizable().aspectRatio(contentMode: .fit )
                    HStack {
                        Text("Coles").foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                        Spacer()
                        Image(systemName: "info.circle.fill").foregroundColor(Color(#colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)))
                    }.padding(.horizontal).padding(.bottom,16)
                }
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
                }
                VStack (alignment:.leading){
                    NavigationLink(destination: Text("Report an issue Page")){
                        HStack {
                            Text("Report an issue").font(.system(size: 18, weight: .bold, design: .rounded))
                                .frame(maxWidth:.infinity,alignment: .leading)
                            Spacer()
                            Image(systemName: "exclamationmark.triangle.fill")
                        }
                    }
                }.padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 20)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            }.padding(.horizontal,16)
        }
        Spacer()
    }
}

struct TransactionDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TransactionDetailView(card: cardsArray[0], transaction: transactions[0])
    }
}
