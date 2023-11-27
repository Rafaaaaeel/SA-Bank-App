import UIKit

final class DebitsTableViewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder: NSCoder) { nil }
    
}

extension DebitsTableView: CodableViews {
    
    func setupHiearchy() {
        
    }
    
    func setupContraints() {
        
    }
    
}
