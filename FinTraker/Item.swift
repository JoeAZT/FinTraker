//
//  ItemInfo.swift
//  FinTraker
//
//  Created by Joseph Taylor on 28/11/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import Foundation
import Combine

struct Item: Identifiable {
    
    enum Score: Int {
        case low = 3
        case medium = 5
        case high = 10
    }
    let itemName: String
    let itemScore: Score
    let id = UUID()
    //var completed: Bool
}

class ItemStore: ObservableObject {
 @Published var items = [Item]()
    
    func addItem(_ item: Item) {
        items.append(item)
        let items = self.items
        let sortedItems = items.sorted { ($0.itemScore.rawValue > $1.itemScore.rawValue) }
        self.items = sortedItems
        }
    
}

class CompletedItemStore: ObservableObject {
    @Published var completedItems = [Item]()
    func addCompletedItem(_ completedItem: Item) {
        completedItems.append(completedItem)
        let completedItems = self.completedItems
    }
}






