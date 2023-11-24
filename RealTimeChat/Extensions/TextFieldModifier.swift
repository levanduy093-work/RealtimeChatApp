//
//  TextFieldModifier.swift
//  RealTimeChat
//
//  Created by Lê Văn Duy on 23/11/2023.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .padding(12)
            .background(Color(.systemGray6))
            .cornerRadius(20)
            .padding(.horizontal, 24)
    }
}
