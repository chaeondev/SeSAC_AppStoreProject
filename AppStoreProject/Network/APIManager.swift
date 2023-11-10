//
//  APIManager.swift
//  AppStoreProject
//
//  Created by Chaewon on 2023/11/09.
//

import Foundation
import RxSwift

enum APIError: Error {
    case invalidURL
    case unknown
    case statusError
}

class APIManager {
    
    static func fetchData() -> Observable<SearchAppModel> {
        return Observable<SearchAppModel>.create { observer in
            
            let urlString = "https://itunes.apple.com/search?term=todo&country=KR&media=software&lang=ko_KR&limit=10"
            
            guard let url = URL(string: urlString) else {
                observer.onError(APIError.invalidURL)
                return Disposables.create()
            }
            
            URLSession.shared.dataTask(with: url) { data, response, error in
                
                print("URLSession Succeed")
                
                if let _ = error {
                    observer.onError(APIError.unknown)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                      (200...299).contains(response.statusCode) else {
                    observer.onError(APIError.statusError)
                    return
                }
                
                if let data = data, let appData = try? JSONDecoder().decode(SearchAppModel.self, from: data) {
                    observer.onNext(appData)
                }
            }.resume()
            
            return Disposables.create()
        }
    }
}
