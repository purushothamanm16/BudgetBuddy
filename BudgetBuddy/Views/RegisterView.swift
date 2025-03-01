//
//  RegisterView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 25/01/25.
//

import SwiftUI

struct RegisterView: View {
    @StateObject var viewModel = RegisterVVM()
    @State private var navigateToSwipeView = false // State to control navigation
    
    var body: some View {
        ZStack {
            VStack {
                Text("Register")
                    .font(.system(size: 50))
                    .fontWeight(.heavy)
                    .foregroundColor(Color("purple"))
                    .bold()
                
                Form {
                    if !viewModel.errMsg.isEmpty {
                        Text(viewModel.errMsg)
                            .fontWeight(.semibold)
                            .foregroundColor(Color("purple"))
                    }
                    TextField("Full Name", text: $viewModel.fullName)
                    
                    TextField("Email", text: $viewModel.email)
                        .autocorrectionDisabled()
                        .autocapitalization(.none)
                    
                    SecureField("Password", text: $viewModel.password)
                }
                .scrollContentBackground(.hidden)
                .frame(height: 250)
                
                // Hidden NavigationLink for programmatic navigation
                NavigationLink(destination: SwipeView(), isActive: $navigateToSwipeView) {
                    EmptyView()
                }
                
                // Register Button
                ButtonView(txt: "Register")
                    .onTapGesture {
                        if viewModel.validate() {
                            viewModel.register()
                            navigateToSwipeView = true // Navigate to SwipeView
                        }
                    }
                    .padding()
                
                // Login Link
                HStack {
                    Text("Already have an account?")
                    NavigationLink(destination: LoginView()) {
                        Text("Login")
                            .foregroundColor(Color("pink"))
                    }
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    RegisterView()
}

