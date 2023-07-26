import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        let window = UIWindow(windowScene: scene)
        let viewController = LoginConfigurator.view()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }

}
