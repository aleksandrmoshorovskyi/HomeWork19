//
//  DataLoaderService.swift
//  HomeWork19
//
//  Created by Aleksandr Moroshovskyi on 24.04.2024.
//

import Foundation

class DataLoaderService {
    
    func loadList(completion: @escaping (TotalListResponse?) -> ()) {
        
        let urlString = Constants.urlStringGetList
        
        guard let url = URL(string: urlString) else {
            assertionFailure()
            completion(nil)
            return
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            if let responseError = error {
                debugPrint(responseError.localizedDescription)
            } else {
                debugPrint("ok")
                
                guard let responseData = data else { return }
                
                var result: TotalListResponse?
                
                do {
                    result = try JSONDecoder().decode(TotalListResponse.self, from: responseData)
                    debugPrint(result!)
                } catch (let parseError) {
                    debugPrint(parseError.localizedDescription)
                }
                
                completion(result)
            }
            
        }.resume()
    }
}
