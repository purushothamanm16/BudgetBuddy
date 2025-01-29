//
//  MainVVM.swift
//  expenseTracker
//
//  Created by Purushothaman M on 27/01/25.
//

import Foundation
import FirebaseAuth

class MainVVM: ObservableObject {
    @Published var currUserId: String = ""
    private var handler: AuthStateDidChangeListenerHandle?
    
    init() {
        self.handler = Auth.auth().addStateDidChangeListener { [weak self] _, user in
            DispatchQueue.main.async {
                self?.currUserId = user?.uid ?? ""
            }
        }
    }
    
    public var isSignedIn: Bool {
        return Auth.auth().currentUser != nil
    }
}

