//
//  Swipe1View.swift
//  expenseTracker
//
//  Created by Purushothaman M on 26/01/25.
//

import SwiftUI

struct Swipe1View: View {
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Image("moneyBB")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 230)
                Text("Gain total control of your money")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("purple"))
                    .multilineTextAlignment(.center)
                Text("Become your own money manager and make every cent count.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }.padding()
        }
    }
}

#Preview {
    Swipe1View()
}

