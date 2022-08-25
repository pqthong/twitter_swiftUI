//
//  Tweet.swift
//  twitter
//
//  Created by DSOFT on 25/08/2022.
//

import FirebaseFirestoreSwift
import Firebase

struct Tweet: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let caption: String
    let timestamp: Timestamp
    var likes: Int
    let uid: String
    
    var user: User?
}
