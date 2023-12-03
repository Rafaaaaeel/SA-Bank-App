import UIKit

class CommonViewController: UIViewController {
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackButton()
        view.backgroundColor = .primaryBackground
    }
    
    private func configBackButton() {
        let image = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorImage = image
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = image
    }
    
    func toggleTabbar() {
        guard var frame = tabBarController?.tabBar.frame else { return }
        let hidden = frame.origin.y == view.frame.size.height
        frame.origin.y = hidden ? view.frame.size.height - frame.size.height : view.frame.size.height
        UIView.animate(withDuration: 0.3) {
            self.tabBarController?.tabBar.frame = frame
        }
    }
    
}
