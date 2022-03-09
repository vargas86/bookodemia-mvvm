//
//  BooksData.swift
//  appDesafio
//
//  Created by MacBook on 31/01/22.
//

import Foundation

// MARK: - BooksData
struct BooksData: Codable {
    let status, copyright: String
    let numResults: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case status, copyright
        case numResults = "num_results"
        case results
    }
}

// MARK: - Result
struct Result: Codable {
    let listName, displayName, listNameEncoded, oldestPublishedDate: String
    let newestPublishedDate: String
    let updated: Updated

    enum CodingKeys: String, CodingKey {
        case listName = "list_name"
        case displayName = "display_name"
        case listNameEncoded = "list_name_encoded"
        case oldestPublishedDate = "oldest_published_date"
        case newestPublishedDate = "newest_published_date"
        case updated
    }
}

enum Updated: String, Codable {
    case monthly = "MONTHLY"
    case weekly = "WEEKLY"
}
