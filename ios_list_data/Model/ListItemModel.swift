// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listItemModel = try? newJSONDecoder().decode(ListItemModel.self, from: jsonData)

import Foundation

// MARK: - ListItemModel
struct ListItemModel: Codable {
    var status: String?
    var totalResults: Int?
    var articles: [Article]?
}

// MARK: - Article
struct Article: Codable {
    var source: Source?
    var author: String?
    var title : String?
    var description: String?
    var url: String?
    var urlToImage: String?
    var publishedAt: String?
    var content: String?
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case description = "description"
        case url
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content
    }
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String
}
