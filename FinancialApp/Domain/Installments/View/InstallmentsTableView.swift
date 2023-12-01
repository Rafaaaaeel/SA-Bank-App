import UIKit

final class InstallmentsTableView: SelfSizedTableview {
    
    var source: InstallmentDataSource
    
    init(source: InstallmentDataSource = InstallmentDataSource()) {
        self.source = source
        super.init(frame: .zero, style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func add(_ installments: [Installment]) {
        source.installments = installments
        reloadData()
    }
    
    private func configure() {
        dataSource = source
        register(InstallmentTableViewCell.self, forCellReuseIdentifier: InstallmentTableViewCell.identifier)
        backgroundColor = .darkGray
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        layer.cornerRadius = 8
        estimatedRowHeight = 100
        rowHeight = UITableView.automaticDimension
    }
    
}

public class SelfSizedTableview: UITableView {
    
    override public var contentSize: CGSize {
        didSet {
            invalidateIntrinsicContentSize()
            setNeedsLayout()
        }
    }
    
    override public var intrinsicContentSize: CGSize {
        let height = min(.infinity, contentSize.height)
        return CGSize(width: contentSize.width, height: height)
    }
    
}
