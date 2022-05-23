//
//  ExpenseViewModel.swift
//  ExpenseApp
//
//  Created by Ayman AbuMutair on 22/05/2022.
//

import SwiftUI

class ExpenseViewModel: ObservableObject {
    
    // MARK: - Properties:
    @Published var startDate: Date = Date()
    @Published var endDate: Date = Date()
    @Published var currnetMonthStartDate: Date = Date()
    
    init() {
        // MARK: - fetching current month start date:
        let calender = Calendar.current
        let components = calender.dateComponents([.year , .month], from: Date())
        startDate = calender.date(from: components)!
        currnetMonthStartDate = calender.date(from: components)!
    }
    
    @Published var expenses: [Expense] = sample_expenses
    
    // MARK: - Fetching current month date string
    func currentMonthDateString() -> String {
        return currnetMonthStartDate.formatted(date: .abbreviated, time: .omitted) + " - " + Date().formatted(date: .abbreviated, time: .omitted)
    }
    
    // MARK: - get total expenses:
    func convertExpenseToCurrency(expense: [Expense] , expenseType: ExpenseType = .all) -> String {
        var value: Double = 0
        value = expense.reduce(0, { partialResult, expense in
            return partialResult + (expenseType == .all ? (expense.type == .income ? expense.amount : -expense.amount) : (expense.type == expenseType ? expense.amount: 0))
        })
        
        return convertNumberToPrice(value: value)
    }
    
    // MARK: - converting Number to price:
    func convertNumberToPrice(value: Double) -> String {
        let formatted = NumberFormatter()
        formatted.numberStyle = .currency
        
        return formatted.string(from: .init(value: value)) ?? "$0.00"
    }

}

