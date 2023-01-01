//
//  View+Extensions.swift
//  AutoOTPTextField
//
//  Created by Gopabandhu on 01/01/23.
//

import SwiftUI

// MARK: View Extensions
extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1.0)
    }
}
