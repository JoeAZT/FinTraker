//
//  ContentView.swift
//  FinTraker
//
//  Created by Joseph Taylor on 21/11/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
       
        ZStack {
        RadialGradient(gradient: Gradient(colors: [ .white, .blue ,.init(
            #colorLiteral(red: 0.8549019694, green: 0.250980407, blue: 0.4784313738, alpha: 1))]), center: .center, startRadius: 20, endRadius: 450)
                .edgesIgnoringSafeArea(.all)
        
        VStack {
            VStack {
                
                Text("Spent this month:").foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 60)
                
                Text("£813.57").foregroundColor(.white)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .padding(.bottom, 20)
            }
            
            HStack {
                VStack {
                    Text("Income").foregroundColor(.white)
                        
                    Text("£1678.54")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.title)
                }
                
                .padding(.trailing, 60)

                VStack {
                    Text("Remaining").foregroundColor(.white)
                    Text("£1149.34")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .font(.title)
                }
            }
            
            .padding(.bottom, 30)

            RoundedRectangle(cornerRadius: 50)
            .fill(Color.white)
                .frame(width: 375, height: 500, alignment: .center)
                //.padding(.top, 300)
                .opacity(0.8)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
