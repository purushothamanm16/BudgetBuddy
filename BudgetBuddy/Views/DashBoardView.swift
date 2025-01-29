//
//  DashBoardView.swift
//  BudgetBuddy
//
//  Created by Purushothaman M on 29/01/25.
//

import SwiftUI
import FirebaseFirestore
import FirebaseAuth

struct DashBoardView: View {
    @StateObject var viewModel = ExpenseVVM()
    @FirestoreQuery var expenses: [Expense]
    @State private var isLoading = true
    private let userId: String

    init(userId: String) {
        self.userId = userId
        self._expenses = FirestoreQuery(collectionPath: "users/\(userId)/expense")
    }

    var body: some View {
        VStack {
            if isLoading {
                ProgressView("Loading Expenses...")
            } else {
                Text("Expense History")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("purple"))
                    .bold()
                
                Text("Recent Transactions")
                    .font(.caption)
                    .bold()

                if expenses.isEmpty {
                    Text("No expenses recorded.")
                        .foregroundColor(.gray)
                        .italic()
                } else {
                    List(expenses) { expense in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(expense.title)
                                    .bold()
                                    .font(.title3)
                                    .foregroundColor(Color("purple"))
                                
                                Text(expense.description)
                                
                                Text("\(Date(timeIntervalSince1970: expense.date).formatted(date: .abbreviated, time: .shortened))")
                                    .font(.caption)
                                    .italic()
                                    .foregroundColor(.gray)
                            }
                            Spacer()
                            Text(expense.amount)
                                .foregroundColor(Color("pink"))
                                .bold()
                        }
                        .swipeActions {
                            Button("Delete") {
                                viewModel.delete(id: expense.id)
                            }.tint(.red)
                        }
                    }
                }
            }
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                isLoading = false
            }
        }
    }
}

#Preview {
    DashBoardView(userId: "AjpgKBE6lPhn5pPHf7qZjFHdURk1")
}
