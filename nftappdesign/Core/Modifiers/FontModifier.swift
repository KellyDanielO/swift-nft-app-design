//
//  Modifiers.swift
//  tunneldeck
//
//  Created by  macbook    on 20/07/2025.
//

import SwiftUI

struct ScaledCustomFontModifier: ViewModifier {
    var fontName: String
    var fontSize: CGFloat
    var weight: Font.Weight
    var color: Color
    var lineLimit: Int?

    func body(content: Content) -> some View {
        let variantName = fontVariantName(base: fontName, weight: weight)
        let baseFont = UIFont(name: variantName, size: fontSize) ?? UIFont.systemFont(ofSize: fontSize)
        let scaledFont = UIFontMetrics.default.scaledFont(for: baseFont)

        return content
            .font(Font(scaledFont))
            .foregroundColor(color)
            .lineLimit(lineLimit)
    }

    /// Map SwiftUI weight to custom font variant name
    func fontVariantName(base: String, weight: Font.Weight) -> String {
        switch weight {
        case .ultraLight: return "\(base)-ExtraLight"
        case .thin:       return "\(base)-Thin"
        case .light:      return "\(base)-Light"
        case .regular:    return "\(base)-Regular"
        case .medium:     return "\(base)-Medium"
        case .semibold:   return "\(base)-SemiBold"
        case .bold:       return "\(base)-Bold"
        case .heavy:      return "\(base)-ExtraBold"
        case .black:      return "\(base)-Black"
        default:          return "\(base)-Regular"
        }
    }
}


extension View {
    func customFont(
        name: String = AppFonts.mainFont,
        size: CGFloat,
        weight: Font.Weight = .regular,
        color: Color = .white,
        lineLimit: Int? = nil
    ) -> some View {
        self.modifier(ScaledCustomFontModifier(
            fontName: name,
            fontSize: size,
            weight: weight,
            color: color,
            lineLimit: lineLimit,
        ))
    }
}
