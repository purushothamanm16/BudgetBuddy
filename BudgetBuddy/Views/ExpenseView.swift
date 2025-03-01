//
//  ExpenseView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 26/01/25.
//

import SwiftUI
import FirebaseFirestore

struct ExpenseView: View {
    @StateObject var viewModel = ExpenseVVM()
    @FirestoreQuery var expenses: [Expense]
    private let userId: String
    
    init(userId: String){
        self.userId = userId
        self._expenses = FirestoreQuery(collectionPath: "users/\(userId)/expense")
    }
    
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Add an Expense")
                .font(.largeTitle)
                .fontWeight(.heavy)
                .foregroundColor(Color("purple"))
            Form {
                Text("Total Expenses: $\(String(format: "%.2f", viewModel.totalExpense))")
                    .font(.title2)
                    .bold()
                Text(viewModel.errMsg)
                    .foregroundColor(Color("purple"))
                TextField("Title", text: $viewModel.title)
                TextField("Description", text: $viewModel.description)
                TextField("Amount", text: $viewModel.amount)
                DatePicker("Date", selection: $viewModel.date)
            }
            .frame(height: 300)
            .scrollContentBackground(.hidden)
            .accentColor(Color("purple"))
            HStack {
                Spacer()
                Button {
                    viewModel.save()
                } label : {
                    ButtonView(txt: "Add")
                }
                Spacer()
            }
            List(expenses) { expense in
                HStack {
                    VStack(alignment: .leading) {
                        Text(expense.title).bold().font(.title3).foregroundColor(Color("purple"))
                        Text(expense.description)
                        Text("\(Date(timeIntervalSince1970: expense.date).formatted(date: .abbreviated, time: .shortened))").font(.caption).italic().foregroundColor(.gray)
                    }
                    Spacer()
                    Text(expense.amount).foregroundColor(Color("pink")).bold()
                }
                .swipeActions {
                    Button("Delete") {
                        // call
                        viewModel.delete(id: expense.id)
                    }.tint(.red)
                }
            }
        }.padding(.top, 20)
            .onAppear {
                viewModel.fetchTotalExpense(userId: userId)
        }
    }
}

#Preview {
    ExpenseView(userId: "AjpgKBE6lPhn5pPHf7qZjFHdURk1")
}

