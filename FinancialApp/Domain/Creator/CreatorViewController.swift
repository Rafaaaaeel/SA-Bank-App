import UIKit

final class CreatorViewController: CommonViewController, CreatorViewControllerProtocol {
    
    var interactor: CreatorInteractorInput?
    var router: CreatorRouterProtocol?
    
    var pages: [UIViewController] =  {
        let greenVC = UIViewController()
        greenVC.view.backgroundColor = .green
        
        let redVC = UIViewController()
        redVC.view.backgroundColor = .red
        
        let blueVC = UIViewController()
        blueVC.view.backgroundColor = .blue
        
        return [blueVC, redVC, greenVC]
    }()
    
    lazy var pageViewController: UIPageViewController = {
        let pageController = UIPageViewController(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
        pageController.dataSource = self
        pageController.view.translatesAutoresizingMaskIntoConstraints = false
        return pageController
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension CreatorViewController: CodableViews {
    
    func configView() {
        
        pageViewController.setViewControllers([pages[0]], direction: .forward, animated: true)
    }
    
    func setupHiearchy() {
        addChild(pageViewController)
        view.addSubview(pageViewController.view)
        pageViewController.didMove(toParent: self)
    }
    
    func setupContraints() {
        let pageViewControllerConstraints = [
            view.topAnchor.constraint(equalTo: pageViewController.view.topAnchor),
            view.leadingAnchor.constraint(equalTo: pageViewController.view.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: pageViewController.view.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: pageViewController.view.bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(pageViewControllerConstraints)
    }
    
    
}

extension CreatorViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index - 1 >= 0 else { return nil }
        
        if index == 0 {
            return pages.last
        } else {
            return pages[index - 1]
        }
        
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = pages.firstIndex(of: viewController), index + 1 < pages.count else { return nil }
        
        if index < pages.count - 1 {
            return pages[index + 1]
        } else {
            return pages.first
        }
    }
    
}
