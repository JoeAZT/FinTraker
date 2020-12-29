//
//  AppView.swift
//  FinTraker
//
//  Created by Joseph Taylor on 22/11/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import SwiftUI

struct AppView: View {
    var body: some View {
        
        TabView {
            HomeView()
                .tabItem {
                 Image(systemName: "house.fill")
                 Text("Menu")
                    .transition(.slide)
            }
            CompletedListView()
                .tabItem {
                Image(systemName: "text.badge.checkmark")
                Text("Completed")
                }
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
