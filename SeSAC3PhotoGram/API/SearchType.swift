//
//  SearchType.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/31.
//

import Foundation

enum SearchType: String, CaseIterable {
    case photos
    case collections
    case users
    
    var requestURL: String {
        switch self {
        case .photos: return URL.makeSearchString(tag: self.rawValue)
        case .collections: return URL.makeSearchString(tag: self.rawValue)
        case .users: return URL.makeSearchString(tag: self.rawValue)
        }
    }
    
}
