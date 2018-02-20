//
//  SearchResult.swift
//  StoreSearch
//
//  Created by Campbell Graham on 20/2/18.
//  Copyright © 2018 someIndustry. All rights reserved.
//

import Foundation

class ResultArray: Codable {
    var resultCount = 0
    var results = [SearchResult]()
}

class SearchResult: Codable, CustomStringConvertible {
    var description: String {
        return "Name: \(name), Artist Name: \(artistName)"
    }
    
    var trackName = ""
    var artistName = ""
    
    var name: String {
        return trackName
    }
}
