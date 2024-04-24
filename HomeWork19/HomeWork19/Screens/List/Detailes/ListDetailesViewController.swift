//
//  ListDetailesViewController.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import UIKit

class ListDetailesViewController: UIViewController {
    
    @IBOutlet weak var contentView: ListDetailesView!
    
    var dataModel: ListResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "List detailes"
        
        contentView.delegate = self
        
        if let model = dataModel {
            contentView.idLabel.text = "id: \(model.id)"
            contentView.nameLabel.text = "name: \(model.name)"
            contentView.yearLabel.text = "year: \(model.year)"
            contentView.colorLabel.text = "color: \(model.color)"
            contentView.pantoneLabel.text = "pantone_value: \(model.pantoneValue)"
            
            contentView.backgroundColor = UIColor(hex: dataModel.color)
        } else {
            contentView.idLabel.text = "id: ???"
        }
    }
}

// MARK: - ListViewDelegate
extension ListDetailesViewController: ListDetailesViewDelegate {
    
}

/*
 id: 1,
 name: "cerulean",
 year: 2000,
 color: "#98B2D1",
 pantone_value: "15-4020"
 */
