//
//  TransactionCardView.swift
//  ExpenseApp
//
//  Created by Ayman AbuMutair on 22/05/2022.
//

import SwiftUI

struct TransactionCardView: View {
    
    var expense: Expense
    @EnvironmentObject var exepenseViewModel: ExpenseViewModel
    
    var body: some View {
        
        HStack(spacing: 12) {
            if let firstLetter = expense.remark.first {
                Text(String(firstLetter))
                    .font(.title.bold())
                    .foregroundColor(.white)
                    .frame(width: 50, height: 50)
                    .background(
                        Circle()
                            .fill(Color(expense.color))
                    )
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 5, y: 5)
                    
            }
            
            Text(expense.remark)
                .fontWeight(.semibold)
                .lineLimit(1)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            // MARK: - expense Price:
            VStack(alignment: .trailing, spacing: 7) {
                let price = exepenseViewModel.convertNumberToPrice(value: expense.type == .expense ? -expense.amount : expense.amount)
                Text(price)
                    .font(.callout)
                    .opacity(0.7)
                    .foregroundColor(expense.type == .expense ? Color("Red") : Color("Green"))
                Text(expense.date.formatted(date: .numeric, time: .omitted))
                    .font(.caption)
                    .opacity(0.6)
            }
            
        }
        .padding()
        .background(
            RoundedRectangle(cornerRadius: 15, style: .continuous)
                .fill(.white)
        )
        
    }
}

struct TransactionCardView_Previews: PreviewProvider {
    static var previews: some View {
       ContentView()
    }
}
