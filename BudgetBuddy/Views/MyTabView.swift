//
//  MyTabView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 27/01/25.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore

struct MyTabView: View {
    var body: some View {
        TabView {
            DashBoardView(userId: getUserId())
                .tabItem {
                    Image(systemName: "pencil.and.list.clipboard")
                }
            ExpenseView(userId: getUserId())
                .tabItem {
                    Image(systemName: "plus.app.fill")
                }
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person.fill")
                }
        }.accentColor(Color("purple"))
        .navigationBarBackButtonHidden()

    }
    func getUserId() -> String {
        guard let uid = Auth.auth().currentUser?.uid else {
            return ""
        }
        return uid
    }
}

#Preview {
    MyTabView()
}

