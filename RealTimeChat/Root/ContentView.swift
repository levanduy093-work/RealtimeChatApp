//
//  ContentView.swift
//  RealTimeChat
//
//  Created by Lê Văn Duy on 23/11/2023.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                ProfileView()
            } else {
                LoginView()
            }
        }
    }
}

#Preview {
    LoginView()
}
