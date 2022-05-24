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
    
    // MARK: - expense / income tap:
    @Published var tapName: ExpenseType = .expense
    
    // MARK: - Filter View:
    @Published var showFilterView: Bool = false
    
    // MARK: - new expense properties:
    @Published var addNewExpense: Bool = false
    @Published var amount: String = ""
    @Published var type: ExpenseType = .all
    @Published var date: Date = Date()
    @Published var remark: String = ""

    
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
    
    // MARK: - Converting selected dates to string:
    func convertDateToString() -> String {
        return startDate.formatted(date: .abbreviated, time: .omitted) + " - " + endDate.formatted(date: .abbreviated, time: .omitted)
    }

    // MARK: - Clearing all data:
    func clearData(){
        date = Date()
        type = .all
        amount = ""
        remark = ""
    }
    
    // MARK: - Save Data:
    func saveData(env: EnvironmentValues){
        // MARK: - TO DO:
        print("save data")
        let amountInDouble = (amount as NSString).doubleValue
        let colors = ["Yellow" , "Red" , "Purple", "Green"]
        let expense = Expense(remark: remark, amount: amountInDouble, date: date, type: type, color: colors.randomElement() ?? "Red")
        withAnimation { expenses.append(expense) }
        expenses = expenses.sorted { first, second in
            return second.date < first.date
        }
        env.dismiss()
    }


}

