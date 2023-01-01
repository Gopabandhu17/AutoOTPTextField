//
//  OTPVerificatioView.swift
//  AutoOTPTextField
//
//  Created by Gopabandhu on 01/01/23.
//

import SwiftUI
/// This view is representing a OTP view
/// You can enter the OTP once you received from the backend
/// This is highly customizable
struct OTPVerificatioView: View {
    
    @State var otpText: String = ""
    @FocusState private var isKeyboardShowing: Bool
    
    var body: some View {
        VStack {
            Text("Verify OTP")
                .font(.largeTitle.bold())
                .frame(maxWidth: .infinity, alignment: .leading)
            
            HStack(spacing: 0) {
                /// - OTP Text Boxes
                /// - chage count based on your OTP Text size
                
                ForEach(0..<6, id: \.self) { index in
                    OTPTextBox(index)
                }
            }
            .background(content: {
                TextField("", text: $otpText.limit(6))
                    .keyboardType(.numberPad)
                    .textContentType(.oneTimeCode)
                /// - Hiding it out
                    .frame(width: 1, height: 1)
                    .opacity(0.001)
                    .blendMode(.screen)
                    .focused($isKeyboardShowing)
            })
            .contentShape(Rectangle())
            /// - Opening Keyboard When Tapped
            .onTapGesture {
                isKeyboardShowing.toggle()
            }
            .padding(.bottom, 20)
            .padding(.top, 10)
            
            Button {
                
            } label: {
                Text("Verify")
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.vertical, 12)
                    .frame(maxWidth: .infinity)
                    .background(
                        RoundedRectangle(cornerRadius: 6, style: .continuous)
                            .fill(.blue)
                    )
            }
            .disableWithOpacity(otpText.count < 6)
            
        }
        .padding(.all)
        .frame(maxHeight: .infinity, alignment: .top)
        .toolbar {
            ToolbarItem(placement: .keyboard) {
                Button("Done") {
                    isKeyboardShowing.toggle()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
            }
        }
    }
    
    // MARK: OTP Text Box
    func OTPTextBox(_ index: Int) -> some View {
        ZStack {
            if otpText.count > index {
                /// - Finding CharAtIndex
                let startIndex = otpText.startIndex
                let charIndex = otpText.index(startIndex, offsetBy: index)
                let charToString = String(otpText[charIndex])
                Text(charToString)
            } else {
                Text(" ")
            }
        }
        .frame(width: 45, height: 45)
        .background {
            /// - Highlighting  current active box
            let status = (isKeyboardShowing && otpText.count == index)
            RoundedRectangle(cornerRadius: 6, style: .continuous)
                .stroke(status ? .black : .gray, lineWidth: status ? 1 : 0.5)
            /// - Adding Animation
                .animation(.easeOut(duration: 0.2), value: status)
        }
        .frame(maxWidth: .infinity)
    }
}

struct OTPVerificatioView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificatioView()
    }
}

// MARK: View Extensions
extension View {
    func disableWithOpacity(_ condition: Bool) -> some View {
        self
            .disabled(condition)
            .opacity(condition ? 0.6 : 1.0)
    }
}

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
