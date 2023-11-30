import UIKit

final class InstallmentsTableView: UITableView {
    
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
        isScrollEnabled = false
    }
    
}
