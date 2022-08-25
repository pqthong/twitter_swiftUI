//
//  User.swift
//  twitter
//
//  Created by DSOFT on 24/08/2022.
//

import FirebaseFirestoreSwift

struct User: Identifiable, Decodable, Hashable {
    @DocumentID var id: String?
    let username: String
    let fullname: String
    let profileImage: String
    let email: String
}
