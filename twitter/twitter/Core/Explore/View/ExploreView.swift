//
//  ExploreView.swift
//  twitter
//
//  Created by DSOFT on 18/08/2022.
//

import SwiftUI

struct ExploreView: View {
    @ObservedObject var viewModel = ExploreViewModel()
    var body: some View {
        
        VStack {
            SearchBar(text: $viewModel.searchText)
            ScrollView {
                LazyVStack {
                    ForEach(viewModel.searchableUser, id : \.self ) {user in
                        NavigationLink(destination: {
                            ProfileView(user: user)
                        }, label: {
                            UserRowView(user: user)
                        })
                    }
                }
            }
        }
        .navigationTitle("Explore")
        .navigationBarTitleDisplayMode(.inline)
        
        
    }
}

struct ExploreView_Previews: PreviewProvider {
    static var previews: some View {
        ExploreView()
    }
}
