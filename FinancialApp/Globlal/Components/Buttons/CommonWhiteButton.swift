import UIKit

class CommonWhiteButton: UIButton {
    
    public var height: CGFloat = 60
    public var isPressAnimationActive = true
    
    public var title: String? {
        didSet {
            setConditionsButtonTitle()
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setup() {
        configView()
        configConstraints()
        setConditionsButtonTitle()
    }
    
    func configView() {
        backgroundColor = .primaryButton
        layer.cornerRadius = height / 2 
        translatesAutoresizingMaskIntoConstraints = false
        setTitleColor(.black, for: [])
    }
    
    func configConstraints() {
        
        let constraint = [
            heightAnchor.constraint(equalToConstant: height)
        ]
        
        NSLayoutConstraint.activate(constraint)
    }
    
    private func setConditionsButtonTitle() {
        guard let title else { return }
        let attributes: [NSAttributedString.Key: Any] = [
          .foregroundColor: UIColor.black,
          .font: UIFont.systemFont(ofSize: 16, weight: .bold),
        ]
        let attributedText = NSAttributedString(string: title, attributes: attributes)
        setAttributedTitle(attributedText, for: [])
    }

}


extension CommonWhiteButton {
    
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.1) {
            guard self.isPressAnimationActive else { return }
            self.transform = CGAffineTransform(scaleX: 0.95, y: 0.95)
        }
        super.touchesBegan(touches, with: event)
    }

    public override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        UIView.animate(withDuration: 0.2) {
            guard self.isPressAnimationActive else { return }
            self.transform = CGAffineTransform.identity
        }
        super.touchesEnded(touches, with: event)
    }
    
}
