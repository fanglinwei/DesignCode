//
//  Modifiers.swift
//  DesignCode2
//
//  Created by 方林威 on 2021/5/27.
//

import SwiftUI

struct ShadowModifier: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: 12)
            .shadow(color: .black.opacity(0.1), radius: 1, x: 0, y: 1)
    }
}

struct FontModifier: ViewModifier {
    
    var style: Font.TextStyle = .body
    
    func body(content: Content) -> some View {
        content.font(.system(style, design: .default))
    }
}

extension Font.Weight {
    
    enum WorkSans {
        case regular, light, extralight, bold, semibold, extrabold, medium, thin, black
    }
}

extension Font {
    
    static func workSans(size: CGFloat,
                         weight: Font.Weight.WorkSans = .regular) -> Font {
        let name: String
        switch weight {
        case .thin:                          name = "WorkSans-Thin"
        case .light:                         name = "WorkSans-Light"
        case .extralight:                    name = "WorkSans-ExtraLight"
        case .regular:                       name = "WorkSans-Regular"
        case .medium:                        name = "WorkSans-Medium"
        case .bold:                          name = "WorkSans-Bold"
        case .semibold:                      name = "WorkSans-SemiBold"
        case .extrabold:                     name = "WorkSans-ExtraBold"
        case .black:                         name = "WorkSans-Black"
        }
        return .custom(name, size: size)
    }
}
