import UIKit
 
typealias Model = DebitsModel.ViewModel

protocol DebitsViewDelegate: AnyObject {
    
    func didTouchDebit(_ id: String)
    func didTouchCreate()
    func didTouchDelete(_ id: String)
    func didTouchRetry()
    func didEndAnimation()
    
}

final class DebitsView: CommonView {
    
    var model: Model? {
        didSet {
            self.status = .done
        }
    }
    
    lazy var width: CGFloat = 0 {
        didSet {
            self.status = .done
        }
    }
    
    weak var delegate: DebitsViewDelegate?

    lazy var animationView: UIView = {
        let view = UIView(frame: CGRect(x: 168, y: 400, width: 60, height: 60))
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .white
        view.layer.cornerRadius = 30
        view.transform = CGAffineTransform(scaleX: 600, y: 600)
        return view
    }()
    
    lazy var retryButton: CommonWhiteButton = {
        let button = CommonWhiteButton()
        button.tintColor = .primaryBackground
        button.title = "Retry"
        button.isHidden = true
        button.addTarget(self, action: #selector(didTouchTry), for: .touchUpInside)
        return button
    }()
    
    lazy var errorImageView: UIImageView = {
        let image = UIImage(named: "error")
        let imageView = UIImageView(image: image)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.isHidden = true
        imageView.contentMode = .scaleAspectFit
        return imageView
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
        
    override func loadSuccess() {
        collectionView.isScrollEnabled = true
        collectionView.append(model)
        collectionView.set(width: width)
        collectionView.reload()
    }
    
    override func loadLoading() {
        collectionView.isScrollEnabled = false
    }
    
    override func loadError() {
        headerView.status = .failed
        retryButton.isHidden = false
        errorImageView.isHidden = false
    }
    
    @objc private func didTouchTry() {
        retryButton.increment()
        guard retryButton.tapCounter <= 2 else { return }
        delegate?.didTouchRetry()
    }
    
}

extension DebitsView: CodableViews {
    
    func configView() {
        backgroundColor = .primaryBackground
        headerView.delegate = self
    }
    
    func setupHiearchy() {
        addSubviews(headerView, collectionView, animationView, errorImageView, retryButton)
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
        
        let retryButtonConstraints = [
            retryButton.widthAnchor.constraint(equalToConstant: 150),
            retryButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor, constant: -24),
            retryButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        let errorImageViewConstraints = [
            errorImageView.heightAnchor.constraint(equalToConstant: 400),
            errorImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            errorImageView.centerXAnchor.constraint(equalTo: centerXAnchor)
        ]
        
        
        NSLayoutConstraint.activeAll(headerViewConstraints, collectionConstraints, retryButtonConstraints, errorImageViewConstraints)
    }

}

extension DebitsView: DebitsCollectionViewDelegate {
    
    func didTouchDelete(_ debit: Debit) {
        delegate?.didTouchDelete(debit._id)
    }
    
    func didTouch(_ debit: Debit) {
        delegate?.didTouchDebit(debit._id)
    }
    
    func didScroll(_ scrollView: UIScrollView) {
        guard let model, model.count > 6 else { return }
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
        delegate?.didTouchCreate()
    }
    
    func didStartEdditing() {
        
    }
    
    func didEndEdditting() {
        
    }
    
    func didChangedText() {
        
    }
    
}
