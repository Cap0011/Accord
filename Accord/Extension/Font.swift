//
//  Font.swift
//  Accord
//
//  Created by Jiyoung Park on 2023/02/14.
//

import SwiftUI

extension Font {
    enum Montserrat {
        case regular
        case medium
        case semibold
        case bold
        case black
        
        var value: String {
            switch self {
            case .regular:
                return "Montserrat-Regular"
            case .medium:
                return "Montserrat-Medium"
            case .semibold:
                return "Montserrat-SemiBold"
            case .bold:
                return "Montserrat-Bold"
            case .black:
                return "Montserrat-Black"
            }
        }
    }

    static func montserrat(_ type: Montserrat, size: CGFloat) -> Font {
        return .custom(type.value, size: size)
    }
}
