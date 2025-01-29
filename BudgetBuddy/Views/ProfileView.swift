import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileVVM()
    var body: some View {
        NavigationView {
            if let user = viewModel.user {
                VStack(spacing: 40) {
                    VStack(alignment: .leading) {
                        Text("Hello,")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                        Text(user.name)
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(Color("purple"))
                    }
                    
                    ZStack {
                        Circle()
                            .frame(width: 170)
                            .blur(radius: 9)
                            .foregroundColor(Color("purple"))
                        Circle()
                            .frame(width: 100)
                            .blur(radius: 20)
                            .foregroundColor(Color("pink"))
                    }
                    HStack {
                        Text("Member since")
                        Text("\(Date(timeIntervalSince1970: user.joined).formatted(date: .abbreviated, time: .shortened))") // Dynamic year calculation
                            .foregroundColor(Color("pink"))
                    }.font(.body)
                    Button {
                        viewModel.logout()
                    } label : {
                        ButtonView(txt: "Logout")
                    }
                }
            } else {
                ProgressView()
            }
        }
        .onAppear {
            viewModel.fetchUser()
        }
    }
}

#Preview {
    ProfileView()
}

