//
//  Transaction.swift
//  Wallet
//
//  Created by Tony Ma on 20/1/21.
//

import SwiftUI



struct Transaction:Identifiable {
    var id = UUID()
    var title: String
    var location: String
    var date: String
    var amount: String
}

var transactions=[
    Transaction(title: "Le Gou Supermarket", location: "Hurstville, NSW", date: "Sunday", amount: "$20.69"),
    Transaction(title: "Coles Supermarket", location: "Burwood, NSW", date: "15/1/21", amount: "$41.84"),
    Transaction(title: "Tong Li Supermarket", location: "Arncliffe, NSW", date: "10/1/21", amount: "$16.55"),
    Transaction(title: "9 Degree", location: "Lane Cove West, NSW", date: "5/1/21", amount: "$22.30"),
    Transaction(title: "9 Degree", location: "Lane Cove West, NSW", date: "2/1/21", amount: "$25.30"),
    Transaction(title: "KFC", location: "Waterloo, NSW", date: "1/1/21", amount: "$9.95"),
    Transaction(title: "Coles Supermarket", location: "Hurstville, NSW", date: "29/12/20", amount: "$18.00")
//    ,
//    Transaction(title: "Le Gou Supermarket", location: "Hurstville, NSW", date: "20/12/20", amount: "$20.00"),
//    Transaction(title: "Indoor Climbing GYM", location: "St Peter, NSW", date: "26/12/20", amount: "$20.00"),
//    Transaction(title: "David Jones", location: "Sydney, NSW", date: "23/12/20", amount: "$288.99")
]
