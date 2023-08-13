import UIKit

protocol DebitsHeaderViewDelegate: AnyObject {
    
    func didTouchCreate()
    func didStartEdditing()
    func didEndEdditting()
    func didChangedText()
    
}

final class DebitsHeaderView: UIView {

    weak var delegate: DebitsHeaderViewDelegate?
    
    private lazy var titleLabel: CommonTitleLabel = {
        let label = CommonTitleLabel()
        label.text = Text.Debits.headerTitle
        return label
    }()
    
    private lazy var searchTextField: CommonTextField = {
        let textField = CommonTextField()
        textField.iconImage = SFImages.TabBar.search
        textField.commonPlaceholder = Text.Debits.searchPlaceholder
        textField.textDelegate = self
        return textField
    }()
    
    private lazy var createButton: CommonWhiteButton = {
        let button = CommonWhiteButton()
        button.isPressAnimationActive = true
        let image = UIImage(systemName: SFImages.Debits.create, withConfiguration: UIImage.SymbolConfiguration(scale: .large))
        button.tintColor = .primaryBackground
        button.setImage(image, for: [])
        button.addTarget(self, action: #selector(didTouchCreate), for: .touchUpInside)
        return button
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    @objc private func didTouchCreate() {
        delegate?.didTouchCreate()
    }
    
}


extension DebitsHeaderView: CodableViews {
    
    func configView() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
        alpha = 1
    }
    
    func setupHiearchy() {
        addSubviews(titleLabel, createButton, searchTextField)
    }
    
    func setupContraints() {
        self.heightAnchor.constraint(equalToConstant: 300).isActive = true
        
        let createButtonConstraints = [
            createButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16),
            createButton.centerYAnchor.constraint(equalTo: centerYAnchor),
            createButton.widthAnchor.constraint(equalToConstant: 60)
        ]
        
        let titleLabelConstraints = [
            titleLabel.topAnchor.constraint(equalToSystemSpacingBelow: safeAreaLayoutGuide.topAnchor, multiplier: 0),
            titleLabel.leadingAnchor.constraint(equalToSystemSpacingAfter: leadingAnchor, multiplier: 2),
            trailingAnchor.constraint(equalToSystemSpacingAfter: titleLabel.trailingAnchor, multiplier: 2)
        ]
        
        
        let searchTextFieldConstraints = [
            searchTextField.topAnchor.constraint(equalToSystemSpacingBelow: titleLabel.bottomAnchor, multiplier: 2),
            searchTextField.leadingAnchor.constraint(equalTo: titleLabel.leadingAnchor),
            searchTextField.trailingAnchor.constraint(equalTo: createButton.trailingAnchor)
        ]
        
        NSLayoutConstraint.activeAll(titleLabelConstraints, createButtonConstraints, searchTextFieldConstraints)
        
    }
    
}

extension DebitsHeaderView: CommonTextFieldDelegate {
    
    func didStartEdditing() {
        delegate?.didStartEdditing()
    }
    
    func didEndEdditting() {
        delegate?.didEndEdditting()
    }
    
    func didChangedText() {
        delegate?.didChangedText()
    }
    
}
