//
//  CompletedListView.swift
//  FinTraker
//
//  Created by Joseph Taylor on 09/12/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import SwiftUI

struct CompletedListView: View {
    var body: some View {
        List {
            ForEach(0..<5) { index in
                HStack {
                    Text("Item")
                    
                    Spacer()
                    Button("Button") {
                        print("Button")
                    }
                }
            }
        }
    }
}

struct CompletedListView_Previews: PreviewProvider {
    static var previews: some View {
        CompletedListView()
    }
}
