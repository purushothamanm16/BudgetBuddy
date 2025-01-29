//
//  User.swift
//  BudgetBuddy
//
//  Created by Purushothaman M on 29/01/25.
//

import Foundation

struct User: Codable {
    let id: String
    let name: String
    let email: String
    let password: String
    let joined: TimeInterval
}
