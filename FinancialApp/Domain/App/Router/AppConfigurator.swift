import UIKit

class AppConfigurator {
    
    static func view() -> UIViewController {

//        TODO: - Verify logged user later
        
        let userLogged = true

        guard userLogged else {
            return LoginConfigurator.view()
        }
        
        let debitsViewController = CardsConfigurator.view()
        let accountViewController = UIViewController()
        let homeViewController = UIViewController()
        let searchViewController = UIViewController()
        
        let tabController = UITabBarController()
        tabController.tabBar.tintColor = .white
        debitsViewController.setStatusBar()
        
        debitsViewController.setTabBarImage(imageName: SFImages.TabBar.debits, title: Text.TabBar.debits)
        accountViewController.setTabBarImage(imageName: SFImages.TabBar.account, title: Text.TabBar.account)
        homeViewController.setTabBarImage(imageName: SFImages.TabBar.home, title: Text.TabBar.home)
        searchViewController.setTabBarImage(imageName: SFImages.TabBar.search, title: Text.TabBar.search)
        
        tabController.viewControllers = [UINavigationController(rootViewController: homeViewController),
                                         UINavigationController(rootViewController: debitsViewController),
                                         UINavigationController(rootViewController: searchViewController),
                                         UINavigationController(rootViewController:accountViewController)]
        tabController.selectedIndex = 1
        
        return tabController
    }
    
}
