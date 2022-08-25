//
//  LoginView.swift
//  twitter
//
//  Created by DSOFT on 23/08/2022.
//

import SwiftUI

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    @EnvironmentObject var viewModel: AuthViewModel
    var body: some View {
        VStack {
            AuthHeaderView(title1: "Hello", title2: "Welcome back")
            
            VStack(spacing: 40) {
                CustomTextFieldView(imageName: "envelope", placeholderText: "Email",  text: $email)
                CustomTextFieldView(imageName: "lock", placeholderText: "Password",  text: $password )

            }.padding(.horizontal, 32)
                .padding(.top,44)
            
            HStack{
                Spacer()
                NavigationLink(destination: ContentView(), label: {
                    Text("Forgot Password?")
                        .font(.caption)
                        .fontWeight(.semibold)
                        .foregroundColor(.blue)
                        .padding(.top)
                        .padding(.trailing,24)
                })
            }
            
            Button (action: {
                viewModel.login(withEmail: email, password: password)
            }, label: {
                Text("Sign In")
                    .font(.headline)
                    .foregroundColor(.white)
                    .frame(width: 340, height: 50, alignment: .center)
                    .background(.blue)
                    .clipShape(Capsule())
                    .padding()
                    
            }).shadow(color: .gray.opacity(0.5), radius: 10, x: 0, y: 0)
            Spacer()
            NavigationLink (destination: RegistrationView().navigationBarHidden(true), label: {
                HStack{
                    Text("Don't have an account")
                        .font(.footnote)
                    Text("Sign up")
                        .font(.footnote)
                        .fontWeight(.semibold)
                }
            }).padding(.bottom,32)
                .foregroundColor(.blue)
        }.ignoresSafeArea(.all).navigationBarHidden(true)
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
