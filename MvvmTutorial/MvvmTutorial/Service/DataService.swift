//
//  DataService.swift
//  MvvmTutorial
//
//  Created by Tim on 26/02/2021.
//

import Foundation

struct DataService {
    //MARK:- Singleton
    static let shared = DataService()
    
    //MARK:- Services
    func requestPost(completion: @escaping ([Posts?], Error?) -> ()) {
        let url = URL(string: "\(Api.baseURL)/posts")!
        
        let task = URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
            if let error = error {
                print("Error with fetching films: \(error)")
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse,
                  (200...299).contains(httpResponse.statusCode) else {
                print("Error with the response, unexpected status code: \(response ?? URLResponse())")
                return
            }
            
            if let data = data,
               let postData = try? JSONDecoder().decode([Posts].self, from: data) {
                completion(postData, nil)
            }
        })
        task.resume()
    }
}
