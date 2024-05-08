//
//  ListModel.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import Foundation

protocol ListModelDelegate: AnyObject {
    
    func dataDidLoad()
}

class ListModel {
    
    weak var delegate: ListModelDelegate?
    private let dataLoader = DataLoaderService()
    
    var listData: TotalListResponse!
    
    func loadData() {
     
        DispatchQueue.global(qos: .default).async { [weak self] in
            guard let self = self else { return }
            
            dataLoader.loadList { [weak self] totalList in
                guard let self = self else { return }
                
                DispatchQueue.main.async {
                    self.listData = totalList
                    self.delegate?.dataDidLoad()
                }
            }
        }
    }
}
