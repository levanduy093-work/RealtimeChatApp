//
//  RegisterView.swift
//  RealTimeChat
//
//  Created by Lê Văn Duy on 24/11/2023.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var confirmPassword = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandGreen.ignoresSafeArea()
                VStack {
                    Image("login_image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .padding(.top, 60)
                    
                    Spacer()
                    
                    TextField("Nhập email...", text: $email)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.leading, 10)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, 24)
                    
                    TextField("Nhập username...", text: $fullname)
                        .keyboardType(.emailAddress)
                        .autocapitalization(.none)
                        .padding(.leading, 10)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, 24)
                    
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding(.leading, 10)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, 24)
                    
                    ZStack(alignment: .trailing) {
                        SecureField("Confirm Password", text: $confirmPassword)
                            .autocapitalization(.none)
                            .padding(.leading, 10)
                            .modifier(TextFieldModifier())
                            .padding(.bottom, 24)
                        
                        if !password.isEmpty && !confirmPassword.isEmpty {
                            if password == confirmPassword {
                                Image(systemName: "checkmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(.systemGreen))
                                    .offset(x: -30, y: -12)
                            } else {
                                Image(systemName: "xmark.circle.fill")
                                    .imageScale(.large)
                                    .fontWeight(.bold)
                                    .foregroundStyle(Color(.systemGreen))
                                    .offset(x: -30, y: -12)
                            }
                        }
                    }
                    
                    
                    Button {
                        Task {
                            try await viewModel.createUser(withEmail:email,
                                                           password: password,
                                                           fullname: fullname)
                        }
                    } label: {
                        Text("Hoàn thành")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.brandDarkRed)
                            .frame(width: 360, height: 44)
                            .background(.brandBlue)
                            .cornerRadius(20)
                    }
                    .disabled(!formIsValid)
                    .opacity(formIsValid ? 1.0 : 0.5)
                    
                    
                    
                    Spacer()
                }
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Image(systemName: "chevron.left")
                            .imageScale(.large)
                            .onTapGesture {
                                dismiss()
                            }
                    }
                }
            }
        }
    }
}

//  MARK: AuthenticationFormProtocol
extension RegisterView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty
        && email.contains("@")
        && !password.isEmpty
        && password.count > 5
        && !fullname.isEmpty
        && confirmPassword == password
    }

}

#Preview {
    RegisterView()
}
