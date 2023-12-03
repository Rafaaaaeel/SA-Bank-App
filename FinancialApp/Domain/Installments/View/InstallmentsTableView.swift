import UIKit

final class InstallmentsTableView: SelfSizedTableview {
    
    var source: InstallmentDataSource
    var adapter: InstallmentAdapter
    
    init(source: InstallmentDataSource = InstallmentDataSource(), adatper: InstallmentAdapter = InstallmentAdapter()) {
        self.source = source
        self.adapter = adatper
        super.init(frame: .zero, style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) { nil }
    
    func add(_ installments: [Installment]) {
        source.installments = installments
    }
    
    private func configure() {
        dataSource = source
        delegate = adapter
        register(InstallmentTableViewCell.self, forCellReuseIdentifier: InstallmentTableViewCell.identifier)
        backgroundColor = .secundaryBackground
        translatesAutoresizingMaskIntoConstraints = false
        showsVerticalScrollIndicator = false
        layer.cornerRadius = 8
        estimatedRowHeight = 120
        rowHeight = UITableView.automaticDimension
        isScrollEnabled = false
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
