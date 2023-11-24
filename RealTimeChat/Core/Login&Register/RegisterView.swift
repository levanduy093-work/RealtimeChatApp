//
//  RegisterView.swift
//  RealTimeChat
//
//  Created by Lê Văn Duy on 24/11/2023.
//

import SwiftUI

struct RegisterView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.brandGreen.ignoresSafeArea()
                VStack {
                    Image("login_image")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 200, height: 300)
                        .padding(.top, 60)
                    
                    Spacer()
                    
                    NavigationLink {
                        AddEmailView()
                            .navigationBarBackButtonHidden(true)
                    } label: {
                        HStack {
                            Image("regis")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 80, height: 80)
                            
                            Text("Đăng ký")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .textScale(.default)
                                .foregroundStyle(.brandViolet)
                        }
                        .frame(width: 300, height: 54)
                        .background(.brandBlue)
                        .cornerRadius(20)
                    }
                    
                    Spacer()
                    
                }
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
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
    RegisterView()
}
