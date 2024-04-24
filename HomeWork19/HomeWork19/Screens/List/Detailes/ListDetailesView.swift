//
//  ListDetailesView.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import UIKit

protocol ListDetailesViewDelegate: AnyObject {
    
}

class ListDetailesView: UIView {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var yearLabel: UILabel!
    @IBOutlet weak var colorLabel: UILabel!
    @IBOutlet weak var pantoneLabel: UILabel!
    
    weak var delegate: ListDetailesViewDelegate?
}

/*
 id: 1,
 name: "cerulean",
 year: 2000,
 color: "#98B2D1",
 pantone_value: "15-4020"
 */
