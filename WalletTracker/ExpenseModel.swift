//
//  ExpenseModel.swift
//  WalletTracker
//
//  Created by Станислав on 06.11.2023.
//

import Foundation


struct Budget {
    var totalAmount: Double
    var expenses: [ExpenseModel]
    
    init(totalAmount: Double, expenses: [ExpenseModel]) {
        self.totalAmount = totalAmount
        self.expenses = expenses
    }
}

struct ExpenseModel: Identifiable {
    var id = UUID()
    var spentAmount: Double
    var date: String
    var categoryIconName: String
    var spender: String
}
