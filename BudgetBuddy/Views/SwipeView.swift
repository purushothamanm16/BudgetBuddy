//
//  SwipeView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 26/01/25.
//

import SwiftUI

struct SwipeView: View {
    @State var showDash = false;
    var body: some View {
        ZStack {
            VStack(spacing: 20) {
                TabView {
                    Swipe1View()
                        .tabItem {
                            Image(systemName: "dollarsign.circle.fill")
                        }
                    Swipe2View()
                        .tabItem {
                            Image(systemName: "brain.fill")
                        }
                    Swipe3View()
                        .tabItem {
                            Image(systemName: "calendar")
                        }
                }.padding()
                    .accentColor(Color("purple"))
                Spacer()
                Button {
                    // hi
                    showDash.toggle()
                    print(showDash.description)
                } label: {
                    ButtonView(txt: "Get started !")
                }
                .fullScreenCover(isPresented: $showDash) {
                    MyTabView()
                }

            }.padding(.bottom, 40)
        }
    }
}

#Preview {
    SwipeView()
}

