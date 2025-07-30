//
//  ViewModifiers.swift
//  tunneldeck
//
//  Created by  macbook    on 21/07/2025.
//
import SwiftUI

extension View {
    func dismissKeyboard() {
        UIApplication.shared.sendAction(
            #selector(UIResponder.resignFirstResponder),
            to: nil,
            from: nil,
            for: nil
        )
    }
}
