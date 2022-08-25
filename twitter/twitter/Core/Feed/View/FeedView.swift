//
//  FeedView.swift
//  twitter
//
//  Created by DSOFT on 18/08/2022.
//

import SwiftUI

struct FeedView: View {
    @State private var showNewTweetView = false
    @ObservedObject var viewModel = FeedViewModel()
    
    var body: some View {
        ZStack (alignment: .bottomTrailing) {
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.tweets) {tweet in
                        TweetRowView(tweet: tweet).padding()
                    }
                }
            }
            Button(action: {
                showNewTweetView.toggle()
            }, label: {
                Image(systemName: "square.and.pencil").resizable().renderingMode(.template)
                    .frame(width: 28, height: 28).padding()
            }).background(.blue)
                .foregroundColor(.white)
                .clipShape(Circle())
                .padding()
                .fullScreenCover(isPresented: $showNewTweetView, content: {
                    NewTweetView()
                })
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
