import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let scene = (scene as? UIWindowScene) else { return }
        render(scene)
    }
    
    private func render(_ scene: UIWindowScene) {
        let appRouter = AppRouter()
        let window = UIWindow(windowScene: scene)
        let viewController = AppConfigurator.view()
        let navigationController = UINavigationController()
        navigationController.pushViewController(viewController, animated: true)
        appRouter.currentViewController = navigationController
        window.rootViewController = navigationController
        window.makeKeyAndVisible()
        self.window = window
    }

}
