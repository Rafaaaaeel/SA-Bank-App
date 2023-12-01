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
    }
    
    private func configure() {
        dataSource = source
        register(InstallmentTableViewCell.self, forCellReuseIdentifier: InstallmentTableViewCell.identifier)
        backgroundColor = .systemGray6
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        layer.cornerRadius = 8
        estimatedRowHeight = 60
        rowHeight = 50
//        rowHeight = UITableView.automaticDimension
        layer.opacity = 0
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
