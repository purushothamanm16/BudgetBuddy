//
//  Swipe2View.swift
//  expenseTracker
//
//  Created by Purushothaman M on 26/01/25.
//

import SwiftUI

struct Swipe2View: View {
    var body: some View {
        ZStack {
            VStack(spacing: 30) {
                Image("listBB")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 150, height: 230)
                Text("Know where your money goes")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .foregroundColor(Color("purple"))
                    .multilineTextAlignment(.center)
                Text("Track your transaction easily, with categories and financial report.")
                    .font(.title3)
                    .multilineTextAlignment(.center)
            }.padding()
            
        }
    }
}

#Preview {
    Swipe2View()
}

