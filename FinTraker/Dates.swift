//
//  dates.swift
//  FinTraker
//
//  Created by Joseph Taylor on 12/12/2020.
//  Copyright © 2020 Joseph Taylor. All rights reserved.
//

import Foundation

class Dates {

    static func generateDays() -> [Date] {
        let today = Date()
        
        var dates = [today]
        for i in 1..<8 {
            if let date = Calendar.current.date(byAdding: .day, value: i, to: today) {
                dates.append(date)
            } else {
                continue
            }
        }
            return dates
    }
}

