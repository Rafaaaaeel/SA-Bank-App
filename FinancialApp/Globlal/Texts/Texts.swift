import UIKit

struct Text {
    
    struct Common {
        static let currency = "R$ "
    }
    
    struct Login {
        static let loginTitle = "Hey,\nWelcome\nBack"
        static let loginButtonTitle = "Login"
        static let forgotPasswordTitle = "Forgot password?"
        static let createAccountText = "Don't have an account? "
        static let emailPlaceholder = "E-mail"
        static let passwordPlaceholder = "Password"
        static let signUpTitle = "Sign up"
    }
    
    struct TabBar {
        static let debits = "Cards"
        static let account = "Account"
        static let home = "Home"
        static let search = "Search"
    }
    
    struct Debits {
        static let headerTitle = "Hey, \nhere they are! "
        static let searchPlaceholder = "Looking for an specific one"
        static let headerTitleFailure = "Sorry, \nsomething went wrong"
        static let headerTitleLoading = "Wait, \njust a moment \ngetting data..."
    }

    struct Card {
        static func parcels(initial: String, end: String) -> String { "\(initial)/\(end)" }
    }
    
}

