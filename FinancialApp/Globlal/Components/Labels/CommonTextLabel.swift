import UIKit

class CommonTextLabel: UILabel {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setup() {
        configView()
    }
    
    private func configView() {
        font = .text
        textColor = .secondaryText
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
