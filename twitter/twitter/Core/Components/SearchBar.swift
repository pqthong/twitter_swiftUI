//
//  SearchBar.swift
//  twitter
//
//  Created by DSOFT on 25/08/2022.
//

import SwiftUI

struct SearchBar: View {
    
    @Binding var text: String
    var body: some View {
        HStack{
            TextField("Search...", text: $text)
                .padding(8)
                .padding(.horizontal,24)
                .background(.gray.opacity(0.2))
                .cornerRadius(8)
                .overlay(HStack{
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(.gray)
                        .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                        .padding(.leading,8)
                })
        }.padding(.horizontal)
    
    }
}

struct SearchBar_Previews: PreviewProvider {
    static var previews: some View {
        SearchBar(text: .constant(""))
    }
}
