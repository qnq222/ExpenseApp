//
//  ExpenseCard.swift
//  ExpenseApp
//
//  Created by Ayman AbuMutair on 23/05/2022.
//

import SwiftUI

struct ExpenseCard: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    var isFilter: Bool = false
    
    var body: some View {
        GeometryReader{proxy in
            RoundedRectangle(cornerRadius: 20, style: .continuous)
                .fill(
                    .linearGradient(colors: [
                        Color("Gradient1"),
                        Color("Gradient2"),
                        Color("Gradient3"),
                    ], startPoint: .topLeading, endPoint: .bottomTrailing)
                )
            
            VStack(spacing: 15) {
                VStack(spacing: 15) {
                    // MARK: - Currently Goning Month Date String:
                    Text(isFilter ? expenseViewModel.convertDateToString() : expenseViewModel.currentMonthDateString())
                        .font(.callout)
                        .fontWeight(.semibold)
                    
                    // MARK: - current month expense price:
                    Text(expenseViewModel.convertExpenseToCurrency(expense: expenseViewModel.expenses))
                        .font(.system(size: 35 , weight: .bold))
                        .lineLimit(1)
                        .padding(.bottom, 5)

                }
                .offset(y: -10)
                
                HStack(spacing: 15) {
                    Image(systemName: "arrow.down")
                        .font(.caption.bold())
                        .foregroundColor(Color("Green"))
                        .frame(width: 30, height: 30)
                        .background(.white, in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Income")
                            .font(.caption)
                            .opacity(0.7)
                            
                        Text(expenseViewModel.convertExpenseToCurrency(expense: expenseViewModel.expenses, expenseType: .income))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    
                    .frame(maxWidth: .infinity , alignment: .leading)
                    
                    Image(systemName: "arrow.up")
                        .font(.caption.bold())
                        .foregroundColor(Color("Red"))
                        .frame(width: 30, height: 30)
                        .background(.white, in: Circle())
                    
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Eexpenses")
                            .font(.caption)
                            .opacity(0.7)
                            
                        Text(expenseViewModel.convertExpenseToCurrency(expense: expenseViewModel.expenses, expenseType: .expense))
                            .font(.callout)
                            .fontWeight(.semibold)
                            .lineLimit(1)
                            .fixedSize()
                    }
                    
                }
                .padding(.horizontal)
                .padding(.trailing)
                .offset(y: 15)
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
            
        }
        .frame(height: 220)
        .padding(.top)
    }
}
