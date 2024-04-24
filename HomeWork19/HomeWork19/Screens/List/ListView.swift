//
//  ListView.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import UIKit

protocol ListViewDelegate: AnyObject {
    
}

class ListView: UIView {
    
    @IBOutlet weak var tableView: UITableView!
    
    weak var delegate: ListViewDelegate?
}
