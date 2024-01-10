//
//  ExpenseItem.swift
//  iExpense
//
//  Created by Joel Lacerda on 10/01/24.
//

import Foundation

struct ExpenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
}
