//
//  ProfileView.swift
//  twitter
//
//  Created by DSOFT on 18/08/2022.
//

import SwiftUI
import Kingfisher

struct ProfileView: View {
    @State private var selectedFilter: TweetFilterViewModel = .tweets
    @Environment(\.presentationMode) var mode
    @Namespace var animation
    @ObservedObject var viewModel: ProfileViewModel
    
    init(user: User){
        self.viewModel = ProfileViewModel(user: user)
    }
    
    var body: some View {
        VStack(alignment:.leading) {
            headerView
            actionButton
            userInfoDetail
            tweetsFilterBar
            tweetsView
            Spacer()
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView(user: User(id: NSUUID().uuidString, username: "", fullname: "", profileImage: "", email: ""))
    }
}

extension ProfileView {
    var headerView: some View {
        ZStack(alignment: .bottomLeading) {
            Color.blue.ignoresSafeArea()
            VStack {
                Button(action: {
                    mode.wrappedValue.dismiss()
                }, label: {
                    Image(systemName: "arrow.left").resizable()
                        .frame(width: 20, height: 16)
                        .foregroundColor(Color.white)
                        .offset(x: 16, y: -16)
                })
                
                KFImage(URL(string: viewModel.user.profileImage))
                    .resizable()
                    .scaledToFill()
                    .frame(width: 72, height: 72)
                    .clipShape(Circle())
                    .offset(x: 16, y: 38)
            }
        }.frame(height: 96)
        
    }
    var actionButton: some View {
        HStack{
            Spacer()
            Image(systemName: "bell.badge")
                .font(.title3)
                .padding(6)
                .overlay(Circle().stroke(Color.gray,lineWidth: 0.75))
            Button (action: {
                
            }, label: {
                Text("Edit profile").font(.subheadline).bold()
                    .frame(width: 120, height: 32)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color.gray, lineWidth: 0.75))
                    .foregroundColor(Color.black)
            })
        }.padding(.trailing)

    }
    var userInfoDetail: some View {
        VStack(alignment: .leading, spacing: 4){
            HStack {
                Text(viewModel.user.fullname)
                    .font(.title2)
                .bold()
                Image(systemName: "checkmark.seal.fill").foregroundColor(Color.blue)
            }
            Text("@\(viewModel.user.username)")
                .font(.subheadline)
                .foregroundColor(.gray)
            Text("Your mom favorite villain").font(.subheadline).padding(.vertical)
            HStack (spacing: 24) {
                HStack{
                    Image(systemName: "mappin.and.ellipse")
                    Text("Gotham, NY")
                }
                HStack{
                    Image(systemName: "link")
                    Text("http://link.com")
                }
            }
            .foregroundColor(.gray)
            .font(.caption)
            
            UserStatsView().padding(.vertical)
        }.padding(.horizontal)

    }
    var tweetsFilterBar: some View {
        HStack{
            ForEach(TweetFilterViewModel.allCases, id: \.rawValue) { item in
                VStack {
                    Text(item.title)
                        .font(.subheadline)
                        .fontWeight(selectedFilter == item ? .semibold : .regular )
                        .foregroundColor(selectedFilter == item ? .black : .gray)
                    if selectedFilter == item {
                        HStack{
                            Capsule()
                        }.foregroundColor(.blue).frame( height: 3).matchedGeometryEffect(id: "filter", in: animation)
                    } else {
                        HStack{
                            Capsule()
                        }.foregroundColor(.clear).frame( height: 3)
                    }
                }.onTapGesture {
                    withAnimation(.easeInOut) {
                        self.selectedFilter = item
                    }
                }
            }
        }.overlay(Divider().offset(x: 0, y: 16))

    }
    var tweetsView: some View {
        ScrollView {
            LazyVStack{
                ForEach(viewModel.tweets ,id: \.self) {tweet in
                  TweetRowView(tweet: tweet).padding()
                }
            }
        }
    }
}
