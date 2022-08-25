//
//  FeedViewModel.swift
//  twitter
//
//  Created by DSOFT on 25/08/2022.
//

import Foundation

class FeedViewModel: ObservableObject {
    @Published var tweets = [Tweet]()
    let service = TweetService()
    let userService = UserService()
    init() {
        self.fetchTweet()
    }
    
    func fetchTweet() {
        service.fetchTweet(completion: { tweets in
            self.tweets = tweets
            
            for i in 0 ..< tweets.count {
                let uid = tweets[i].uid
                
                self.userService.fetchUser(withUid: uid, completion: { user in
                    self.tweets[i].user = user
                })
                
            }
        })
    }
    
}
