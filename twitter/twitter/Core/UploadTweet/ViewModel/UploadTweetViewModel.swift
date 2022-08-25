//
//  UploadTweetViewModel.swift
//  twitter
//
//  Created by DSOFT on 25/08/2022.
//

import Foundation

class UploadTweetViewModel: ObservableObject {
    let service = TweetService()
    @Published var didUploadTweet = false
    
    func uploadTweet(withCaption caption: String){
        service.uploadTweet(caption: caption, completion: { success in
            if success {
                self.didUploadTweet = true
            } else {
                
            }
            
        })
    }
    
}
