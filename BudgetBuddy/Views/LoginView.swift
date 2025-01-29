//
//  LoginView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 26/01/25.
//

import SwiftUI

struct LoginView: View {
    @StateObject var viewModel = LoginVVM()
    @State private var navigateToDashboard = false // State to control navigation
    
    var body: some View {
        ZStack {
            VStack {
                Text("Login")
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("purple"))
                    .bold()
                
                Form {
                    Text(viewModel.errMsg)
                        .fontWeight(.semibold)
                        .foregroundColor(Color("purple"))
                    TextField("Email", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    SecureField("Password", text: $viewModel.password)
                }
                .scrollContentBackground(.hidden)
                .frame(height: 190)
                
                // Hidden NavigationLink for programmatic navigation
                NavigationLink(destination: MyTabView(), isActive: $navigateToDashboard) {
                    EmptyView()
                }
                
                // Login Button
                ButtonView(txt: "Login")
                    .onTapGesture {
                        if viewModel.validate() {
                            viewModel.login()
                            navigateToDashboard = true // Navigate to DashboardView
                        }
                    }
                    .padding()
                
                // Register Link
                HStack {
                    Text("New here?")
                    NavigationLink(destination: RegisterView()) {
                        Text("Register")
                            .foregroundColor(Color("purple"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LoginView()
}

