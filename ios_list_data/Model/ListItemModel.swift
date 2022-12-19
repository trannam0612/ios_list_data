// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let listItemModel = try? newJSONDecoder().decode(ListItemModel.self, from: jsonData)

import Foundation

// MARK: - ListItemModel
struct ListItemModel: Codable {
    var status: String? = nil
    var totalResults: Int? = nil
    var articles: [Article]? = nil
}

// MARK: - Article
struct Article: Codable {
    var source: Source? = nil
    var author: String? = nil
    var title : String? = nil
    var description: String? = nil
    var url: String? = nil
    var urlToImage: String? = nil
//    var publishedAt: Date? = nil
    var content: String? = nil
    
    enum CodingKeys: String, CodingKey {
        case source, author, title
        case description = "description"
        case url, urlToImage = "urlToImage"
//        , publishedAt = "published_at",
        case content
    }
}

// MARK: - Source
struct Source: Codable {
    var id: String?
    var name: String
}
