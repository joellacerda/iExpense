//
//  ContentView.swift
//  iExpense
//
//  Created by Joel Lacerda on 04/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var expenses = Expenses()
    @State private var showingAddExpense = false
    
    var body: some View {
        NavigationStack {
            List {
                Section("Personal") {
                    ForEach(expenses.items.filter {$0.type == "Personal"}) { item in
                        ItemView(item: item)
                    }
                    .onDelete(perform: removeItem)
                }
                .hidden(expenses.items.filter {$0.type == "Personal"}.isEmpty)
                
                Section("Business") {
                    ForEach(expenses.items.filter {$0.type == "Business"}) { item in
                        ItemView(item: item)
                    }
                    .onDelete(perform: removeItem)
                }
                .hidden(expenses.items.filter {$0.type == "Business"}.isEmpty)
            }
            .navigationTitle("iExpenses")
            .toolbar {
                Button("Add Expense", systemImage: "plus") {
                   showingAddExpense = true
                }
            }
            .sheet(isPresented: $showingAddExpense) {
                AddView(expenses: expenses)
            }
        }
    }
    
    func removeItem(at offsets: IndexSet) {
        expenses.items.remove(atOffsets: offsets)
    }
}

extension View {
    func hidden(_ shouldHide: Bool) -> some View {
        opacity(shouldHide ? 0 : 1)
    }
}

#Preview {
    ContentView()
}
