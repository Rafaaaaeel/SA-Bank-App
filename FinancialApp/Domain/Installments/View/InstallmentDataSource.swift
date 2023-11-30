import UIKit

final class InstallmentDataSource: NSObject, UITableViewDataSource {
    
    var installments: [Installment] = []
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return installments.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InstallmentTableViewCell.identifier, for: indexPath) as! InstallmentTableViewCell
        cell.render(installments[indexPath.row])
        return cell
    }
    
}
