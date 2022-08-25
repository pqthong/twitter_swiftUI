//
//  UserRowView.swift
//  twitter
//
//  Created by DSOFT on 18/08/2022.
//

import SwiftUI
import Kingfisher

struct UserRowView: View {
    
    let user: User
    
    var body: some View {
        HStack(spacing: 12) {
            KFImage(URL(string: user.profileImage))
                .resizable()
                .scaledToFill()
                .frame(width: 56, height: 56, alignment: .center)
                .clipShape(Circle())
            VStack(alignment: .leading, spacing: 4)  {
                Text(user.username).font (.subheadline).bold().foregroundColor(.black)
                Text(user.fullname).font(.subheadline).foregroundColor(.gray)
            }
            Spacer()
        }.padding(.horizontal)
            .padding(.vertical, 4)
    }
}

