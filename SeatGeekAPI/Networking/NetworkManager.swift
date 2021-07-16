//
//  NetworkManager.swift
//  SeatGeekAPI
//
//  Created by Hin Wong on 7/10/21.
//

import Foundation

//c42c0f9c5d8b41aa8656cf9cd24609c5ebaba94020f49ede4cd6535aa57e4ed4 - App secret
//https://api.seatgeek.com/2/events?client_id=MjI0OTMxOTV8MTYyNTk0ODc1My4xMjk1NDE5&q=drake - Sample request url

class NetworkManager {
    
    //MARK: - Properties
    static let baseURL = URL(string: "https://api.seatgeek.com/2/events")
    static let urlQuerySearchName = "q"
    static let apiKey = "MjI0OTMxOTV8MTYyNTk0ODc1My4xMjk1NDE5"
    static let apiKeyQueryItem = "client_id"
    
    static func fetchEvents(searchTerm: String, completion: @escaping (Result<EventResponse, EventError>) -> Void) {
        
        //1. build url
        guard let baseURL = baseURL else { return completion(.failure(.invalidURL)) }
        var urlComponents = URLComponents(url: baseURL, resolvingAgainstBaseURL: true)
        urlComponents?.queryItems = [URLQueryItem(name: apiKeyQueryItem, value: apiKey), URLQueryItem(name: urlQuerySearchName, value: searchTerm)]
        guard let finalURL = urlComponents?.url else { return completion(.failure(.invalidURL)) }
        
        //2. data task
        URLSession.shared.dataTask(with: finalURL) { data, _, error in
            
            //3. error handling
            if let error = error {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
            
            //4. check for data
            guard let data = data else {return completion(.failure(.noData))}
            
            //5. decode data
            do {
                let decodedData = try JSONDecoder().decode(EventResponse.self, from: data)
                completion(.success(decodedData))
            } catch {
                print(error, error.localizedDescription)
                return completion(.failure(.thrown(error)))
            }
        }.resume()
        
        
    }
}
