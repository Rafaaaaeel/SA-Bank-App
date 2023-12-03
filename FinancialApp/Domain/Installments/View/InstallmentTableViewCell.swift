import UIKit

final class InstallmentTableViewCell: UITableViewCell, Reusable {
    
    private let installmentView = InstallmentView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func render(_ section: Installment) {
        installmentView.model = section
    }
    
}

extension InstallmentTableViewCell: CodableViews {
    
    func configView() {
        installmentView.translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = .clear
    }
    
    func setupHiearchy() {
        addSubview(installmentView)
    }
    
    func setupContraints() {
        
        let installmentViewConstraints = [
            installmentView.topAnchor.constraint(equalTo: topAnchor),
            installmentView.leadingAnchor.constraint(equalTo: leadingAnchor),
            installmentView.trailingAnchor.constraint(equalTo: trailingAnchor),
            installmentView.bottomAnchor.constraint(equalTo: bottomAnchor)
        ]
        
        NSLayoutConstraint.activate(installmentViewConstraints)
    }
    
}
