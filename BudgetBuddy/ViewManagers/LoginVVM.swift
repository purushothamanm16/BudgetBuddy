//
//  LoginVVM.swift
//  expenseTracker
//
//  Created by Purushothaman M on 27/01/25.
//

import Foundation
import FirebaseAuth

class LoginVVM: ObservableObject {
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var errMsg = "Please enter valid data"

    init() {
        
    }

    func login() {
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] result, error in
                    DispatchQueue.main.async {
                        if let error = error {
                            self?.errMsg = error.localizedDescription
                        } else if result?.user != nil {
                            // Successfully logged in
                            self?.errMsg = "" // Clear any previous error message
                        }
                    }
                }
    }
    
    func validate() -> Bool {
        errMsg = ""
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty, !password.trimmingCharacters(in: .whitespaces).isEmpty else {
            errMsg = "Please fill in all fields!"
            return false
        }
        
        guard email.contains("@") && email.contains(".") else {
            errMsg = "Please enter valid email."
            return false
        }
        
        return true
    }
}

