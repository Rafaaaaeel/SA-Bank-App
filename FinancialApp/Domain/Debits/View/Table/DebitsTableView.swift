import UIKit

final class DebitsTableView: UITableView, UITableViewDelegate {
    
    var source: DebitsDataSource2
    
    init(source: DebitsDataSource2 = DebitsDataSource2()) {
        self.source = source
        super.init(frame: .zero, style: .plain)
        configure()
    }
    
    required init?(coder: NSCoder) {
        return nil
    }
    
    private func configure() {
        delegate = self
//        register(<#T##nib: UINib?##UINib?#>, forCellReuseIdentifier: <#T##String#>)
        dataSource = source
        backgroundColor = .clear
        translatesAutoresizingMaskIntoConstraints = false
    }
    
}

final class DebitsDataSource2: NSObject, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
}
