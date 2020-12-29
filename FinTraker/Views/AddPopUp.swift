//
//  AddItemPopUp.swift
//  FinTraker
//
//  Created by Joseph Taylor on 24/11/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import SwiftUI

struct AddPopUp: View {
    
    @Binding var showingAddPopUp: Bool
    @State private var newInfoText = ""
    @ObservedObject var itemStore: ItemStore
    @State private var score: Item.Score = .medium
    
    var body: some View {
        
        ZStack {
            
            RoundedRectangle(cornerRadius: 5)
            .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)))
            .frame(width: 400, height: 900)
            .shadow(color: .blue, radius: 2, x: 0, y: 2)
            
            ZStack {
                ZStack {
                    ZStack {
                        ZStack {
                        RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.8823529412, blue: 0.8862745098, alpha: 1)))
                        .frame(width: 286, height: 500)
                            .padding(.top, 690)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: -2)
                        }
                        RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.8823529412, blue: 0.8862745098, alpha: 1)))
                        .frame(width: 400, height: 300)
                            .padding(.top, 600)
                    }
                    
                    RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(#colorLiteral(red: 0.7450980392, green: 0.7647058824, blue: 0.7764705882, alpha: 1)))
                    .frame(width: 286, height: 306)
                        .padding(.top, 845)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: -2)
                }
                RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(#colorLiteral(red: 0.7450980392, green: 0.7647058824, blue: 0.7764705882, alpha: 1)))
                .frame(width: 400, height: 220)
                    .padding(.top, 850)
                
                VStack {
                    
                    Button(action: {
                        self.showingAddPopUp = false
                    }) {
                        Image(systemName: "multiply")
                            .font(.system(size: 22, weight: .bold))
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [.red, .pink]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
                    }
                    .padding(.leading, 300)
                    .padding(.top, 135)
                    .padding(.bottom, 35)
                    
                    //Title
                    Text("Add New Item")
                        .foregroundColor(.purple)
                        .font(.title)
                        .fontWeight(.bold)
                    
                    //Text field for user to input a new item
                    ZStack(alignment: .topLeading) {
                        
                        if newInfoText.isEmpty {
                            Text("Type something here")
                                .padding(.all, 7)
                        }
                        
                        
                        TextEditor(text: $newInfoText)
                            .opacity(newInfoText.isEmpty ? 0.2 : 1)
                                
                    }
                    .frame(width: 260, height: 260, alignment: .top)
                    .background(Color(#colorLiteral(red: 0.9999126792, green: 1, blue: 0.9998814464, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 2)
                .padding(.bottom, 50)
                    
                    Text("Priority?")
                        .foregroundColor(.purple)
                        .font(.system(size: 20))
                        .fontWeight(.bold)
                        .padding(.bottom, 10)
                    
                    //Top button
                    HStack {
                    Button(action: {
                        score = .low
                        
                    }) {
                        Image(systemName: "arrow.down")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 76, height: 76)
                            .background(LinearGradient(gradient: Gradient(colors: [Color .blue, .purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 2)
                            .opacity(score == .low ? 1 : 0.5)
                    }
                    
                    
                    //Middle button
                    Button(action: {
                        score = .medium
                    }) {
                        Image(systemName: "arrow.up.arrow.down")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 76, height: 76)
                            .background(LinearGradient(gradient: Gradient(colors: [.purple]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 2)
                            .opacity(score == .medium ? 1 : 0.5)
                            
                    }
                    .padding(.horizontal, 8)
                    
                    
                    //Bottom button
                    Button(action: {
                        score = .high
                    }) {
                        Image(systemName: "arrow.up")
                            .font(.system(size: 30, weight: .bold))
                            .foregroundColor(.white)
                            .frame(width: 76, height: 76)
                            .background(LinearGradient(gradient: Gradient(colors: [.purple, .pink]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(10)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 2)
                            .opacity(score == .high ? 1 : 0.5)
                        }
                    }
                    .padding(.bottom, 40)
                
                    
                    
                    HStack {
                        //The cancel button needs to dismiss the sheet view
                        Button(action: {
                            self.showingAddPopUp = false
                        }) {
                            Image(systemName: "multiply")
                                .font(.system(size: 30, weight: .bold))
                                .frame(width: 125, height: 76, alignment: .center)
                                .foregroundColor(.white)
                                .background(LinearGradient(gradient: Gradient(colors: [.red, .pink]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(10)
                                .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
                        }
                        .padding(.horizontal, 4)
                        
                        //The done button should add the new item to an array of items that will be displayed on the home page
                        Button(action: {
                            //what is does
                            self.showingAddPopUp = false
                            print(newInfoText)
                            print(score)
                            
                            let item = Item(itemName: newInfoText, itemScore: score)
                            itemStore.addItem(item)
                            
                        }) {
                            Image(systemName: "checkmark")
                                .font(.system(size: 28, weight: .bold))
                            .foregroundColor(Color.white)
                            .frame(width: 125, height: 76)
                        .background(Color(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)))
                        .cornerRadius(10)
                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 1, y: 2)
                        }
                        .padding(.horizontal, 4)
                    }
                }
                .padding(.bottom, 120)
            }
        }
    }
}

struct AddPopUp_Previews: PreviewProvider {
    static var previews: some View {
        AddPopUp(showingAddPopUp: .constant(true), itemStore: ItemStore())
    }
}

