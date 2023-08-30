//
//  APIService.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/30.
//

import Foundation

class APIService {
    
    private init() { }
    
    static let shared = APIService() // 인스턴스 생성 방지
    
    func callRequest() {
        
        guard let url = URL(string: "https://apod.nasa.gov/apod/image/2308/M66_JwstTomlinson_3521.jpg") else { return }
        
        let request = URLRequest(url: url)
        
        // 가장 기본적인 설정으로 dataTask를 설정
        // 용량이 꽤 큰 데이터라면 lownloadTask가 적합할 것이다.
        URLSession.shared.dataTask(with: request) { data, response, error in
            print(data)
            
            let value = String(data: data!, encoding: .utf8)
            print(value)
            
            print(response)
            print(error)
            
        }.resume()
    }
}
