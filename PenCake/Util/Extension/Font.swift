//
//  Font.swift
//  PenCake
//
//  Created by 남경민 on 2023/02/01.
//

import SwiftUI
/*
Source Han Serif K VF
=== SourceHanSerifKVF-Regular
=== SourceHanSerifKVF-ExtraLight
=== SourceHanSerifKVF-Light
=== SourceHanSerifKVF-Medium
=== SourceHanSerifKVF-SemiBold
=== SourceHanSerifKVF-Bold
=== SourceHanSerifKVF-Heavy
 */
extension Font {
    enum PencakeFont {
        case regular
        case extraLight
        case light
        case medium
        case semiBold
        case bold
        case heavy
        case custom(String)
        
        var value: String {
            switch self {
            case .regular:
                return "Regular"
            case .extraLight:
                return "ExtraLight"
            case .light:
                return "Light"
            case .medium:
                return "Medium"
            case .semiBold:
                return "SemiBold"
            case .bold:
                return "Bold"
            case .heavy:
                return "Heavy"
            case .custom(let name):
                return name
            }
        }
    }
    static func pencakeFont(_ type: PencakeFont, size: CGFloat = 17) -> Font {
        return .custom("SourceHanSerifKVF-\(type.value)", size: size)
    }
}
