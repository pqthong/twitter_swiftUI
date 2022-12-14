//
//  TweetService.swift
//  twitter
//
//  Created by DSOFT on 25/08/2022.
//

import Firebase

struct TweetService {
    func uploadTweet(caption: String, completion: @escaping(Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        let data = ["uid": uid,
                    "caption": caption,
                    "likes": 0,
                    "timestamp": Timestamp(date: Date())] as [String: Any]
        Firestore.firestore().collection("tweets")
            .document().setData(data, completion: {error in
                if let _ = error {
                    completion(false)
                    return
                }
                completion(true)
            })
    }
    
    func fetchTweet(completion: @escaping([Tweet]) -> Void) {
        Firestore.firestore().collection("tweets")
            .order(by: "timestamp", descending: true)
            .getDocuments(completion: {snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
            completion(tweets)
        })
    }
    
    func fetchTweet(forUid uid: String, completion: @escaping([Tweet]) -> Void){
        Firestore.firestore().collection("tweets")
            .whereField("uid", isEqualTo: uid)
            .getDocuments(completion: {snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            let tweets = documents.compactMap({try? $0.data(as: Tweet.self)})
                completion(tweets.sorted(by: {
                    $0.timestamp.dateValue() > $1.timestamp.dateValue()
                }))
        })
    }
}
