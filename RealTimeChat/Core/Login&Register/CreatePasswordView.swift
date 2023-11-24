//
//  CreatePasswordView.swift
//  RealTimeChat
//
//  Created by Lê Văn Duy on 24/11/2023.
//

import SwiftUI

struct CreatePasswordView: View {
    @Environment(\.dismiss) var dismiss
    @State private var password = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandGreen.ignoresSafeArea()
                VStack {
                    Image("image_pass")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 300, height: 300)
                        .padding(.top, 60)
                    
                    Spacer()
                    
                    SecureField("Password", text: $password)
                        .autocapitalization(.none)
                        .padding(.leading, 10)
                        .modifier(TextFieldModifier())
                        .padding(.bottom, 24)
                    
                    NavigationLink {
                        LoginView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        Text("Hoàn thành")
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
    CreatePasswordView()
}
