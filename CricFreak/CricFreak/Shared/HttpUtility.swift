//
//  HttpUtility.swift
//  CricFreak
//
//  Created by Admin on 15/2/23.
//

import Foundation

final class HttpUtility {
    static let shared = HttpUtility()
    private init() {}
    
    func getDataFromAPI<T: Codable>(url: String, completion: @escaping (Result<T,Error>)->Void ) {
        print(url)
        guard let url = URL(string: url) else { return }
        
        let session = URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
            }
            else {
                guard let data = data else { return }
                do {
                    let result = try JSONDecoder().decode(T.self, from: data)
                    completion(.success(result))
                }
                catch {
                    completion(.failure(error))
                }
            }
        }
        session.resume()
    }
}
