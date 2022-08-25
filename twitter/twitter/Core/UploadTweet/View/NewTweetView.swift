//
//  NewTweetView.swift
//  twitter
//
//  Created by DSOFT on 19/08/2022.
//

import SwiftUI
import Kingfisher

struct NewTweetView: View {
    @State private var caption = ""
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var authViewModel: AuthViewModel
    @ObservedObject var viewModel = UploadTweetViewModel()
    
    var body: some View {
        VStack{
            HStack {
                Button (action: {
                    presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel")
                }).foregroundColor(.blue)
                Spacer()
                Button (action: {
                    viewModel.uploadTweet(withCaption: caption)
                }, label: {
                    Text("Tweet").bold()
                }).padding(.horizontal)
                    .padding(.vertical, 8)
                    .background(.blue)
                    .foregroundColor(.white)
                    .clipShape(Capsule())
            }.padding()
            HStack (alignment: .top){
                if let user = authViewModel.currentUser {
                    KFImage(URL(string: user.profileImage))
                        .resizable()
                        .scaledToFill()
                        .frame(width: 64, height: 64)
                        .clipShape(Circle())
                }
                
                TextArea("What's happenning? ", text: $caption)
            }.padding()
        }.onReceive(viewModel.$didUploadTweet, perform: { success in
            if success {
                presentationMode.wrappedValue.dismiss()
            }
        })
    }
}

struct NewTweetView_Previews: PreviewProvider {
    static var previews: some View {
        NewTweetView()
    }
}
