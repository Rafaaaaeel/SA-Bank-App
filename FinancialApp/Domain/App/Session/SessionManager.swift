import Foundation

enum UserDefaultsKeys {
    static let userLogin = "userLogin"
}


final class SessionManager {
    
    private let userDefaults = UserDefaults.standard
    
    var isUserLogged: Bool {
        get {
            userDefaults.bool(forKey: UserDefaultsKeys.userLogin)
        }
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsKeys.userLogin)
        }
    }
    
}
