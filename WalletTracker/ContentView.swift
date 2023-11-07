//
//  ContentView.swift
//  WalletTracker
//
//  Created by Станислав on 06.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses: [ExpenseModel] = [] // Массив для хранения трат
    @State private var budget: Double = 1000.0 // Общая сумма бюджета
    @State private var isAddingExpense = false
    @State private var isEditingBudget = false
    
    var body: some View {
        NavigationView {
            VStack {
                Text("Общая сумма бюджета: \(budget, specifier: "%.2f")")
                    .font(.headline)
                    .onLongPressGesture {
                        isEditingBudget = true
                    }
                List {
                    ForEach(expenses) { expense in
                        ExpenseCell(expenseModel: expense)
                    }
                } .overlay(content: {
                    if expenses.isEmpty {
                        Text("Нет трат")
                    }
                })
            }
            .navigationTitle("Мой Бюджет") // Устанавливаем заголовок навигации
            .navigationBarItems(trailing: Button(action: {
                // Устанавливаем флаг isAddingExpense в true при нажатии на кнопку "plus"
                isAddingExpense = true
            }) {
                Image(systemName: "plus")
            })
            
            .sheet(isPresented: $isAddingExpense) {
                // Открываем AddExpenseView как модальное окно
                AddExpenseView(isPresented: $isAddingExpense, expenses: $expenses)
            }
            .sheet(isPresented: $isEditingBudget) {
                EditBudgetView(budget: $budget, isEditingBudget: $isEditingBudget)
            }
        }
    }
}

