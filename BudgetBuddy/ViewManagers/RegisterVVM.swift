//
//  RegisterVVM.swift
//  expenseTracker
//
//  Created by Purushothaman M on 27/01/25.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterVVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var fullName: String = ""
    @Published var errMsg = "Please enter valid data"
    
    init() {
        
    }
    
    func register() {
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            if let error = error {
                DispatchQueue.main.async {
                    self?.errMsg = error.localizedDescription
                }
                return
            }
            guard let userId = result?.user.uid else { return }
            self?.insUserRecord(id: userId)
        }
    }
    
    private func insUserRecord(id: String) {
        let newUser = User(id: id, name: fullName, email: email, password: password, joined: Date().timeIntervalSince1970)
        let db = Firestore.firestore()
        db.collection("users").document(id).setData(newUser.asDictionary())
    }
    
    func validate() -> Bool {
        errMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty, !fullName.trimmingCharacters(in: .whitespaces).isEmpty else {
            errMsg = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errMsg = "Please enter valid email."
            return false
        }
        
        guard password.count >= 6 else {
            errMsg = "Use a strong passowrd."
            return false
        }

        return true
    }
}

