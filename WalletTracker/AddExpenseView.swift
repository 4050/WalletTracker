//
//  AddExpenseView.swift
//  WalletTracker
//
//  Created by Станислав on 06.11.2023.
//

import SwiftUI

import SwiftUI

struct AddExpenseView: View {
    @State private var spentAmount: Double = 0.0
    @State private var selectedCategoryIndex = 0
    @State private var selectedSpenderIndex = 0
    @State private var selectedDate = Date()
    @Binding var isPresented: Bool 
    @Binding var expenses: [ExpenseModel]
    
    let categories: [(name: String, icon: String)] = [
        ("Еда", "cart.fill"),
        ("Транспорт", "car.fill"),
        ("Развлечения", "gift.fill"),
        ("Продукты", "cart.badge.plus")
    ]
    
    let spenders = ["Иванов Иван", "Петров Петр", "Сидоров Сидор", "Анна Анн"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Сумма")) {
                    TextField("Введите сумму", value: $spentAmount, formatter: NumberFormatter())
                        .keyboardType(.decimalPad)
                }
                
                Section(header: Text("Категория расходов")) {
                    Picker("Категория", selection: $selectedCategoryIndex) {
                        ForEach(0..<categories.count) { index in
                            HStack {
                                Image(systemName: categories[index].icon)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width: 24, height: 24)
                            }
                        }
                    }
                }
                
                Section(header: Text("Потратил")) {
                    Picker("Потратил", selection: $selectedSpenderIndex) {
                        ForEach(0..<spenders.count) { index in
                            Text(spenders[index])
                        }
                    }
                }
                
                Section(header: Text("Дата")) {
                    DatePicker("Выберите дату", selection: $selectedDate, displayedComponents: .date)
                }
            }
            .navigationTitle("Добавление траты")
            .navigationBarItems(trailing: Button("Сохранить") {
                // Сохранение информации о новой трате
                let selectedCategory = categories[selectedCategoryIndex]
                let newExpense = ExpenseModel(spentAmount: spentAmount, date: selectedDate.description, categoryIconName: selectedCategory.icon, spender: spenders[selectedSpenderIndex])
                expenses.append(newExpense)
                isPresented = false
            })
        }
    }
}
