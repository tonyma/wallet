//
//  CardDetailView.swift
//  Wallet
//
//  Created by Tony Ma on 20/1/21.
//



import SwiftUI

struct CardList: View {
    @State var cards=cardsArray
    @State var active = false
    @State var activeIndex = -1
    @State var activeView = CGSize.zero
    
    var body: some View {
        ZStack {
            Color.black.opacity(Double(self.activeView.height/500))
                .animation(.linear)
                .edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack(spacing: 30) {
                    GeometryReader { geometry in
                        Text("Wallet").font(.system(size: 32, weight: .bold, design: .rounded)).frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.top,50)
                            .padding(.horizontal,herizentalMarginWidth)
                            .opacity((Double(geometry.frame(in: .global).minY)+30)/25)
                            .offset(y: geometry.frame(in: .global).minY > 0 ? 0: -geometry.frame(in: .global).minY )
                            .animation(.none)
                    }.frame(height:88)
                    
                    ForEach(cardsArray.indices, id: \.self) { index in
                        GeometryReader { geometry in
                            CreditCardDetailView(
                                show: self.$cards[index].show,
                                card: self.cards[index],
                                active: self.$active,
                                index: index,
                                activeIndex: self.$activeIndex,
                                activeView: self.$activeView
                            )
                                .offset(y: self.cards[index].show ? -geometry.frame(in: .global).minY : -20)
                                .opacity(self.activeIndex != index && self.active ? 0 : 1)
                                .scaleEffect(self.activeIndex != index && self.active ? 0.5 : 1)
                                .offset(x: self.activeIndex != index && self.active ? screen.width : 0)
                        }
                        .frame(height: 210)
                        .frame(maxWidth: self.cards[index].show ? .infinity : screen.width - 60)
                        .zIndex(self.cards[index].show ? 1 : 0)
                    }
                }
                .frame(width: screen.width)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            }
            .statusBar(hidden: active ? true : false)
            .animation(.linear)
        }
    }
}

struct CardList_Previews: PreviewProvider {
    static var previews: some View {
        CardList()
    }
}

struct CreditCardDetailView: View {
    @Binding var show: Bool
    var card: CreditCard
    @Binding var active: Bool
    var index: Int
    @Binding var activeIndex: Int
    @Binding var activeView: CGSize
    
    var body: some View {
        ZStack(alignment: .top) {
            TransactionListView(show: $show, card: card)
            
            VStack {
                Image("\(card.image)").resizable().aspectRatio(contentMode: .fit )
            }
            .padding(show ? 30 : 20)
            .frame(width: show ? screen.width : screen.width - 60, height: show ? screen.height : 280)
            .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? 300 : 220)
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: card.color.opacity(0.3), radius: 20, x: 0, y: 20)
            .shadow(color: card.color.opacity(0.1), radius: 1, x: 0, y: 1)
            .gesture(
                show ?
                DragGesture().onChanged { value in
                    guard value.translation.height < 300 else { return }
                    guard value.translation.height > 0 else { return }
                    
                    self.activeView = value.translation
                }
                .onEnded { value in
                    if self.activeView.height > 50 {
                        self.show = false
                        self.active = false
                        self.activeIndex = -1
                    }
                    self.activeView = .zero
                }
                : nil
            )
            .onTapGesture {
                self.show.toggle()
                self.active.toggle()
                if self.show {
                    self.activeIndex = self.index
                } else {
                    self.activeIndex = -1
                }
            }
        }
        .frame(height: show ? screen.height : 280)
        .scaleEffect(1 - self.activeView.height / 1000)
        .rotation3DEffect(Angle(degrees: Double(self.activeView.height / 10)), axis: (x: 0, y: 10.0, z: 0))
        .hueRotation(Angle(degrees: Double(self.activeView.height)))
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
        .gesture(
            show ?
            DragGesture().onChanged { value in
                guard value.translation.height < 300 else { return }
                guard value.translation.height > 0 else { return }
                
                self.activeView = value.translation
            }
            .onEnded { value in
                if self.activeView.height > 50 {
                    self.show = false
                    self.active = false
                    self.activeIndex = -1
                }
                self.activeView = .zero
            }
            : nil
        )
        .edgesIgnoringSafeArea(.all)
    }
}



let screen = UIScreen.main.bounds
let herizentalMarginWidth: CGFloat = 30
let statusBarHeight: CGFloat = 44

struct TransactionListView: View {
    @Binding var show:Bool
    @State var showModal = false
    @State var card: CreditCard
    var body: some View {
        VStack(alignment: .leading, spacing: 10.0) {
            Text("Latest Transactions").font(.system(size: 28, weight: .bold, design: .rounded)).frame(maxWidth: .infinity, alignment: .leading)
            ForEach(transactions){t in
                HStack {
                    VStack(alignment: .leading){
                        
                        Text("\(t.title)").font(.system(size: 16, weight: .bold, design: .rounded))
                        Text("\(t.location)").font(.subheadline)
                        Text("\(t.date)").font(.caption)
                    }
                    Spacer()
                    Text("\(t.amount)")
                }.sheet(isPresented: $showModal) {
                    TransactionDetailView(card:card)
                }.onTapGesture {
                    showModal = true
                }
                Divider()
            }
        }
        .padding(.horizontal, 30)
        .frame(maxWidth: show ? .infinity : screen.width - 60, maxHeight: show ? .infinity : 280, alignment: .top)
        .offset(y: show ? 320 : 0)
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
        .shadow(color: Color.black.opacity(0.2), radius: 20, x: 0, y: 20)
        .opacity(show ? 1 : 0)
    }
}
