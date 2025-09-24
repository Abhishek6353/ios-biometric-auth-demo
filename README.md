# iOS Biometric Authentication Demo

A simple iOS demo app built with SwiftUI to demonstrate biometric authentication using Face ID and Touch ID. The app showcases a modern authentication flow and UI, leveraging Apple's LocalAuthentication framework.

## 🎥 Demo Previews

<p align="center">
  <img src="Recordings/FaceAuth.gif" alt="FaceAuth Demo" width="30%" />
  <img src="Recordings/TouchAuth.gif" alt="TouchAuth Demo" width="30%" />
</p>



## Requirements

- Xcode 14 or later
- iOS 15.0 or later
- A device or simulator with Face ID or Touch ID capability

## Installation & Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/yourusername/ios-biometric-auth-demo.git
   ```
2. Open the project in Xcode:
   ```sh
   open ios-biometric-auth-demo/ios-biometric-auth-demo.xcodeproj
   ```
3. Build and run on a device or simulator.
   - For simulator: Enable Face ID/Touch ID in Simulator > Features menu.

## Usage

- On launch, tap the **Authenticate** button to trigger biometric authentication.
- On success, you will see the Welcome screen.
- On failure, an error message is shown and you can retry.

## Code Structure

- `ContentView.swift`: Main UI and app flow logic
- `BiometricAuthManager.swift`: Singleton class for biometric authentication logic
- `ios_biometric_auth_demoApp.swift`: App entry point
- `Assets.xcassets`: App icons and accent color

## Contact

For questions or feedback, contact [itesabhi814@gmail.com](mailto:itesabhi814@gmail.com).
