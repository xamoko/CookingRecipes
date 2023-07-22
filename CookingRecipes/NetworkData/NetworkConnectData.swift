//
//  NetworkConnectData.swift
//  CookingRecipes
//
//  Created by Xavier Morales on 18/07/23.
//

import Foundation

protocol PassingData: AnyObject {
    func showingDatas(datas: [CoockList])
}

class NetworkConnectData {
    
    weak var passingDataDeleate: PassingData!
    
    func apiConnection() {
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
                if let data = data {
                    if let books = try? JSONDecoder().decode(DatasCook.self, from: data) {
                        self.passingDataDeleate.showingDatas(datas: books.results)
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

