//
//  SideMenuView.swift
//  twitter
//
//  Created by DSOFT on 18/08/2022.
//

import SwiftUI
import Kingfisher

struct SideMenuView: View {
    
    @EnvironmentObject var authViewModel: AuthViewModel
    
    var body: some View {
        if let user = authViewModel.currentUser {
            VStack(alignment: .leading, spacing: 32) {
                VStack(alignment: .leading) {
                    
                    KFImage(URL(string: user.profileImage))
                        .resizable()
                        .scaledToFill()
                        .clipShape(Circle())
                        .frame(width: 48, height: 48)
                    
                   
                    VStack(alignment: .leading,spacing: 4){
                        Text(user.fullname).font(.headline)
                        Text("@\(user.username)").font(.caption).foregroundColor(.gray)
                    }
                    UserStatsView().padding(.vertical)
                }.padding(.leading)
                
                ForEach(SideMenuViewModel.allCases, id: \.rawValue ) {option in
                    if (option == .profile) {
                        NavigationLink (destination: {
                            ProfileView(user: user)
                        }, label: {
                            SideMenuOptionRowView(viewModel: option)
                        })
                    } else if option == .logOut {
                        Button(action: {
                            authViewModel.signOut()
                        }, label: {
                            SideMenuOptionRowView(viewModel: option)
                        })
                    } else {
                        SideMenuOptionRowView(viewModel: option)
                    }
                    
                  
                    
                }
                Spacer()
            }
        }
       
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

