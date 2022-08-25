//
//  CustomTextFieldView.swift
//  twitter
//
//  Created by DSOFT on 23/08/2022.
//

import SwiftUI

struct CustomTextFieldView: View {
    let imageName: String
    let placeholderText: String
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack {
                Image(systemName: imageName)
                    .resizable().scaledToFit()
                    .frame(width: 20, height: 20, alignment: .center)
                    .foregroundColor(.gray)
                
               
                    TextField (placeholderText, text: $text)
                
                
            }
            Divider().background(.gray)
        }
    }
}

struct CustomTextFieldView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextFieldView(imageName: "envelope", placeholderText: "Email", text: .constant(""))
    }
}
