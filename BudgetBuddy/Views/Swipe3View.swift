//
//  Swipe3View.swift
//  expenseTracker
//
//  Created by Purushothaman M on 26/01/25.
//

import SwiftUI

struct Swipe3View: View {
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Image("pageBB")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 230)
                Text("Planning ahead")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("purple"))
                    .multilineTextAlignment(.center)
                Text("Setup your budget for each category so you in control.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }.padding()
            
        }
    }
}

#Preview {
    Swipe3View()
}

