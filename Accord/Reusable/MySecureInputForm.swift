//
//  MySecureInputForm.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/14.
//

import SwiftUI

struct MySecureInputForm: View {
    @Binding var input: String
    let placeholder: String
    
    var body: some View {
        ZStack(alignment: .leading) {
            SecureField("", text: $input)
                .background(RoundedRectangle(cornerRadius: 4).padding(.horizontal, -10).frame(height: 40).foregroundColor(Color("BoxGrey")))
                .padding(.horizontal, 10)
                .padding(.vertical, 12)
            
            if input.isEmpty {
                Text(placeholder)
                    .padding(.leading, 10)
            }
        }
        .font(.montserrat(.medium, size: 12))
        .foregroundColor(Color("TextGrey"))
    }
}
