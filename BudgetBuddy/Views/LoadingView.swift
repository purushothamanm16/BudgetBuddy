//
//  ContentView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 25/01/25.
//

import SwiftUI

struct LoadingView: View {
    @StateObject var viewModel = MainVVM()
    var body: some View {
        NavigationView {
            ZStack {
                Color("purple")
                    .ignoresSafeArea()
                
                VStack(spacing: 50) {
                    Spacer()
                    HStack {
                        Spacer()
                        Circle()
                            .frame(width: 150)
                            .foregroundStyle(Color("pink"))
                            .blur(radius: 40)
                            .overlay(alignment : .bottomTrailing) {
                                Circle()
                                    .frame(width: 60)
                                    .foregroundStyle(Color("yellow"))
                                    .blur(radius: 20)
                            }
                            .frame(alignment: .bottomTrailing)
                        Spacer()
                        Text("Budget \n Buddy")
                            .font(.system(size: 40))
                            .fontWeight(.heavy)
                            .foregroundColor(Color.white)
                            .multilineTextAlignment(.center)
                        Spacer()
                    }
                    Spacer()
                    HStack {
                        Spacer()
                        NavigationLink {
                            SpacerView()
                        } label: {
                            RoundedRectangle(cornerRadius: 90)
                                .frame(width: 90, height: 58, alignment: .center)
                                .foregroundStyle(Color("pink"))
                                .shadow(color: .gray , radius: 9)
                                .blur(radius: 20)
                                .overlay {
                                    HStack {
                                        Image(systemName: "arrow.right.circle")
                                            .foregroundColor(.white)
                                            .font(.largeTitle)
                                    }
                                }.foregroundColor(.white)
                        }.navigationBarBackButtonHidden()
                    }.padding(.trailing, 20)
                }
            }
        }
    }
}

#Preview {
    LoadingView()
}

