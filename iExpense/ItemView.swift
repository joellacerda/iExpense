//
//  ItemView.swift
//  iExpense
//
//  Created by Joel Lacerda on 10/01/24.
//

import SwiftUI

struct ItemView: View {
    let item: ExpenseItem
    
    var body: some View {
        HStack {
            VStack(alignment: .leading) {
                Text(item.name)
                    .font(.headline)
                Text(item.type)
            }
            Spacer()
            Text(item.amount, format: .currency(code: item.currency))
                .bold()
                .foregroundStyle(Color(amountColor(amount: item.amount)))
        }
    }
    
    func amountColor(amount: Double) -> Color {
        if amount < 100 {
            return .green
        } else if amount < 1000 {
            return .yellow
        } else {
            return .red
        }
    }
}

#Preview {
    ItemView(item: ExpenseItem(name: "Drinks", type: "Personal", amount: 20, currency: "USD"))
}
