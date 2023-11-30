import UIKit

final class InstallmentTableViewCell: UITableViewCell, Reusable {
    
    private let installmentView = InstallmentView()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func render(_ section: Installment) {
        
    }
    
}

extension InstallmentTableViewCell: CodableViews {
    
    func configView() {
        backgroundColor = .clear
    }
    
    func setupHiearchy() {
        addSubview(installmentView)
    }
    
    func setupContraints() {
        installmentView.frame = frame
    }
    
}
