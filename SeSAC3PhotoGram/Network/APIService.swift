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
    
    func callRequest(query: String, completionHandler: @escaping (Photo?) -> Void) {
        
        guard let url = URL(string: "https://api.unsplash.com/search/photos?query=\(query)&client_id=\(APIKey.unsplashAccessKey)") else { return }
        
        let request = URLRequest(url: url, timeoutInterval: 10)
        
        // 가장 기본적인 설정으로 dataTask를 설정
        // 용량이 꽤 큰 데이터라면 lownloadTask가 적합할 것이다.
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            DispatchQueue.main.async {
                if let error {
                    print(error)
                    completionHandler(nil)
                    return
                }
                
                guard let response = response as? HTTPURLResponse,
                (200...500).contains(response.statusCode) else {
                    print(error) // Alert 또는 Do try Catch 등
                    completionHandler(nil)
                    return
                }
                
                guard let data = data else {
                    print(data)
                    completionHandler(nil)
                    return
                }
                
                do {
                    let result = try JSONDecoder().decode(Photo.self, from: data)
                    print(result)
                    completionHandler(result)
                } catch {
                    print(error) // 디코딩 오류 키
                    completionHandler(nil)
                }
            }
            
        }.resume()
    }
}


// 필요한 것들만 빼서 정의하고 사용할 수 있다!!!
struct Photo: Codable {
    let total: Int?
    let total_pages: Int?
    let results: [PhotoResult]?
    
    struct PhotoResult: Codable {
        let id: String
        let urls: PhotoURL
    }
}

struct PhotoURL: Codable {
    let full: String
    let thumb: String
}
