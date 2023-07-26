import UIKit

class CommonViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configBackButton()
    }
    
    private func configBackButton() {
        let yourBackImage = UIImage(systemName: "arrow.left")
        navigationController?.navigationBar.backIndicatorImage = yourBackImage
        navigationController?.navigationBar.backIndicatorTransitionMaskImage = yourBackImage
    }
    
    
}
