//
//  ButtonView.swift
//  expenseTracker
//
//  Created by Purushothaman M on 26/01/25.
//

import SwiftUI

struct ButtonView: View {
    var txt: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 30)
                .frame(width: 200, height: 50)
                .foregroundColor(Color("purple"))
            Text(txt)
                .font(.title3)
                .fontWeight(.semibold)
                .foregroundColor(.white)
        }
    }
}

#Preview {
    ButtonView(txt: "get started")
}

