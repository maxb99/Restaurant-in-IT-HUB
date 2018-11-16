//
//  MenuController.swift
//  Restaurant
//
//  Created by Denis Bystruev on 13/11/2018.
//  Copyright © 2018 Denis Bystruev. All rights reserved.
//

import Foundation

class MenuController {
    let baseURL = URL(string: "http://api.armenu.net:8090/")!
    
    func fetchCategories(completion: @escaping ([String]?) -> Void) {
        let categoryURL = baseURL.appendingPathComponent("categories")
        let task = URLSession.shared.dataTask(with: categoryURL) {
            data, response, error in
            
            guard let data = data else {
                completion(nil)
                return
            }
            
            guard let jsonDictionary = try? JSONSerialization.jsonObject(with: data) as? [String: Any] else {
                completion(nil)
                return
            }
            
            guard let categories = jsonDictionary?["categories"] as? [String] else {
                completion(nil)
                return
            }
            
            completion(categories)
        }
        task.resume()
    }
    
    
}
