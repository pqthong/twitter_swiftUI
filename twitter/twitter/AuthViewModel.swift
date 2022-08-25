//
//  AuthViewModel.swift
//  twitter
//
//  Created by DSOFT on 23/08/2022.
//

import SwiftUI
import Firebase

class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var didAuthenticateUser = false
    @Published var currentUser: User?
    private var tempUserSession: FirebaseAuth.User?
    
    private let service = UserService()
    
    init () {
        self.userSession = Auth.auth().currentUser
        self.fetchUser()
    }
    
    func login(withEmail email: String, password: String){
        Auth.auth().signIn(withEmail: email, password: password){ result, err in
            if let err = err {
                print("Auth err: \(err.localizedDescription)")
                return
            }
            guard let user = result?.user else {return}
            self.userSession = user
            self.fetchUser()
        }
    }
    
    func register(withEmail email: String, password: String, fullname: String, username: String) {
        Auth.auth().createUser(withEmail: email, password: password, completion: { result, err in
            if let err = err {
                print("Auth fail: \(err.localizedDescription)")
                return
            }
            
            guard let user = result?.user else {return}
            self.tempUserSession = user
            let data = ["email": email,
                        "username": username.lowercased(),
                        "fullname": fullname]
            
            Firestore.firestore().collection("TWITTER_users").document(user.uid)
                .setData(data, completion: { _ in
                    self.didAuthenticateUser = true
                })
            
        })
    }
    
    func signOut() {
        userSession = nil
        try? Auth.auth().signOut()
    }
    
    func uploadProfileImage(_ image: UIImage) {
        guard let uid = tempUserSession?.uid else {return}
        ImageUploader.uploadImage(image: image, completion: {ProfileImageUrl in
            Firestore.firestore().collection("TWITTER_users").document(uid)
                .updateData(["profileImage": ProfileImageUrl], completion: { _ in
                    self.userSession = self.tempUserSession
                    self.fetchUser()
                })
        })
    }
    
    func fetchUser() {
        guard let uid = self.userSession?.uid else {return}
        service.fetchUser(withUid: uid, completion: { user in
            self.currentUser = user
        })
    }
    
}
