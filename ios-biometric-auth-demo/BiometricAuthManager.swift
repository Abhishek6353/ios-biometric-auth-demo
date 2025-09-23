import LocalAuthentication

class BiometricAuthManager {
    static let shared = BiometricAuthManager()
    private init() {}
    
    func authenticate(reason: String, completion: @escaping (Bool, String?) -> Void) {
        let context = LAContext()
        var error: NSError?
        
        if context.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            context.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: reason) { success, authenticationError in
                DispatchQueue.main.async {
                    if success {
                        completion(true, nil)
                    } else {
                        completion(false, authenticationError?.localizedDescription ?? "Failed to authenticate")
                    }
                }
            }
        } else {
            DispatchQueue.main.async {
                completion(false, error?.localizedDescription ?? "Biometric authentication not available")
            }
        }
    }
}
