import UIKit

protocol DebitsAdapterDelegate: AnyObject {
    
    func didTouchItem(at index: Int)
    func didScroll(_ scrollView: UIScrollView)
    func didTouchDelete(at index: Int)
}

final class DebitsAdapter: NSObject, UICollectionViewDelegate {
    
    weak var delegate: DebitsAdapterDelegate?
    
    var width: Double = 0
    var spacing: CGFloat = 30
    
    override init() { }
    
}

extension DebitsAdapter: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return spacing
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = width
        return CGSize(width: width, height: height)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        delegate?.didTouchItem(at: indexPath.item)
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        delegate?.didScroll(scrollView)
    }
    
    func collectionView(_ collectionView: UICollectionView, contextMenuConfigurationForItemsAt indexPaths: [IndexPath], point: CGPoint) -> UIContextMenuConfiguration? {
        guard let indexPath = indexPaths.first else { return UIContextMenuConfiguration() }
        guard let cell = collectionView.cellForItem(at: indexPath) else { return UIContextMenuConfiguration() }

        let menu = configureContextMenu(cell, at: indexPath.item)
        
        return UIContextMenuConfiguration(identifier: nil, previewProvider: nil, actionProvider: { _ in menu })
    }
    
    private func configureContextMenu(_ cell: UICollectionViewCell, at index: Int) -> UIMenu {
        let deleteAction = UIAction(title: "Remover", image: UIImage(systemName: "trash"), attributes: .destructive) { _ in
            if let debitsCell = cell as? DebitCollectionViewCell {
                debitsCell.delegate = self
                debitsCell.deleteAnimation(at: index)
            }
        }
        
        return UIMenu(options: .displayInline, children: [deleteAction])
    }
    
}

extension DebitsAdapter: DebitCollectionViewCellDelegate {
    
    func didEndAnimation(at index: Int) {
        delegate?.didTouchDelete(at: index)
    }
    
    
}
