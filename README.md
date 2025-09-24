# iOS Biometric Authentication Demo

A simple iOS demo app built with SwiftUI to demonstrate biometric authentication using Face ID and Touch ID. The app showcases a modern authentication flow and UI, leveraging Apple's LocalAuthentication framework.

## Features

- Biometric authentication using Face ID or Touch ID
- Modern, responsive SwiftUI interface
- Clear authentication feedback (success/failure)
- Welcome screen on successful authentication
- Error message and retry option on failure
- Singleton pattern for authentication logic

## App Flow

1. **Launch App**: User is greeted with an authentication screen.
2. **Biometric Prompt**: iOS automatically shows Face ID or Touch ID prompt (based on device capability).
3. **Authentication Result**:
    - ✅ **Success**: User is taken to the Welcome screen.
    - ❌ **Failure**: User stays on the authentication screen with an error message (optionally retry).
4. **Welcome Screen**: Shows a simple confirmation message that authentication succeeded.

## Demo Video

> Watch a short demo of the app flow:
> [![App Demo](https://img.youtube.com/vi/VIDEO_ID/0.jpg)](https://www.youtube.com/watch?v=VIDEO_ID)
> 
> Replace `VIDEO_ID` with your actual YouTube video ID, or embed a local GIF/video if preferred.

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
