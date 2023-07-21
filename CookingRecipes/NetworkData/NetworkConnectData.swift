//
//  NetworkConnectData.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 18/07/23.
//

import Foundation

class NetworkConnectData {
    
    func apiConnection() {
       /* guard let url = URL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes") else {
            print("Invalid URL")
            return }
        
        let headers = [
            "X-RapidAPI-Key": "0cbb6da51amsh0d6198b65e16b59p1c736cjsn97dcd9e09d37",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]
        
        var request = URLRequest(url: url)

        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers
        
        let task = URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                print(String(data: data, encoding: .utf8)!)
                if let books = try? JSONDecoder().decode(DatasCook.self, from: data) {
                    print(books.results)
                } else {
                    print("Invalid Response \(data)")
                }
            } else if let error = error {
                print("HTTP Request Failed \(error)")
            }
        }.resume()*/
        
        let headers = [
            "X-RapidAPI-Key": "0cbb6da51amsh0d6198b65e16b59p1c736cjsn97dcd9e09d37",
            "X-RapidAPI-Host": "tasty.p.rapidapi.com"
        ]

        let request = NSMutableURLRequest(url: NSURL(string: "https://tasty.p.rapidapi.com/recipes/list?from=0&size=20&tags=under_30_minutes")! as URL,
                                                cachePolicy: .useProtocolCachePolicy,
                                            timeoutInterval: 10.0)
        request.httpMethod = "GET"
        request.allHTTPHeaderFields = headers

        let session = URLSession.shared
        let dataTask = session.dataTask(with: request as URLRequest, completionHandler: { (data, response, error) -> Void in
            if (error != nil) {
                print(error as Any)
            } else {
                //let httpResponse = response as? HTTPURLResponse
                //print(httpResponse)
                if let data = data {
                    if let books = try? JSONDecoder().decode(DatasCook.self, from: data) {
                        print(books.count)
                    } else {
                        print("Invalid Response \(data)")
                    }
                } else if let error = error {
                    print("HTTP Request Failed \(error)")
                }
            }
        })

        dataTask.resume()
    }
    
}

