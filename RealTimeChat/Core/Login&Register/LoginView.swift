//
//  LoginView.swift
//  RealTimeChat
//
//  Created by Lê Văn Duy on 23/11/2023.
//

import SwiftUI

struct LoginView: View {
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationStack {
            VStack {
                
                Spacer()
                // Login image
                Image("login_image")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 260, height: 260)
                
                Spacer()
                
                // Signin Infor
                TextField("Nhập Email", text: $email)
                    .autocapitalization(.none)
                    .padding(.leading, 10)
                    .modifier(TextFieldModifier())
                
                SecureField("Mật khẩu", text: $password)
                    .autocapitalization(.none)
                    .padding(.leading, 10)

                    .modifier(TextFieldModifier())
                
                // Forget password button action
                Button(action: {
                    
                }, label: {
                    Text("Forgot Password")
                        .hSpacing(.trailing)
                        .padding(24)
                        .font(.footnote)
                        .fontWeight(.semibold)
                        .foregroundStyle(.brandprimary)
                })
                
                // Login Button
                Button(action: {
                    
                }, label: {
                    Text("Login")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                        .foregroundColor(.white)
                        .frame(width: 360, height: 44)
                        .background(Color(.brandGreen))
                        .cornerRadius(20)
                })
                
                Spacer()
                
                NavigationLink {
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack {
                        Text("Bạn chưa có tài khoản?🤒")
                            .fontWeight(.semibold)
                    }
                    .font(.footnote)
                    .foregroundStyle(.brandprimary)
                }
                .padding(.vertical)

            }
            .background(.brandBlue)
        }
    }
}

#Preview {
    LoginView()
}
