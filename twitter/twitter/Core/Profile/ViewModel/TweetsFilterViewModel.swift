//
//  TweetsFilterViewModel.swift
//  twitter
//
//  Created by DSOFT on 18/08/2022.
//

import Foundation

enum TweetFilterViewModel: Int, CaseIterable {
    case tweets
    case replies
    case likes
    
    var title: String {
        switch self {
            case .tweets: return "Tweets"
            case .replies: return "Replies"
            case .likes: return "Likes"
        }
    }
}
