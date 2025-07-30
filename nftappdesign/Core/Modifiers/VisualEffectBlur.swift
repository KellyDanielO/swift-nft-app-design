//
//  VisualEffectBlur.swift
//  nftappdesign
//
//  Created by  macbook    on 29/07/2025.
//

import SwiftUI
import UIKit

struct VisualEffectBlur: UIViewRepresentable {
    var blurStyle: UIBlurEffect.Style = .light
    var intensity: CGFloat = 1.0

    func makeUIView(context: Context) -> UIVisualEffectView {
        let effectView = UIVisualEffectView()
        effectView.effect = UIBlurEffect(style: blurStyle)
        effectView.alpha = intensity
        return effectView
    }

    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: blurStyle)
        uiView.alpha = intensity
    }
}
