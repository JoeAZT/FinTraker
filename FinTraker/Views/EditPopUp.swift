//
//  EditPopUp.swift
//  FinTraker
//
//  Created by Joseph Taylor on 15/12/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import SwiftUI

struct EditPopUp: View {
    
    @Binding var showingEditPopUp: Bool
    @State private var newInfoText = ""
    @ObservedObject var itemStore: ItemStore
    @State private var score: Item.Score = .medium
    let originalItem: Item

    var body: some View {

        ZStack {
            RoundedRectangle(cornerRadius: 5)
            .foregroundColor(Color(#colorLiteral(red: 0.9607843137, green: 0.9607843137, blue: 0.9607843137, alpha: 1)))
            .frame(width: 500, height: 900)
            .shadow(color: .blue, radius: 2, x: 0, y: 2)

            ZStack {
                ZStack {
                    ZStack {
                        ZStack {
                        RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.8823529412, blue: 0.8862745098, alpha: 1)))
                        .frame(width: 286, height: 500)
                            .padding(.top, 410)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: -2)
                        }
                        RoundedRectangle(cornerRadius: 15)
                        .foregroundColor(Color(#colorLiteral(red: 0.8745098039, green: 0.8823529412, blue: 0.8862745098, alpha: 1)))
                        .frame(width: 500, height: 300)
                            .padding(.top, 300)
                    }
                    
                    RoundedRectangle(cornerRadius: 15)
                    .foregroundColor(Color(#colorLiteral(red: 0.7450980392, green: 0.7647058824, blue: 0.7764705882, alpha: 1)))
                    .frame(width: 286, height: 306)
                        .padding(.top, 740)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: -2)
                }
                RoundedRectangle(cornerRadius: 15)
                .foregroundColor(Color(#colorLiteral(red: 0.7450980392, green: 0.7647058824, blue: 0.7764705882, alpha: 1)))
                .frame(width: 500, height: 220)
                    .padding(.top, 740)
                
                VStack {
        
                    Button(action: {
                        self.showingEditPopUp = false
                    }) {
                        Image(systemName: "multiply")
                            .font(.system(size: 22, weight: .bold))
                            .frame(width: 40, height: 40, alignment: .center)
                            .foregroundColor(.white)
                            .background(LinearGradient(gradient: Gradient(colors: [.red, .pink]), startPoint: .leading, endPoint: .trailing))
                            .cornerRadius(20)
                            .shadow(color: Color.black.opacity(0.3), radius: 3, x: 2, y: 2)
                    }
                    .padding(.leading, 350)
                    .padding(.bottom, 30)
                    .padding(.top, 5)
                    
                    //Title
                    Text("Task Overview")
                        .foregroundColor(.purple)
                        .font(.system(size: 38, weight: .bold))
                        .fontWeight(.bold)
                        .padding(.bottom, 30)

                    //Text field for user to input a new item
                    ZStack(alignment: .topLeading) {

                        if newInfoText.isEmpty {
                            Text("Type something here")
                                .padding(.all, 7)
                        }
                        TextViewWrapper(text: $newInfoText)
                        
//                        TextEditor(text: $newInfoText)
//                            .opacity(newInfoText.isEmpty ? 0.2 : 1)
                    }
                    .frame(width: 286, height: 140, alignment: .top)
                    .background(Color(#colorLiteral(red: 0.9999126792, green: 1, blue: 0.9998814464, alpha: 1)))
                    .cornerRadius(10)
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 1, y: 2)
                .padding(.bottom, 50)

                    Text("Change priority?")
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
                    .padding(.bottom, 15)

                        HStack {
                                // Delete task should dismiss view and also delete the task from the array
                                Button(action: {
                                    self.showingEditPopUp = false
                                }) {
                                    Text("Delete Task")
                                        .font(.system(size: 16, weight: .bold))
                                        .frame(width: 125, height: 76, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(LinearGradient(gradient: Gradient(colors: [.gray]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
                                }
                                .padding(.horizontal, 4)
                                
                                //Cancel edit should dismiss the view
                                Button(action: {
                                    self.showingEditPopUp = false
                                }) {
                                    Text("Cancel Edit")
                                        .font(.system(size: 16, weight: .bold))
                                        .frame(width: 125, height: 76, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(LinearGradient(gradient: Gradient(colors: [.pink, .red]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
                                }
                                .padding(.horizontal, 4)
                            }
                        .padding(.bottom, 35)
                               
                            VStack {
                            //Complete button should dismiss the view and delete the task from the array and add it to the completed items array
                                    Button(action: {
                                        self.showingEditPopUp = false
                                    }) {
                                        Text("Complete Edit")
                                            .font(.system(size: 21, weight: .bold))
                                            .frame(width: 264, height: 76, alignment: .center)
                                            .foregroundColor(.white)
                                            .background(LinearGradient(gradient: Gradient(colors: [.blue, .red]), startPoint: .leading, endPoint: .trailing))
                                            .cornerRadius(10)
                                            .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
                                    }
                                    .padding(.bottom, 8)
                                
                                Button(action: {
                                    self.showingEditPopUp = false
                                }) {
                                    Text("Task Complete")
                                        .font(.system(size: 21, weight: .bold))
                                        .frame(width: 264, height: 76, alignment: .center)
                                        .foregroundColor(.white)
                                        .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .leading, endPoint: .trailing))
                                        .cornerRadius(10)
                                        .shadow(color: Color.black.opacity(0.5), radius: 3, x: 2, y: 2)
                                }
                            }
                    }
                }
            }
        }
    }


//struct ItemInfoPopUp_Previews: PreviewProvider {
//    static var previews: some View {
//        //ItemInfoPopUp()
//    }
//}
