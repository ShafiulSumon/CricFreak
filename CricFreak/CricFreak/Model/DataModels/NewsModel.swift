//
//  NewsModel.swift
//  CricFreak
//
//  Created by Admin on 25/2/23.
//

import Foundation

// MARK: - Welcome
struct NewsModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title, description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String?
}
