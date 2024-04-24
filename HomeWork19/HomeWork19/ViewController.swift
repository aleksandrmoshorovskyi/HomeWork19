//
//  ViewController.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import UIKit

class ViewController: UIViewController {
    
    var model: ListModel!

    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    
    @IBAction func getButtonAction(_ sender: Any) {
        //getData()
        
        activityIndicator.startAnimating()
        
        model.loadData()
        print("loadData")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        activityIndicator.hidesWhenStopped = true
        
        model = ListModel()
        model.delegate = self
    }

    func getData() {
        
        let urlString = Constants.urlStringGetList
        
        guard let url = URL(string: urlString) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let responseError = error {
                debugPrint(responseError.localizedDescription)
            } else {
                debugPrint("ok")
                
                guard let responseData = data else { return }
                
                do {
                    let result = try JSONDecoder().decode(TotalListResponse.self, from: responseData)
                    debugPrint(result)
                } catch (let parseError) {
                    debugPrint(parseError.localizedDescription)
                }
            }
            
        }.resume()
    }
    
    func pushListViewController() {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listViewController = storyboard.instantiateViewController(withIdentifier: "ListViewController") as? ListViewController
        
        if let vc = listViewController {
            vc.dataModel = model.listItems
            navigationController?.pushViewController(vc, animated: true)
        }
        
        activityIndicator.stopAnimating()
    }
}

// MARK: - CatalogModelDelegate
extension ViewController: ListModelDelegate {
    
    func dataDidLoad() {
        
        //contentView.tableView.reloadData()
        pushListViewController()
    }
}
