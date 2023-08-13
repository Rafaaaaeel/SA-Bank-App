import UIKit
 
typealias Model = DebitsModel.ViewModel

protocol DebitsViewAnimationDelegate: AnyObject {
    func didEndAnimation()
}

final class DebitsView: UIView {
    
    var model: Model? {
        didSet {
            updateUI()
        }
    }
    
    lazy var width: CGFloat = 0 {
        didSet {
            updateUI()
        }
    }
    
    weak var animationDelegate: DebitsViewAnimationDelegate?

    lazy var animationView: UIView = {
        let view = UIView(frame: CGRect(x: 168, y: 400, width: 60, height: 60))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.transform = CGAffineTransform(scaleX: 600, y: 600)
        return view
    }()
    
    private var animationHeightAnchor: NSLayoutConstraint = NSLayoutConstraint()
    private var headerTopAnchor: NSLayoutConstraint = NSLayoutConstraint()
    
    private lazy var headerView = DebitsHeaderView()
    private lazy var collectionView = DebitsCollectionView(delegate: self, width: width)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
        animation()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    func updateUI() {
        collectionView.append(model)
        collectionView.set(width: width)
        collectionView.reload()
    }
    
}

extension DebitsView: CodableViews {
    
    func configView() {
        backgroundColor = .primaryBackground
        headerView.delegate = self
    }
    
    func setupHiearchy() {
        addSubviews(headerView, collectionView, animationView)
    }
    
    func setupContraints() {
        
        headerTopAnchor = headerView.topAnchor.constraint(equalTo: topAnchor, constant: 0)
        
        let headerViewConstraints = [
            headerTopAnchor,
            headerView.leadingAnchor.constraint(equalTo: leadingAnchor),
            headerView.trailingAnchor.constraint(equalTo: trailingAnchor)
        ]
        
        let collectionConstraints = [
            collectionView.topAnchor.constraint(equalToSystemSpacingBelow: headerView.bottomAnchor, multiplier: 0),
            collectionView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16),
            collectionView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            collectionView.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: 0)
        ]
        
        NSLayoutConstraint.activeAll(headerViewConstraints, collectionConstraints)
    }

}

extension DebitsView: DebitsCollectionViewDelegate {
    
    func didTouchItem(at index: Int) {
        print(index)
    }
    
    func didScroll(_ scrollView: UIScrollView) {
        let y = scrollView.contentOffset.y
        let mod = y.truncatingRemainder(dividingBy: scrollView.bounds.size.height )
        let difference = abs((2 * mod / (scrollView.bounds.size.height - 310)) - 1)
        let factor = y > 140 ? 0 : difference
        DispatchQueue.main.async {
            self.headerTopAnchor.constant = -y > -140 ? -y : -140
            if y > 75 {
                self.headerView.animation()
            } else {
                self.headerView.reset()
            }
            self.headerView.titleLabel.alpha = factor
            self.layoutSubviews()
        }
        
    }
    
}

extension DebitsView: DebitsHeaderViewDelegate {
    
    func didTouchCreate() {
        print("Create")
    }
    
    func didStartEdditing() {
        
    }
    
    func didEndEdditting() {
        
    }
    
    func didChangedText() {
        
    }
    
}
