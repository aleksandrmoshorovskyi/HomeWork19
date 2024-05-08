//
//  ListViewController+TableView.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import UIKit

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        tableView.deselectRow(at: indexPath, animated: true)
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listDetailesViewController = storyboard.instantiateViewController(withIdentifier: "ListDetailesViewController") as? ListDetailesViewController
        
        if let vc = listDetailesViewController {
            vc.dataModel = dataModel[indexPath.row]
            navigationController?.pushViewController(vc, animated: true)
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 60.0
    }
}

// MARK: - UITableViewDataSource
extension ListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return dataModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ListCell") else {
            assertionFailure()
            return UITableViewCell()
        }
        
        let item = dataModel[indexPath.row]
        
        cell.textLabel?.text = String(item.id)
        cell.detailTextLabel?.text = item.name
        cell.contentView.backgroundColor = UIColor(hex: item.color)
        
        return cell
    }
}
