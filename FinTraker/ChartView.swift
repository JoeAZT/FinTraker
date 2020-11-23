//
//  ChartView.swift
//  FinTraker
//
//  Created by Joseph Taylor on 22/11/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import SwiftUI

struct ChartView: View {
    
    @State var pickerSelected = 0
    
    @State var dataPoints: [[CGFloat]] = [
    [50, 100, 150],
    [150, 100, 50],
    [30, 90, 60],
    ]
    
    var body: some View {
        ZStack {
            
            Color(#colorLiteral(red: 0.03921568627, green: 0.5176470588, blue: 1, alpha: 1)).edgesIgnoringSafeArea(.all)
            
            VStack {
                Text("Money Spent")
                .font(.system(size: 34))
                .fontWeight(.bold)
                    .foregroundColor(.white)
            
                Picker(selection: $pickerSelected, label: Text("")) {
                    Text("Two weeks ago").tag(0)
                    Text("Last week").tag(1)
                    Text("This week").tag(2)
                }.pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 24)
                
                
                HStack {
                    BarView(value: dataPoints[pickerSelected][0], initial: "M")
                    BarView(value: dataPoints[pickerSelected][1], initial: "T")
                    BarView(value: dataPoints[pickerSelected][0], initial: "W")
                    BarView(value: dataPoints[pickerSelected][2], initial: "T")
                    BarView(value: dataPoints[pickerSelected][0], initial: "F")
                    BarView(value: dataPoints[pickerSelected][2], initial: "S")
                    BarView(value: dataPoints[pickerSelected][0], initial: "S")
                
                }
                .padding(.top, 24)
                .animation(.default)
            }
        }
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        ChartView()
    }
}

struct BarView: View {
    
    var value: CGFloat = 0
    var initial: String = "-"
    
    var body: some View {
        VStack {
            ZStack(alignment: .bottom) {
                Capsule().frame(width: 30, height: 200)
                        .foregroundColor(Color(#colorLiteral(red: 0.968627451, green: 0.1450980392, blue: 0.5215686275, alpha: 1)))
                        .opacity(0.2)
                Capsule().frame(width: 30, height: value)
                        .foregroundColor(.white)
                          }
                Text(initial)
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .padding(.top, 8)
        }
    }
}





