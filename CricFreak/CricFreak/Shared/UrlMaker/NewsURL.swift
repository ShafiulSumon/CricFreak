//
//  NewsURL.swift
//  CricFreak
//
//  Created by Admin on 25/2/23.
//

import Foundation

struct NewsURL {
    static func getURL() -> String {
        return "https://newsapi.org/v2/everything?q=cricket&sortBy=publishedAt&apiKey=" + Constants.newsApiKey
    }
}
