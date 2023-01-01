//
//  AutoOTPTextFieldApp.swift
//  AutoOTPTextField
//
//  Created by Gopabandhu on 01/01/23.
//

import SwiftUI

@main
struct AutoOTPTextFieldApp: App {
    var body: some Scene {
        WindowGroup {
            if #available(iOS 15, *) {
                NavigationView {
                    OTPVerificatioView()
                        .navigationBarTitleDisplayMode(.inline)
                        .navigationBarHidden(true)
                }
            } else {
                NavigationStack {
                    OTPVerificatioView()
                        .navigationBarTitleDisplayMode(.inline)
                        .toolbar(.hidden, for: .navigationBar)
                }
            }
        }
    }
}
