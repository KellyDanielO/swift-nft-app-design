//
//  HomeView.swift
//  nftappdesign
//
//  Created by  macbook    on 29/07/2025.
//

import SwiftUI

struct HomeView: View {
    var namespace: Namespace.ID
    @Environment(NavigationRouter.self) private var router: NavigationRouter?

    var navItems: [String] = [
        "Discovery",
        "Chart",
        "Heart",
        "Notification",
        "Profile"
    ]
    var tabItems: [String] = [
        "Recent", "Top Nfts", "Art", "Gamming", "Fashion"
    ]
    @State var selectedTabIndex: Int = 0
    @State var selectedNavItem: Int = 0
    
    let screenWidth = UIScreen.main.bounds.width
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.appBackground.ignoresSafeArea()
            ScrollView {
                VStack {
                    VStack(alignment: .leading, spacing: 0) {
                        Text("Explore!")
                            .customFont(size: 16, weight: .semibold)
                        
                        Text("Onaivi")
                            .customFont(size: 30, weight: .semibold)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    Spacer().frame(height: 20)
                    RoundedRectangle(cornerRadius: 30)
                        .strokeBorder(
                            Color(hex: "#848484"),
                            lineWidth: 1,
                        )
                        .frame(height: 51)
                        .overlay {
                            HStack {
                                Image("Search")
                                    .resizable()
                                    .foregroundStyle(.appForeground2)
                                    .frame(width: 18, height: 18)
                                Text("Search Nft")
                                    .customFont(size: 14, weight: .light, color: .appGrey)
                                Spacer()
                                Image("Filter")
                                    .resizable()
                                    .foregroundStyle(.appForeground2)
                                    .frame(width: 18, height: 18)
                                
                            }
                            .padding(.horizontal)
                        }
                    Spacer().frame(height: 20)
                    ScrollView(.horizontal) {
                        HStack {
                            ForEach(Array(tabItems.enumerated()), id: \.offset) { index, item in
                                Text(item)
                                    .customFont(size: 14, color:selectedTabIndex == index ? .appForeground : .appGrey)
                                    .padding(.horizontal, 10)
                                    .padding(.vertical, 5)
                                    .background(selectedTabIndex == index ? Color(hex: "#6C6C6C").opacity(0.44) : .clear)
                                    .cornerRadius(30)
                                    .onTapGesture {
                                        withAnimation(.smooth) {
                                            selectedTabIndex = index
                                        }
                                    }
                            }
                        }
                    }
                    Spacer().frame(height: 20)
                    
                    ZStack {
                        Image("home1")
                            .resizable()
                        
                        Circle()
                            .fill(.appBackground.opacity(0.58))
                            .frame(width: 68, height: 68)
                            .overlay {
                                Image(systemName: "heart.fill")
                                    .resizable()
                                    .foregroundStyle(Color.white)
                                    .frame(width: 27, height: 24)
                            }
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
                            .padding()
                        
                        VStack(alignment: .leading) {
                            Text("Visionary")
                                .customFont(size: 28, weight: .bold)
                            HStack {
                                Text("By Timalus lan")
                                    .customFont(size: 14, weight: .regular)
                                Image(systemName: "checkmark.seal.fill")
                                    .foregroundStyle(.appForeground)
                            }
                            HStack {
                                VStack {                                    Text("0.64")
                                        .customFont(size: 28, weight: .bold)
                                    Text("Floor Price")
                                        .customFont(size: 12, weight: .regular)

                                }
                                .padding(.horizontal, 35)
                                .padding(.vertical, 5)
                                .background(.appBackground.opacity(0.58))
                                .cornerRadius(42)
                                
                                
                                Image("ethereum")
                                    .resizable()
                                    .foregroundStyle(Color.white)
                                    .frame(width: 22, height: 29)
                                    .frame(width: 75, height: 75)
                                    .background(.appBackground.opacity(0.58))
                                    .clipShape(.circle)
                            }
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottomLeading)
                        .padding()

                    }
                    .frame(maxWidth: .infinity)
                    .frame(height: 375)
                    .cornerRadius(42)
                    .onTapGesture {
                        router?.push(AppRoute.detail)
                    }
                    Spacer().frame(height: 20)
                    HStack(spacing: 16) {
                        ForEach(["home2", "home3"], id: \.self) { imageName in
                            ZStack {
                                Image(imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(height: 178)
                                    .clipped()
                                    .cornerRadius(19)

                                // Top-right Heart
                                VStack {
                                    HStack {
                                        Spacer()
                                        Circle()
                                            .fill(Color.appBackground.opacity(0.58))
                                            .frame(width: 32, height: 32)
                                            .overlay {
                                                Image(systemName: "heart.fill")
                                                    .resizable()
                                                    .foregroundStyle(Color.white)
                                                    .frame(width: 12, height: 11)
                                            }
                                    }
                                    Spacer()
                                }
                                .padding()

                                // Bottom-left Info
                                VStack(alignment: .leading,) {
                                    Spacer()
                                    VStack(alignment: .leading, spacing: 4) {
                                        Text("Visionary")
                                            .customFont(size: 13, weight: .bold)
                                        Text("#2322")
                                            .customFont(size: 13, weight: .regular)

                                        HStack(spacing: 8) {
                                            Text("0.64")
                                                .customFont(size: 14, weight: .bold)
                                                .frame(width: 63, height: 36)
                                                .background(Color.appBackground.opacity(0.58))
                                                .cornerRadius(42)

                                            Image("ethereum")
                                                .resizable()
                                                .frame(width: 12, height: 12)
                                                .padding()
                                                .background(Color.appBackground.opacity(0.58))
                                                .clipShape(Circle())
                                        }
                                    }
                                    .frame(maxWidth: .infinity)
                                }
                                .padding()
                            }
                            .frame(width: screenWidth * 0.4, height: 178)
                            .onTapGesture {
                                router?.push(AppRoute.detail)
                            }
                        }
                    }

                }
                .safeAreaPadding(.horizontal, 20)
            }
            
            
            RoundedRectangle(cornerRadius: 42)
                .fill(.ultraThinMaterial)
                .matchedGeometryEffect(id: "backgroundCard", in: namespace)
                .frame(height: 84)
                .frame(maxWidth: .infinity)
                .overlay(
                    HStack {
                        ForEach(Array(navItems.enumerated()), id: \.offset) { index, item in
                            Image(item)
                                .resizable()
                                .frame(width: 24, height: 24)
                                .frame(width: 64, height: 64)
                                .background(selectedNavItem != index ? Color.clear : Color .appBackground.opacity(0.58))
                                .clipShape(Circle())
                                .onTapGesture {
                                    withAnimation(.spring) {
                                        selectedNavItem = index
                                    }
                                }
                        }
                    }
                    .padding(.horizontal, 10)
                )
                .padding(.horizontal)
                .offset(y: 0)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    @Previewable @Namespace var animation

    HomeView(namespace: animation, )
}
