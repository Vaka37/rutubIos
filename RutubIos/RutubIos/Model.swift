//
//  Model.swift
//  RutubIos
//
//  Created by Kalandarov Vakil on 21.04.2022.
//

import Foundation

struct Model : Decodable {
    let count: Int
    let hasNext: Bool
    let next: String
    let results: [Results]
    
    enum CodingKeys: String, CodingKey  {
        case count
        case hasNext = "has_next"
        case next
        case results
    }
}

struct Results: Decodable {
    let id: String
    let videoUrl: String
    let title: String
    let thumbnailURL: String
    let author: Author
    let publicationTs: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case videoUrl = "video_url"
        case title
        case thumbnailURL = "thumbnail_url"
        case author
        case publicationTs = "publication_ts"
    }
}

struct Author: Codable {
    let name: String
    
    enum CodingKeys: String, CodingKey {
        case name
        
    }
}

struct ModelVideo: Decodable {
    let html: String?
    
    enum CodingKeys: String, CodingKey {
        case html
    }
}
