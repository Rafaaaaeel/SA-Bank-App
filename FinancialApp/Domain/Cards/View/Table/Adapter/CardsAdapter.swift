import UIKit

protocol CardsAdapterDelegate: AnyObject {
    
    func didTouchCell(at position: CGRect, at index: Int)
    
}

final class CardsAdapter: NSObject, UITableViewDelegate {
    
    weak var delegate: CardsAdapterDelegate?
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.rectForRow(at: indexPath)
        let position = tableView.convert(cell, to: tableView.superview)
        
        let finalPosition = CGRect(x: position.origin.x + 8,
                                   y: position.origin.y + 8,
                                   width: position.width - 16,
                                   height: position.height - 16)
        
        delegate?.didTouchCell(at: position, at: indexPath.row)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
    }
    
}
