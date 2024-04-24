//
//  ListViewController+TableView.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import UIKit

// MARK: - UITableViewDelegate
extension ListViewController: UITableViewDelegate {
    
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
        
        cell.textLabel?.text = String(dataModel[indexPath.row].id)
        cell.detailTextLabel?.text = dataModel[indexPath.row].name
        
        return cell
    }
}
