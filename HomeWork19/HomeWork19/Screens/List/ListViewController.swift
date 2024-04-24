//
//  ListViewController.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import UIKit

class ListViewController: UIViewController {
    
    @IBOutlet var contentView: ListView!
    
    var dataModel: [ListResponse]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List"
        
        //model
        
        contentView.delegate = self
        
        contentView.tableView.dataSource = self
        contentView.tableView.delegate = self
    }
}

// MARK: - ListModelDelegate
extension ListViewController: ListModelDelegate {
    
    func dataDidLoad() {
        
        contentView.tableView.reloadData()
    }
}

// MARK: - ListViewDelegate
extension ListViewController: ListViewDelegate {
    
}
