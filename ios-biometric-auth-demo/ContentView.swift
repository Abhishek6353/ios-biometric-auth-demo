//
//  ContentView.swift
//  ios-biometric-auth-demo
//
//  Created by Apple on 23/09/25.
//

import SwiftUI
import LocalAuthentication

struct ContentView: View {
    @State private var isAuthenticated = false
    @State private var authMessage = ""
    @State private var isAuthenticating = false

    var body: some View {
        ZStack {
            LinearGradient(gradient: Gradient(colors: [Color.accentColor.opacity(0.2), Color.accentColor]), startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            if isAuthenticated {
                WelcomeView(onGoBack: { isAuthenticated = false })
                    .transition(.opacity)
            } else {
                AuthView(authMessage: $authMessage, isAuthenticating: $isAuthenticating, authenticateUser: authenticateUser)
                    .transition(.opacity)
            }
        }
        .animation(.easeInOut, value: isAuthenticated)
    }

    func authenticateUser() {
        isAuthenticating = true
        authMessage = ""
        BiometricAuthManager.shared.authenticate(reason: "Authenticate to access the demo app") { success, message in
            isAuthenticated = success
            authMessage = message ?? ""
            isAuthenticating = false
        }
    }
}

struct AuthView: View {
    @Binding var authMessage: String
    @Binding var isAuthenticating: Bool
    var authenticateUser: () -> Void

    var body: some View {
        VStack(spacing: 32) {
            Image(systemName: "faceid")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.accentColor)
                .padding(.top, 40)
            Text("Biometric Authentication")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("Use Face ID or Touch ID to continue")
                .font(.title3)
                .foregroundColor(.secondary)
            if !authMessage.isEmpty {
                Text(authMessage)
                    .foregroundColor(.red)
                    .font(.body)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
            Button(action: authenticateUser) {
                HStack {
                    if isAuthenticating {
                        ProgressView()
                            .progressViewStyle(CircularProgressViewStyle())
                    }
                    Text(isAuthenticating ? "Authenticating..." : "Authenticate")
                        .font(.headline)
                        .padding(.horizontal)
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.accentColor)
                .foregroundColor(.white)
                .cornerRadius(12)
                .shadow(radius: 4)
            }
            .disabled(isAuthenticating)
            Spacer()
        }
        .padding()
        .accessibilityElement(children: .combine)
    }
}

struct WelcomeView: View {
    var onGoBack: (() -> Void)? = nil
    var body: some View {
        VStack(spacing: 32) {
            HStack {
                Button(action: { onGoBack?() }) {
                    Image(systemName: "chevron.left")
                        .font(.title2)
                        .foregroundColor(.accentColor)
                        .padding(8)
                        .background(Color(.systemGray6))
                        .clipShape(Circle())
                        .accessibilityLabel("Back")
                }
                Spacer()
            }
            .padding(.top, 16)
            .padding(.leading, 8)
            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 80, height: 80)
                .foregroundColor(.green)
                .padding(.top, 40)
            Text("Welcome!")
                .font(.largeTitle)
                .fontWeight(.bold)
            Text("You have successfully authenticated.")
                .font(.title3)
                .foregroundColor(.secondary)
            Spacer()
        }
        .padding()
        .accessibilityElement(children: .combine)
    }
}

#Preview {
    ContentView()
}
