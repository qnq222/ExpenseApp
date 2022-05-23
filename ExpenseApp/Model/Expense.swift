//
//  Expense.swift
//  ExpenseApp
//
//  Created by Ayman AbuMutair on 22/05/2022.
//

import SwiftUI

// MARK: - Expense Model:
struct Expense: Identifiable, Hashable {
    var id = UUID().uuidString
    var remark: String
    var amount: Double
    var date: Date
    var type: ExpenseType
    var color: String
}

enum ExpenseType: String {
    case income = "Income"
    case expense = "Expenses"
    case all = "All"
}

var sample_expenses: [Expense] = [
    Expense(remark: "Kitchen marble", amount: 2400, date: Date(timeIntervalSince1970: 1653203476), type: .expense, color: "Red"),
    Expense(remark: "Cloths", amount: 70, date: Date(timeIntervalSince1970: 1653203476), type: .expense, color: "Green"),
    Expense(remark: "Transport", amount: 120, date: Date(timeIntervalSince1970: 1653203476), type: .expense, color: "Purple"),
    Expense(remark: "Food", amount: 100, date: Date(timeIntervalSince1970: 1653203476), type: .expense, color: "Gray"),
    Expense(remark: "Salary", amount: 800, date: Date(timeIntervalSince1970: 1653203476), type: .income, color: "Yellow"),
    
]
