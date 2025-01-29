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
        FirebaseApp.configure()
    }
    var body: some Scene {
        WindowGroup {
            LoadingView()
        }
    }
}
