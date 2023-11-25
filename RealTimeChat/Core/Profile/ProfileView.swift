//
//  ProfileView.swift
//  RealTimeChat
//
//  Created by Lê Văn Duy on 25/11/2023.
//

import SwiftUI

struct ProfileView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        if let user = viewModel.currentUser {
            List {
                Section {
                    HStack {
                        Text(user.initials)
                            .font(.title)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .frame(width: 72, height: 72)
                            .background(Color(.systemGray3))
                            .clipShape(.circle)
                        
                        VStack(alignment: .leading, spacing: 4) {
                            Text(user.fullname)
                                .font(.subheadline)
                                .fontWeight(.semibold)
                                .padding(.top, 4)
                            
                            Text(user.email)
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                    }
                }
                
                Section("General") {
                    HStack {
                        Image(systemName: "gear")
                            .foregroundStyle(Color(.systemGray))

                        Text("Version")
                            .foregroundStyle(Color(.systemGray))
                        
                        Spacer()
                        Text("1.0.0")
                    }
                }
                
                Section("Account") {
                    Button {
                        viewModel.signOut()
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundStyle(Color(.red))

                            Text("Sign Out")
                                .foregroundStyle(Color(.systemGray))
                        }
                    }
                    
                    Button {
                        print("Delete Account...")
                    } label: {
                        HStack {
                            Image(systemName: "arrow.left.circle.fill")
                                .foregroundStyle(Color(.red))
                            
                            Text("Delete Account")
                                .foregroundStyle(Color(.systemGray))
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    ProfileView()
}
