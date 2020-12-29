//
//  ContentView.swift
//  FinTraker
//
//  Created by Joseph Taylor on 21/11/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import SwiftUI
import Combine


//used to vreate calendar object at the top of the view below the title
class HomeViewModel: ObservableObject {
    lazy var formatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "E  d"
        return formatter
    }()
}

struct HomeView: View {
    
    //The state checks
    @State var showingEditPopUp = false
    @State var showingAddPopUp = false
    @State var itemList = [Item]()
    @StateObject var itemStore = ItemStore()
    @State private var showCircle = false
    @StateObject var viewModel = HomeViewModel()
    let dates = Dates.generateDays()
    
    var numberOfItems: Int {
        return itemStore.items.count
    }
    
    var numberOfItemsCompleted: Int {
        return itemStore.items.count/2
    }
    var percentage: Int {
        return Int(Double(numberOfItemsCompleted)/(Double(numberOfItems == 0 ? 1 : numberOfItems)) * 100)
    }
    
    var body: some View {
        
        //Gradient for background
        ZStack {
            VStack {
            AngularGradient(gradient: Gradient(colors: [.blue, .purple, .pink, .purple, .blue]), center: .center)
            }.ignoresSafeArea(.all)
            
            //Title
        VStack {
                Text("ChekList").foregroundColor(.white)
                    .font(.system(size: 40))
                    .fontWeight(.heavy)
                    .padding(.top, 400)
                    .padding(.trailing, 180)
                Text("Your week").foregroundColor(.white)
                    .font(.system(size: 24))
                    .fontWeight(.medium)
                    .padding(.trailing, 230)
            
            
            //ScrollView containing dates for the next 8 days
            ScrollView(.horizontal) {
                HStack(spacing: 10) {
                    ForEach(dates, id: \.timeIntervalSince1970) { date in
                        Text("\(viewModel.formatter.string(from: date))")
                            .foregroundColor(.white)
                            .font(.system(size: 28))
                            .fontWeight(.bold)
                            .padding(.leading, 5)
                            .frame(width: 70, height: 70)
                            .background(Color.white.opacity(0.3))
                            .cornerRadius(10)
                            .shadow(color: Color.white.opacity(0.1), radius: 3, x: 2, y: 2)
                    }
                }
            }
            .padding(.leading, 80)
            .padding(.trailing, 80)

                //Task completed counter
                ZStack {
                    VStack {
                        HStack {
                            VStack {
                                Text("Tasks completed:").foregroundColor(.white)
                                    .font(.system(size: 20))
                                    .fontWeight(.heavy)
                                    .padding(.top, 10)
                                
                                
                                //Text displaying proportion of completed jobs
                                Text("\(numberOfItemsCompleted)/\(numberOfItems)")
                                    .font(.system(size: 60))
                                    .fontWeight(.bold)
                                    .foregroundColor(.white)
                                    .font(.title)
                                    .padding(.trailing, 20)
                            }
                            .padding(.trailing, 30)
                                
                            
                            //Cirlce graphic showing task completed/total tasks
                                VStack {
                                    ZStack {
                                        Circle()
                                            .trim(from: showCircle ? CGFloat(1 - (Double(percentage)/100)) : 1, to: 1)
                                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(Color.white)
                                            .rotationEffect(.degrees(90))
                                            .rotation3DEffect(.degrees(180), axis: (x: 1, y: 0, z: 0))
                                            .animation(Animation.easeInOut(duration: 2))
                                            .onAppear() {
                                            self.showCircle.toggle()
                                        }
                                        Circle()
                                            .stroke(style: StrokeStyle(lineWidth: 15, lineCap: .round, lineJoin: .round))
                                            .frame(width: 100, height: 100)
                                            .foregroundColor(Color.white)
                                            .opacity(0.3)
                                        Text("\(percentage)%")
                                            .font(.system(size: 24))
                                            .fontWeight(.bold)
                                            .foregroundColor(.white)
                                        
                                    }
                                }
                                .padding(.top, 40)
                                .padding(.trailing, 10)
                        }
                        
                        //White box on view
                        ZStack {
                            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                                .frame(width: 300, height: 500, alignment: .center)
                                .opacity(1)
                                .padding(.bottom, 240)
                            
                            RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                                .frame(width: 500, height: 500, alignment: .center)
                                .opacity(1)
                                .padding(.bottom, 200)
                            
                            //Add item button
                            VStack {
                                ZStack {
                                    Button(action: {
                                        self.showingAddPopUp.toggle()
                                        print("\(percentage)")
                                        print(1 - (Double(percentage)/100))
                                    }) {
                                        Text("+")
                                            .font(.system(size: 40))
                                            .fontWeight(.bold)
                                            .padding(.bottom, 5)
                                            .frame(width: 286, height: 40, alignment: .center)
                                            .foregroundColor(.white)
                                            .background(LinearGradient(gradient: Gradient(colors: [.blue, .purple, .pink]), startPoint: .leading, endPoint: .trailing))
                                            .cornerRadius(5)
                                            .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
                                            .padding(.top, 5)
                                    }.sheet(isPresented: $showingAddPopUp) {
                                        AddPopUp(showingAddPopUp: $showingAddPopUp, itemStore: itemStore)
                                    }
                                }
                                //ScrollView items
                                    ZStack {
                                        VStack {
                                            // This creates a list populated by the items the user has inputted
                                            List {
                                                ForEach(itemStore.items) { item in
                                                    HStack {
                                                        Text(item.itemName)
                                                            .fontWeight(.heavy)
                                                            
                                                            //This line changes the color of the text depending on its priority it uses Bool to test whether something is true, if the item is not low, then test if it is medium, if not test if it is high.
                                                            
                                                            .foregroundColor(item.itemScore == .low ? Color.blue : item.itemScore == .medium ? Color.purple : item.itemScore == .high ? Color.pink : Color.black)
                                                            .frame(width: 350, height: 50, alignment: .leading)
                                                            .padding(.leading, 10)
                                                            .background(Color.white)
                                                            .cornerRadius(5)
                                                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
                                                            .padding(.leading, 8)
                                                        
                                                            Button(action: {
                                                                self.showingEditPopUp = true
                                                                print("edit was pressed")
                                                            }) {
                                                                Image(systemName: "pencil")
                                                                    .font(.system(size: 15, weight: .heavy))
                                                                    .foregroundColor(.gray)
                                                                .frame(width: 35, height: 50)
                                                                .background(Color.white)
                                                                .cornerRadius(5)
                                                                .shadow(color: Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
                                                            }
                                                                    .sheet(isPresented: $showingEditPopUp) {
                                                                        EditPopUp(showingEditPopUp: $showingEditPopUp, itemStore: itemStore)
                                                            }
                                                        }
                                                    }
                                                }
                                            .padding(.leading, 20)
                                            .padding(.bottom, 30)
                                            }
                                        .padding(.bottom, 300)
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
