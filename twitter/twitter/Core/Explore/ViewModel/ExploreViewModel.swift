//
//  ExploreViewModel.swift
//  twitter
//
//  Created by DSOFT on 25/08/2022.
//

import Foundation

class ExploreViewModel: ObservableObject {
    @Published var users = [User]()
    @Published var searchText = ""
    let service = UserService()
    
    var searchableUser: [User] {
        if searchText.isEmpty {
            return users
        } else {
            let lowercasedQuery = searchText.lowercased()
            return users.filter({
                $0.username.contains(lowercasedQuery) ||
                $0.fullname.lowercased().contains(lowercasedQuery)
            })
        }
    }
    
    
    init(){
        fetchUsers()
    }
    
    func fetchUsers(){
        service.fetchUsers(completion: { result in
            self.users = result
        })
    }
    
}
