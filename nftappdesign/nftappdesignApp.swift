//
//  nftappdesignApp.swift
//  nftappdesign
//
//  Created by  macbook    on 26/07/2025.
//

import SwiftUI

@main
struct nftappdesignApp: App {
    @State var router = NavigationRouter()
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $router.path) {
                OnboardingView()
                    .navigationDestination(for: AppRoute.self) { route in
                        AppNavigation.view(for: route)
                    }

            }
            .environment(router)
        }
    }
}
