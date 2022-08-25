//
//  ProfileViewModel.swift
//  twitter
//
//  Created by DSOFT on 25/08/2022.
//

import Foundation

class ProfileViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let user: User
    
    init(user: User){
        self.user = user
        self.fetchUserTweets()
    }
    
    func fetchUserTweets(){
        guard let uid = user.id else {return}
        service.fetchTweet(forUid: uid, completion: { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                self.tweets[i].user = self.user
            }
            
        })
    }
}
