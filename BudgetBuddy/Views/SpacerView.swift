//
//  SpacerView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 27/01/25.
//

import SwiftUI

struct SpacerView: View {
    @StateObject var viewModel = MainVVM()
    var body: some View {
        if viewModel.isSignedIn, !viewModel.currUserId.isEmpty {
            MyTabView()
        }
        else {
            RegisterView()
        }
        
    }
}

#Preview {
    SpacerView()
}

