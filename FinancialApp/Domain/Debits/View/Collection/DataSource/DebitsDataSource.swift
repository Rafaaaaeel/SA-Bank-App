import UIKit

final class DebitsDataSource: CommonBaseDataSource<Any> {
    
    var viewModel: DebitsModel.ViewModel? {
        didSet {
            model = viewModel?.data
        }
    }
    
    func debit(at index: Int) -> Debit? {
        guard let viewModel else { return nil }
        return viewModel.data[index]
    }
    
    init() {
        super.init(cells: [.loading : DebitCollectionSkelletonViewCell.identifier, .done : DebitCollectionViewCell.identifier])
    }
    
}
