import Foundation

enum UserDefaultsKeys {
    static let userLogin = "userLogin"
}

protocol SessionManagerProtocol {
    
    var isUserLogged: Bool { get set }
}


final class SessionManager: SessionManagerProtocol {

    static let shared = SessionManager()

    private let userDefaults = UserDefaults.standard

    private init() { }
    
    var isUserLogged: Bool {
        get {
            userDefaults.bool(forKey: UserDefaultsKeys.userLogin)
        }
        set {
            userDefaults.setValue(newValue, forKey: UserDefaultsKeys.userLogin)
        }
    }
    
}
