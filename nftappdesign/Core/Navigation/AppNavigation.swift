//
//  AppNavigation.swift
//  tunneldeck
//
//  Created by  macbook    on 21/07/2025.
//

import SwiftUI

enum AppRoute: Hashable {
    case home(namespace: Namespace.ID)
    case onboarding
    case detail
}


struct AppNavigation {
    @ViewBuilder
    static func view(for route: AppRoute) -> some View {
        switch route {
        case .onboarding:
            OnboardingView()
        case .home(let nameSpace):
            HomeView(namespace: nameSpace)
        case .detail:
            DetailView()
        }
    }
}
