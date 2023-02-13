//
//  MyButton.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/14.
//

import SwiftUI

struct MyButton: View {
    let backgroundColorName: String
    let textColorName: String
    let text: String
    
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 4)
                .foregroundColor(Color(backgroundColorName))
                .frame(height: 48)
            
            Text(text)
                .foregroundColor(Color(textColorName))
                .font(.montserrat(.bold, size: 18))
        }
    }
}
