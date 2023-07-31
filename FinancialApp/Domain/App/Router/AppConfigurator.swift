import UIKit

class AppConfigurator {
    
    static func view() -> UIViewController {
        
//        let userLogged = true
//
//        guard userLogged else {
//            return LoginConfigurator.view()
//        }
        
        let debitsViewController = DebitsConfigurator.view()
        let accountViewController = UIViewController()
        let homeViewController = UIViewController()
        let searchViewController = UIViewController()
        
        let tabController = UITabBarController()
        tabController.tabBar.tintColor = .white
        debitsViewController.setStatusBar()
        
        
        debitsViewController.setTabBarImage(imageName: SFImages.debits, title: Text.debits)
        accountViewController.setTabBarImage(imageName: SFImages.account, title: Text.account)
        homeViewController.setTabBarImage(imageName: SFImages.home, title: Text.home)
        searchViewController.setTabBarImage(imageName: SFImages.search, title: Text.search)
        
        
        tabController.viewControllers = [homeViewController,
                                         debitsViewController,
                                         searchViewController,
                                         accountViewController ]
        tabController.selectedIndex = 1
        
        return tabController
    }
    
}
