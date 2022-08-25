//
//  RegistrationView.swift
//  twitter
//
//  Created by DSOFT on 23/08/2022.
//

import SwiftUI

struct RegistrationView: View {
    @State private var email = ""
    @State private var username = ""
    @State private var fullname = ""
    @State private var password = ""
    @Environment(\.presentationMode) var presentaionMode
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            
          
            
            AuthHeaderView(title1: "Get started", title2: "Create your account")
            VStack(spacing: 40 ){
                CustomTextFieldView(imageName: "envelope", placeholderText: "Email",  text: $email)
                CustomTextFieldView(imageName: "person", placeholderText: "Username",  text: $username)
                CustomTextFieldView(imageName: "person", placeholderText: "Fullname",  text: $fullname)
                CustomTextFieldView(imageName: "lock", placeholderText: "Password",  text: $password)
                
            }.padding(32)
            NavigationLink(destination:
                ProfilePhotoSelectorView()
            , isActive: $viewModel.didAuthenticateUser, label: {
                Text("")
            })
            Button (action: {
                viewModel.register(withEmail: email, password: password, fullname: fullname, username: username)
            }, label: {
                Text("Sign Up")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50, alignment: .center)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    
            }).shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            Spacer()
            Button(action: {
                presentaionMode.wrappedValue.dismiss()
            }, label: {
                HStack{
                    Text("Already have an account")
                        .font(.footnote)
                    Text("Sign In")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            })
            .padding(.bottom,32)
        }.ignoresSafeArea()
        
    }
}

struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView().environmentObject(AuthViewModel())
    }
}
