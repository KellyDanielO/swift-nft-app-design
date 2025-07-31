//
//  OnboardingView.swift
//  nftappdesign
//
//  Created by  macbook    on 29/07/2025.
//

import SwiftUI

struct OnboardingView: View {
    @Namespace var animation

    @State private var xoffset: CGFloat = 0
    private let knobWidth: CGFloat = 70
    
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    var body: some View {
        ZStack {
            Color.appBackground.ignoresSafeArea()

            VStack(spacing: 0) {
                RichText(
                    segments: [
                        .init("Discover Unique "),
                        .init("NFT ", weight: .bold),
                        .init("Art & Collections"),
                    ],
                    defaultSize: 32,
                    defaultWeight: .light,
                    defaultColor: .white,
                    alignment: .center
                )
                .frame(maxWidth: 240)

                Spacer().frame(height: 10)

                Image("Underline")
                    .resizable()
                    .frame(width: 129, height: 19)

                Spacer().frame(height: 20)

                ZStack(alignment: .center) {
                    Color.appBackground

                    Image("onboarding2")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 191, height: 191)
                        .cornerRadius(18)
                        .rotationEffect(.degrees(-5))
                        .offset(x: -40, y: 120)

                    Image("onboarding3")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 203, height: 231)
                        .cornerRadius(18)
                        .rotationEffect(.degrees(-10))
                        .offset(x: 70, y: -40)

                    Image("onboarding1")
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 175, height: 175)
                        .cornerRadius(18)
                        .rotationEffect(.degrees(-10))
                        .offset(x: -90, y: -150)

                    GeometryReader { geo in
                        let totalWidth = geo.size.width - 10
                        let maxDrag = totalWidth - knobWidth - 40

                        RoundedRectangle(cornerRadius: 42)
                            .fill(.ultraThinMaterial)
                            .matchedGeometryEffect(id: "backgroundCard", in: animation)
                            .frame(height: 84)
                            .frame(maxWidth: .infinity)
                            .overlay(
                                ZStack(alignment: .leading) {
                                    Text("Swipe to Get Started")
                                        .customFont(size: 16, weight: .semibold)
                                        .offset(x: 20)
                                        .frame(maxWidth: .infinity, alignment: .center)
                                        .opacity(1.0 - min(xoffset / maxDrag, 1.0))
                                        .animation(.bouncy(duration: 0.2), value: xoffset)

                                    RoundedRectangle(cornerRadius: 50)
                                        .fill(Color.appBackground)
                                        .frame(width: knobWidth, height: 70)
                                        .overlay(
                                            Image("SwipeArrow")
                                                .resizable()
                                                .frame(width: 25, height: 9)
                                        )
                                        .offset(x: xoffset)
                                        .zIndex(10)
                                        .gesture(
                                            DragGesture()
                                                .onChanged { value in
                                                    let drag = max(0, min(value.translation.width, maxDrag))
                                                    xoffset = drag
                                                }
                                                .onEnded { value in
                                                    let drag = value.translation.width
                                                    let threshold = maxDrag * 0.9

                                                    if drag > threshold {
                                                        withAnimation(.easeOut(duration: 0.25)) {
                                                            xoffset = maxDrag
                                                           swipeEnded()
                                                        }
                                                    } else {
                                                        withAnimation(.interactiveSpring(response: 0.4, dampingFraction: 0.65, blendDuration: 0.3)) {
                                                            xoffset = 0
                                                        }
                                                    }
                                                }
                                        )
                                }
                                .padding(.horizontal, 10)
                            )
                            .padding(.horizontal)
                            .offset(y: 210)
                    }
                    .frame(height: 94)
                }
            }
        }
    }
    
    func swipeEnded() {
        xoffset = 0
        router?.push(AppRoute.home(namespace: animation))
        
    }
}

#Preview {
    OnboardingView()
}
