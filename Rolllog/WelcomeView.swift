//
//  WelcomeView.swift
//  Roll.log
//
//  Created by Saheed Abdul
//
import SwiftUI

struct WelcomeView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                LinearGradient(
                    colors: [
                        Color(red: 1.0, green: 0.84, blue: 0.0),
                        Color(red: 0.95, green: 0.72, blue: 0.0)
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()

                VStack(spacing: 0) {
                    Spacer().frame(height: 60)

                    AlpinoText(text: "ROLL.LOG", size: 15)
                        .tracking(4)
                        .foregroundColor(.white)

                    Spacer()

                    VStack(spacing: 16) {
                        AlpinoText(text: "Welcome", size: 34)
                            .foregroundColor(.white)

                        Text("Roll.Log helps you track every frame you shoot on film — Note frame settings roll by roll.")
                            .font(.system(.body, design: .serif))
                            .foregroundColor(.white.opacity(0.75))
                            .multilineTextAlignment(.center)
                            .padding(.horizontal, 32)
                    }

                    Spacer()

                    NavigationLink {
                        LandingView()
                    } label: {
                        Text("Get started")
                            .font(.system(.subheadline, design: .serif))
                            .foregroundColor(.black)
                            .padding(.vertical, 14)
                            .frame(maxWidth: .infinity)
                            .background(Color.white)
                            .clipShape(Capsule())
                    }
                    .padding(.horizontal, 40)
                    .padding(.bottom, 60)
                }
            }
        }
    }
}

#Preview {
    WelcomeView()
}
