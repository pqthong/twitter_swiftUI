//
//  UserService.swift
//  twitter
//
//  Created by DSOFT on 24/08/2022.
//

import Firebase
import FirebaseFirestoreSwift

struct UserService {
    
    func fetchUser(withUid uid: String, completion: @escaping(User) -> Void ){
        Firestore.firestore().collection("TWITTER_users").document(uid)
            .getDocument(completion: {snapshot, _ in
                guard let snapshot = snapshot else {return}
                guard let user = try? snapshot.data(as: User.self) else {return}
                completion(user)
            })
    }
    
    func fetchUsers(completion: @escaping([User]) -> Void){
        var users = [User]()
        Firestore.firestore().collection("TWITTER_users").getDocuments(completion: {snapshot, _ in
            guard let documents = snapshot?.documents else {return}
            documents.forEach({document in
                guard let user = try? document.data(as: User.self) else {return}
                users.append(user)
            })
            completion(users)
            
        })
    }
    
}



