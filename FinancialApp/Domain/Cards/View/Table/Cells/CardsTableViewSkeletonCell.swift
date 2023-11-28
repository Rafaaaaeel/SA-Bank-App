import UIKit

final class CardsTableViewSkeletonCell: UITableViewCell, Reusable {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .gray
    }
    
    required init?(coder: NSCoder) { nil }
    
}
