import UIKit

class CommonTextButton: UIButton {
    
    public var title: String? {
        didSet {
            setConditionsButtonTitle()
        }
    }
    
    public lazy var shouldShowPlaceholder: Bool = false
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        configView()
        setConditionsButtonTitle()
    }
    
    func configView() {
        translatesAutoresizingMaskIntoConstraints = false
    }
    
    private func setConditionsButtonTitle() {
        guard let title else { return }
        let attributes: [NSAttributedString.Key: Any] = [
          .foregroundColor: UIColor.primaryButton,
          .font: UIFont.systemFont(ofSize: 12, weight: .regular),
        ]
        
        let placeholderAtributes: [NSAttributedString.Key: Any] = [
            .font: UIFont.text,
            .foregroundColor: UIColor.secondaryText
        ]
        
        let attributedText = NSMutableAttributedString(string: title, attributes: attributes)
        let placeholderText = NSMutableAttributedString(string: Text.createAccountText, attributes: placeholderAtributes)
        
        if shouldShowPlaceholder {
            placeholderText.append(attributedText)
            setAttributedTitle(placeholderText, for: [])
            return
        }
        
        setAttributedTitle(attributedText, for: [])
    }
    
}
