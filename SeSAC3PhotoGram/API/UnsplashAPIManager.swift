//
//  UnsplashAPIManager.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/31.
//

import UIKit
import Alamofire

class UnsplashAPIManager {
    
    static let shared = UnsplashAPIManager()
    
    private init() { }
    
    let header: HTTPHeaders = [
        "Authorization": "Client-ID \(APIKey.unsplashAccessKey)"
    ]
    
    func requestSearchPhotoAPI(searchType: SearchType, word: String, completionHandler: @escaping (Unsplash) -> Void) {
        // https://api.unsplash.com/search/photos?query=cat
        let url = searchType.requestURL + "?query=" + word
        
        print("SearchPhoto API: \(url)")
        
        AF.request(url,
                   method: .get,
                   headers: header).validate(statusCode: 200...500)
            .responseDecodable(of: Unsplash.self) { response in
                
                guard let statusCode = response.response?.statusCode else { return }
                print("SearchPhoto API StatusCode:", statusCode)
                
                switch response.result {
                case .success(let value):
                    print(value)
                    completionHandler(value)
                    
                case .failure(let error):
                    print(error)
                }
            }
        
    }
    
}
