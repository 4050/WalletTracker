//
//  ExpenseView.swift
//  WalletTracker
//
//  Created by Станислав on 06.11.2023.
//

import SwiftUI

struct ExpenseCell: View {
    let expenseModel: ExpenseModel
    
    var body: some View {
        HStack {
            Image(systemName: expenseModel.categoryIconName) // Используем системную иконку
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 40, height: 40) // Размер иконки
                .foregroundColor(Color.blue) // Цвет иконки (в данном случае синий)
            
            VStack(alignment: .leading) {
                Text("Сумма: \(expenseModel.spentAmount, specifier: "%.2f")")
                    .font(.headline)
                Text("Потратил: \(expenseModel.spender)")
                    .font(.subheadline)
                Text("Дата: \(formattedDate)")
                    .font(.subheadline)
                    .environment(\.locale, Locale(identifier: "en_GB"))
            }
        }
    }
    
    var formattedDate: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "dd MMM yyyy HH:mm"
        let date = dateFormatter.date(from: expenseModel.date) ?? Date()
        return dateFormatter.string(from: date)
    }
}
