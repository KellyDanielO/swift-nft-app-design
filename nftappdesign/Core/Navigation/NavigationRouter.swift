//
//  AppRouter.swift
//  tunneldeck
//
//  Created by  macbook    on 21/07/2025.
//

import SwiftUI

@Observable
class NavigationRouter {
    var path = NavigationPath()

    // Push a new screen
    func push<T: Hashable>(_ screen: T) {
        path.append(screen)
    }

    // Pop the last screen
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }

    // Clear all views (reset to empty stack)
    func resetToRoot() {
        path.removeLast(path.count)
    }

    // Set a new root
    func setRoot<T: Hashable>(_ screen: T) {
        path = NavigationPath()
        path.append(screen)
    }

    // ✅ Replace the last view in the stack
    func replaceLast<T: Hashable>(with screen: T) {
        guard !path.isEmpty else {
            push(screen)
            return
        }
        path.removeLast()
        path.append(screen)
    }

    // ✅ Replace all views with a new root
    func replaceAll<T: Hashable>(with screen: T) {
        setRoot(screen)
    }
}
