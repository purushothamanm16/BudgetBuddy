//
//  BudgetBuddyApp.swift
//  BudgetBuddy
//
//  Created by Purushothaman M on 29/01/25.
//

import SwiftUI
import FirebaseCore

@main
struct BudgetBuddyApp: App {
    init() {
        do {
            try FirebaseApp.configure()
        } catch {
            print("Error configuring Firebase: \(error.localizedDescription)")
        }
    }
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}
