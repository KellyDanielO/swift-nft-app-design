//
//  RichText.swift
//  nftappdesign
//
//  Created by  macbook    on 30/07/2025.
//

import SwiftUI
struct RichText: View {
    struct Segment {
        let text: String
        let size: CGFloat?
        let weight: Font.Weight?
        let color: Color?

        init(
            _ text: String,
            size: CGFloat? = nil,
            weight: Font.Weight? = nil,
            color: Color? = nil
        ) {
            self.text = text
            self.size = size
            self.weight = weight
            self.color = color
        }
    }

    let segments: [Segment]
    var defaultSize: CGFloat
    var defaultWeight: Font.Weight
    var defaultColor: Color
    var fontName: String = AppFonts.mainFont
    var alignment: TextAlignment = .leading
    var lineLimit: Int? = nil

    var body: some View {
        Group {
            reducedText()
                .multilineTextAlignment(alignment)
                .lineLimit(lineLimit)
        }
    }

    private func reducedText() -> Text {
        segments.reduce(Text("")) { result, segment in
            let size = segment.size ?? defaultSize
            let weight = segment.weight ?? defaultWeight
            let color = segment.color ?? defaultColor

            return result + Text(segment.text)
                .font(resolveFont(name: fontName, size: size, weight: weight))
                .foregroundColor(color)
        }
    }

    private func resolveFont(name: String, size: CGFloat, weight: Font.Weight) -> Font {
        let fontName: String

        switch weight {
        case .bold: fontName = "\(name)-Bold"
        case .semibold: fontName = "\(name)-SemiBold"
        case .medium: fontName = "\(name)-Medium"
        case .light: fontName = "\(name)-Light"
        case .thin: fontName = "\(name)-Thin"
        case .heavy: fontName = "\(name)-ExtraBold"
        default: fontName = "\(name)-Regular"
        }

        return Font.custom(fontName, size: size)
    }
}


#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        RichText(
            segments: [
                .init("Don't have an account? ", color: .gray), // inherits size & weight
                .init("Sign up", weight: .semibold, color: .blue) // overrides weight & color
            ],
            defaultSize: 14,
            defaultWeight: .regular,
            defaultColor: .white
        )
    }
}
