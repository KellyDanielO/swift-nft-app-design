//
//  DetailView.swift
//  nftappdesign
//
//  Created by  macbook    on 29/07/2025.
//

import SwiftUI

struct DetailView: View {
    
    
    let screenWidth = UIScreen.main.bounds.width
    let screenHeight = UIScreen.main.bounds.height
    @Environment(\.dismiss) var dismiss
    
    
    @GestureState private var dragOffset: CGSize = .zero
    @State private var swipeCartOffset: CGFloat = 0
    @State private var haveAddedToCart: Bool = false
    @State private var shouldSlideOut: Bool = false
    
    
    var maxHorizontalDrag: CGFloat { screenWidth * 0.4 }
    var body: some View {
        ZStack(alignment: .bottom) {
            Color.appBackground.ignoresSafeArea()
            ScrollView {
                VStack(alignment: .leading) {
                    
                    ZStack(alignment: .bottom) {
                        Image("home3")
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(height: screenHeight * 0.7)
                            .frame(maxWidth: screenWidth * 0.9)
                            .cornerRadius(42)
                        
                        HStack(alignment: .bottom) {
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
                                    VStack {
                                        Text("12.06")
                                            .customFont(size: 28, weight: .bold)
                                        Text("Highest Bid")
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
                            Spacer()
                            CountdownTimerView(to: Calendar.current.date(byAdding: .day, value: 2, to: Date())!)

                        }
                        .padding()
                        
                    }
                    Spacer().frame(height: 20)
                    Text("Description")
                        .customFont(size: 16, weight: .semibold)
                    Text("Embrace the essence of sophistication and intellect with \"Visionary in Purple,\" a mesmerizing NFT capturing the allure of a lady adorned with stylish glasses against a backdrop of royal purple. With an air of mystery and confidence, she exudes elegance and intelligence, embodying the epitome of modern sophistication.")
                        .customFont(size: 10, weight: .light, color: .appForeground2)
                    
                    Spacer().frame(height: 10)
                    Text("Related NFT’s")
                        .customFont(size: 16, weight: .semibold)
                    
                    HStack(spacing: 20) {
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
                        }
                    }
                    .frame(maxWidth: .infinity)
                }
            }
            .scrollIndicators(.hidden)
            .safeAreaPadding(.horizontal, 20)
            
            HStack {
                
                Image(systemName: "chevron.backward")
                    .foregroundStyle(.appForeground)
                    .font(.title)
                    .frame(width: 60, height: 60)
                    .background(.appBackground.opacity(0.58))
                    .clipShape(Circle())
                    .onTapGesture {
                        dismiss()
                    }
                Spacer()
                Image(systemName: "heart.fill")
                    .resizable()
                    .foregroundStyle(.appForeground)
                    .frame(width: 27, height: 24)
                    .frame(width: 60, height: 60)
                    .background(.appBackground.opacity(0.58))
                    .clipShape(Circle())
            }
            .padding(.horizontal, 10)
            .frame(maxWidth: .infinity)
            .frame(height: 67)
//            .background(.blue)
            .padding(.horizontal, 20)
            .offset(y: -screenHeight * 0.8)
            
            
            
            // Bottom Swipe Button
            RoundedRectangle(cornerRadius: 42)
                .fill(.ultraThinMaterial)
                .frame(height:haveAddedToCart ? 60 : 84)
                .frame(width: haveAddedToCart ? screenWidth * 0.4 : screenWidth * 0.7)
                .clipped()
                .overlay(
                    ZStack {
                        if !haveAddedToCart {
                            
                            let containerWidth = screenWidth * 0.7
                            let knobWidth: CGFloat = 70
                            let maxDrag = containerWidth - knobWidth - 20
                        
                            HStack {
                                Image("ethereum")
                                    .resizable()
                                    .frame(width: 22, height: 29)
                                    .frame(width: knobWidth, height: knobWidth)
                                    .background(.appBackground.opacity(0.58))
                                    .clipShape(Circle())
                                    .offset(x: min(max(0, swipeCartOffset + dragOffset.width), maxDrag))
                                
                                    .zIndex(10)
                                    .gesture(
                                        DragGesture()
                                            .updating($dragOffset) { value, state, _ in
                                                let proposed = swipeCartOffset + value.translation.width
                                                state = CGSize(width: min(max(0, proposed), maxDrag) - swipeCartOffset, height: 0)
                                            }
                                            .onEnded { value in
                                                let proposed = swipeCartOffset + value.translation.width
                                                let finalDrag = min(max(0, proposed), maxDrag)
                                                let threshold = maxDrag * 0.9
                                                
                                                if finalDrag >= threshold {
                                                    withAnimation(.bouncy) {
                                                        haveAddedToCart = true
                                                        withAnimation(.easeInOut(duration: 0.5).delay(0.7)) {
                                                            shouldSlideOut = true
                                                        }
                                                    }
                                                } else {
                                                    withAnimation(.bouncy) {
                                                        swipeCartOffset = 0
                                                    }
                                                }
                                            }
                                    )
                                
                                Spacer()
                                
                                Image("SwipeArrow")
                                    .resizable()
                                    .frame(width: 25, height: 9)
                                
                                Spacer()
                                
                                Text("Cart")
                                    .customFont(size: 16, weight: .semibold)
                                    .frame(width: 70, height: 70)
                                    .background(.appBackground.opacity(0.58))
                                    .clipShape(.circle)
                            }
                        } else {
                            
                            Text("Added to cart")
                                .customFont(size: 16, weight: .semibold)
                        }
                        
                    }
                    .padding(.horizontal, 10)
                )
                .padding(.horizontal)
                .offset(y: shouldSlideOut ? 500 : 0)
                .animation(.bouncy, value: haveAddedToCart)
                .navigationBarBackButtonHidden()
            
        }
    }
}

struct CountdownTimerView: View {
    @State private var timeRemaining: TimeInterval
    private let targetDate: Date
    private let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    init(to targetDate: Date) {
        self.targetDate = targetDate
        _timeRemaining = State(initialValue: max(targetDate.timeIntervalSinceNow, 0))
    }

    var body: some View {
        VStack(spacing: 10) {
            timeBubble(number: timeComponents.days, label: "days")
            timeBubble(number: timeComponents.hours, label: "hour")
            timeBubble(number: timeComponents.minutes, label: "min")
        }
        .onReceive(timer) { _ in
            timeRemaining = max(targetDate.timeIntervalSinceNow, 0)
        }
    }

    /// Computes days/hours/minutes each time `timeRemaining` updates
    private var timeComponents: (days: Int, hours: Int, minutes: Int) {
        let totalMinutes = Int(timeRemaining) / 60
        let days = totalMinutes / 1440
        let hours = (totalMinutes % 1440) / 60
        let minutes = totalMinutes % 60
        return (days, hours, minutes)
    }

    private func timeBubble(number: Int, label: String) -> some View {
        VStack {
            Text(String(format: "%02d", number))
                .customFont(size: 20, weight: .bold)
            Text(label)
                .customFont(size: 10, weight: .regular)
        }
        .frame(width: 48, height: 48)
        .padding(5)
        .background(Color.appBackground.opacity(0.58))
        .clipShape(Circle())
    }
}


#Preview {
    DetailView()
}
