//
//  AddEmailView.swift
//  RealTimeChat
//
//  Created by Lê Văn Duy on 24/11/2023.
//

import SwiftUI

struct AddEmailView: View {
    @Environment(\.dismiss) var dismiss
    @State private var email = ""
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandGreen.ignoresSafeArea()
                VStack {
                    Image("image_email")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 200)
                        .padding(.top, 60)
                    
                    Spacer()
                    
                    TextField("Nhập email...", text: $email)
                        .autocapitalization(.none)
                        .padding(.leading, 10)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, 24)
                    
                    NavigationLink {
                        CreatePasswordView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Tiếp tục")
                            .font(.subheadline)
                            .fontWeight(.semibold)
                            .foregroundStyle(.brandDarkRed)
                            .frame(width: 360, height: 44)
                            .background(.brandBlue)
                            .cornerRadius(20)
                    }
                    
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

#Preview {
    AddEmailView()
}
