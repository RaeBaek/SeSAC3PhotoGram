//
//  URL + Extension.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/31.
//

import UIKit

extension URL {
    
    static let UnsplashBaseURL = "https://api.unsplash.com/"
    
    static let UnsplashBaseSearchURL = UnsplashBaseURL + "search/"
    
    static func makeSearchString(tag: String) -> String {
        return UnsplashBaseSearchURL + tag
    }
    
}
