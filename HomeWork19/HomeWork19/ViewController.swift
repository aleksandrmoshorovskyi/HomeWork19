//
//  ViewController.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func getButtonAction(_ sender: Any) {
        getData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    func getData() {
        
        let urlString = "https://reqres.in/api/unknown"
        
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
}

/*
 {
 page: 1,
 per_page: 6,
 total: 12,
 total_pages: 2,
 data: [
 {
 id: 1,
 name: "cerulean",
 year: 2000,
 color: "#98B2D1",
 pantone_value: "15-4020"
 },
 */

struct TotalListResponse: Decodable {
    
    var page: Int
    var perPage: Int
    var total: Int
    var totalPages: Int
    var list: [ListResponse]
    
    enum CodingKeys: String, CodingKey {
         case page
         case perPage = "per_page"
         case total
         case totalPages = "total_pages"
         case list = "data"
    }
    
    struct ListResponse: Decodable {
     
        var id: Int
        var name: String
        var year: Int
        var color: String
        var pantoneValue: String
        
        enum CodingKeys: String, CodingKey {
             case id
             case name
             case year
             case color
             case pantoneValue = "pantone_value"
        }
    }
}

