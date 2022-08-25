//
//  SideMenuViewModel.swift
//  twitter
//
//  Created by DSOFT on 18/08/2022.
//

import Foundation
import SwiftUI

enum SideMenuViewModel: Int, CaseIterable {
    case profile
    case lists
    case bookmarks
    case logOut
    
    var title: String {
        switch self {
        case .profile: return "Profile"
        case .lists: return "List"
        case .bookmarks: return "Bookmarks"
        case .logOut: return "LogOut"
        }
    }
    
    var imageName: String {
        switch self {
        case .profile: return "person"
        case .lists: return "list.bullet"
        case .bookmarks: return "bookmark"
        case .logOut: return "arrow.left.square"
        }
    }
}
