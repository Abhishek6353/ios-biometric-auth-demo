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
    
    var body: some View {
        VStack(spacing: 24) {
            Image(systemName: isAuthenticated ? "faceid" : "lock.fill")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text(isAuthenticated ? "Authenticated!" : "Please authenticate")
                .font(.headline)
            if !authMessage.isEmpty {
                Text(authMessage)
                    .foregroundColor(.red)
                    .font(.subheadline)
            }
            Button(action: authenticateUser) {
                Text("Authenticate with Biometrics")
                    .padding()
                    .background(Color.accentColor)
                    .foregroundColor(.white)
                    .cornerRadius(8)
            }
        }
        .padding()
    }
    
    func authenticateUser() {
        BiometricAuthManager.shared.authenticate(reason: "Authenticate to access the demo app") { success, message in
            isAuthenticated = success
            authMessage = message ?? ""
        }
    }
}

#Preview {
    ContentView()
}
