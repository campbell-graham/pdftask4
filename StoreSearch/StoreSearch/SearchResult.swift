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
        return "Kind: \(kind), Name: \(name), Artist Name: \(artistName)"
    }
    
    var trackName = ""
    var artistName = ""
    var kind = ""
    var trackPrice = 0.0
    var currency = ""
    var imageSmall = ""
    var imageLarge = ""
    var storeURL = ""
    var genre = ""
    
    enum CodingKeys: String, CodingKey {
        case imageSmall = "artworkUrl60"
        case imageLarge = "artworkUrl100"
        case storeURL = "trackViewUrl"
        case genre = "primaryGenreName"
        case kind, artistName, trackName
        case trackPrice, currency
    }
    
    var name: String {
        return trackName
    }
}
