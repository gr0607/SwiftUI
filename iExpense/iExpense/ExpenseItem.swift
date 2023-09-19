//
//  ExpenseItem.swift
//  iExpense
//
//  Created by admin on 19.09.2023.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
