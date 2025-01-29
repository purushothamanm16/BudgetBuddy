//
//  Expense.swift
//  BudgetBuddy
//
//  Created by Purushothaman M on 29/01/25.
//

import Foundation
import SwiftUI

struct Expense: Codable, Identifiable {
    let id: String
    let title: String
    let description: String
    let amount: String
    let date: TimeInterval
    let createdAt: TimeInterval
}
