//
//  CenterModifier.swift
//  AfricaJungle
//
//  Created by Sarika on 19.04.22.
//

import SwiftUI

struct CenterModifier: ViewModifier {
    func body(content: Content) -> some View {
        HStack {
            Spacer()
            content
            Spacer()
        }
    }
}
