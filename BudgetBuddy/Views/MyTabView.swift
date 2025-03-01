//
//  MyTabView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 27/01/25.
//

import SwiftUI
import FirebaseAuth

struct MyTabView: View {
    @State private var userId: String? = nil
    
    var body: some View {
        TabView {
            if let userId = userId {
                DashBoardView(userId: userId)
                    .tabItem { Image(systemName: "pencil.and.list.clipboard") }
                
                ExpenseView(userId: userId)
                    .tabItem { Image(systemName: "plus.app.fill") }
            } else {
                Text("Please log in")
                    .tabItem { Image(systemName: "exclamationmark.triangle.fill") }
            }
            
            ProfileView()
                .tabItem { Image(systemName: "person.fill") }
        }
        .onAppear {
            if let uid = Auth.auth().currentUser?.uid {
                self.userId = uid
            }
        }
        .navigationBarBackButtonHidden()
    }
}


#Preview {
    MyTabView()
}

