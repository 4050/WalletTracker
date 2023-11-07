//
//  EditBudgetView.swift
//  WalletTracker
//
//  Created by Станислав on 06.11.2023.
//

import SwiftUI

struct EditBudgetView: View {
    @Binding var budget: Double
    @Binding var isEditingBudget: Bool
    @State private var newBudget: String = ""

    var body: some View {
        VStack {
            TextField("Введите новый бюджет", text: $newBudget)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.decimalPad)
            
            Button("Сохранить") {
                if let newBudgetValue = Double(newBudget) {
                    budget = newBudgetValue
                }
                isEditingBudget = false
            }
        }
        .padding()
    }
}
