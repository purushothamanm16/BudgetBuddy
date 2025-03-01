//
//  ExpenseVVM.swift
//  expenseTracker
//
//  Created by Purushothaman M on 28/01/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class ExpenseVVM: ObservableObject {
    @Published var title = ""
    @Published var description = ""
    @Published var amount = ""
    @Published var date = Date()
    @Published var errMsg = "Please fill in valid data!"
    @Published var totalExpense: Double = 0.0
    
    init() {
        
    }
    
    func save() {
        if !canSave() {
            return
        }
        guard let uid = Auth.auth().currentUser?.uid else {
            return
        }
        let newId = UUID().uuidString
        let newExpense = Expense(id: newId, title: title, description: description, amount: amount, date: date.timeIntervalSince1970, createdAt: Date().timeIntervalSince1970)
        
        let db = Firestore.firestore()
        db.collection("users").document(uid).collection("expense").document(newId).setData(newExpense.asDictionary())
    }
    
    func canSave() -> Bool {
        guard !title.trimmingCharacters(in: .whitespaces).isEmpty, !description.trimmingCharacters(in: .whitespaces).isEmpty, !amount.trimmingCharacters(in: .whitespaces).isEmpty else {
            errMsg = "Please fill in all fields!"
            return false
        }
        
        guard Int(amount) != nil else {
            errMsg = "Enter valid amount."
            return false
        }
        
        return true
    }
    
    func delete(id: String) {
        let db = Firestore.firestore()
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        db.collection("users").document(userId).collection("expense").document(id).delete()
    }
    
    func fetchTotalExpense(userId: String) {
        let db = Firestore.firestore()
        db.collection("users").document(userId).collection("expense")
            .getDocuments { snapshot, error in
                if let error = error {
                    print("Error fetching expenses: \(error)")
                    return
                }
                
                var total = 0.0
                snapshot?.documents.forEach { document in
                    if let amountString = document.data()["amount"] as? String,
                       let amountValue = Double(amountString) { // Convert string to double
                        total += amountValue
                    }
                }
                
                DispatchQueue.main.async {
                    self.totalExpense = total
                }
            }
    }
}

