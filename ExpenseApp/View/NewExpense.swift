//
//  NewExpense.swift
//  ExpenseApp
//
//  Created by Ayman AbuMutair on 23/05/2022.
//

import SwiftUI

struct NewExpense: View {
    @EnvironmentObject var expenseViewModel: ExpenseViewModel
    // MARK: - environment values:
    @Environment(\.self) var env

    
    var body: some View {
        VStack() {
            VStack (spacing: 12) {
                Text("Add Expenses")
                    .font(.title2)
                    .fontWeight(.semibold)
                    .opacity(0.5)
                
                // MARK: - Custom text field for currency symbol:
                if let symbol = expenseViewModel.convertNumberToPrice(value: 0).first {
                    TextField("0", text: $expenseViewModel.amount)
                        .font(.system(size: 35))
                        .foregroundColor(Color("Gradient2"))
                        .multilineTextAlignment(.center)
                        .keyboardType(.numberPad)
                        .background {
                            Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
                                .font(.system(size: 35))
                                .opacity(0)
                                .overlay(alignment: .leading) {
                                    Text(String(symbol))
                                        .opacity(0.5)
                                        .offset(x: -15, y: 5)
                                }
                        }
                        .padding(.vertical, 10)
                        .frame(maxWidth: .infinity)
                        .background {
                            Capsule()
                                .fill(.white)
                        }
                        .padding(.horizontal,20)
                        .padding(.top)
                    
                    
                }
                
                // MARK: - Custom Lables:
                Label {
                    TextField("Remark" , text: $expenseViewModel.remark)
                } icon: {
                    Image(systemName: "list.bullet.rectangle.portrait.fill")
                        .font(.title3)
                        .foregroundColor(Color("Gray"))
                }
                .padding(.vertical,20)
                .padding(.horizontal,15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                .padding(.top , 20)
                
                Label {
                    // MARK: - CheckBoxes:
                    CustomCheckBoxes()
                } icon: {
                    Image(systemName: "arrow.up.arrow.down")
                        .font(.title3)
                        .foregroundColor(Color("Gray"))
                }
                .padding(.vertical,20)
                .padding(.horizontal,15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                
                Label {
                    DatePicker.init("", selection: $expenseViewModel.startDate, in: Date.distantPast...Date(),displayedComponents: [.date])
                        .datePickerStyle(.compact)
                        .labelsHidden()
                        .frame(maxWidth: .infinity , alignment: .leading)
                        .padding(.leading , 10)
                    
                } icon: {
                    Image(systemName: "calendar")
                        .font(.title3)
                        .foregroundColor(Color("Gray"))
                }
                .padding(.vertical,20)
                .padding(.horizontal,15)
                .background {
                    RoundedRectangle(cornerRadius: 12, style: .continuous)
                        .fill(.white)
                }
                
            }
            .frame(maxHeight: .infinity,alignment: .center)
            
            // MARK: - Save Button:
            Button (action: {expenseViewModel.saveData(env: env)}){
                Text("Save")
                    .font(.title3)
                    .fontWeight(.semibold)
                    .padding(.vertical, 15)
                    .frame(maxWidth: .infinity)
                    .background {
                        RoundedRectangle(cornerRadius: 12, style: .continuous)
                            .fill(
                                LinearGradient(colors: [
                                    Color("Gradient1"),
                                    Color("Gradient2"),
                                    Color("Gradient3"),
                                ], startPoint: .topLeading, endPoint: .bottomTrailing)
                            )
                    }
                    .foregroundColor(.white)
                    .padding(.bottom , 10)
            }
            .disabled(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "")
            .opacity(expenseViewModel.remark == "" || expenseViewModel.type == .all || expenseViewModel.amount == "" ? 0.6 : 1)
        }
        .padding()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background {
            Color("BG")
                .ignoresSafeArea()
        }
        .overlay(alignment: .topTrailing) {
            // MARK: - Close Button:
            Button {
                env.dismiss()
            } label: {
                Image(systemName: "xmark")
                    .font(.title2)
                    .foregroundColor(.black)
                    .opacity(0.7)
                
            }
            .padding()
        }
    }
    
    // MARK: - Checkboxes
    @ViewBuilder
    func CustomCheckBoxes() -> some View {
        HStack(spacing: 10) {
            ForEach([ExpenseType.income , ExpenseType.expense] , id: \.self){ type in
                ZStack {
                    RoundedRectangle(cornerRadius: 2)
                        .stroke(.black.opacity(0.4) , lineWidth: 2)
                        .frame(width: 22, height: 22)
                    
                    if expenseViewModel.type == type {
                        Image(systemName: "checkmark")
                            .font(.caption.bold())
                            .foregroundColor(Color("Green"))
                        
                    }
                }
                .contentShape(Rectangle())
                .onTapGesture {
                    expenseViewModel.type = type
                }
                Text(type.rawValue.capitalized)
                    .font(.callout)
                    .fontWeight(.semibold)
                    .opacity(0.7)
                    .padding(.trailing , 10)
                    .foregroundColor(type == .income ? .green : .red)
            }
        }
        .frame(maxWidth: .infinity , alignment: .leading)
        .padding(.leading , 10)
    }

}

struct NewExpense_Previews: PreviewProvider {
    static var previews: some View {
        NewExpense()
            .environmentObject(ExpenseViewModel())
    }
}


//VStack(spacing: 15) {
//    Text("Add Expenses")
//        .font(.title2)
//        .fontWeight(.semibold)
//        .opacity(0.5)
//
//    // MARK: - Custom text field for currency symbol:
//    if let symbol = expenseViewModel.convertNumberToPrice(value: 0).first {
//        TextField("0", text: $expenseViewModel.amount)
//            .font(.system(size: 35))
//            .foregroundColor(Color("Gradient2"))
//            .multilineTextAlignment(.center)
//            .keyboardType(.numberPad)
//            .background {
//                Text(expenseViewModel.amount == "" ? "0" : expenseViewModel.amount)
//                    .font(.system(size: 35))
//                    .opacity(0)
//                    .overlay(alignment: .leading) {
//                        Text(String(symbol))
//                            .opacity(0.5)
//                            .offset(x: -15, y: 5)
//                    }
//            }
//            .padding(.vertical, 10)
//            .frame(maxWidth: .infinity)
//            .background {
//                Capsule()
//                    .fill(.white)
//            }
//            .padding(.horizontal , 20 )
//        padding(.top)
//    }
//
//
//}
