import UIKit

class CommonHeadingLabel: UILabel {
    
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
        font = .heading
        textColor = .primaryText
        numberOfLines = 0
        translatesAutoresizingMaskIntoConstraints = false
    }
}
