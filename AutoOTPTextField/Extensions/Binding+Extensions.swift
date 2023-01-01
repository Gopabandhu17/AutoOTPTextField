//
//  Binding+Extensions.swift
//  AutoOTPTextField
//
//  Created by Gopabandhu on 01/01/23.
//

import SwiftUI

// MARK: Binding <String> Extension
extension Binding where Value == String {
    func limit(_ length: Int) -> Self {
        if self.wrappedValue.count > length {
            DispatchQueue.main.async {
                self.wrappedValue = String(self.wrappedValue.prefix(length))
            }
        }
        return self
    }
}
