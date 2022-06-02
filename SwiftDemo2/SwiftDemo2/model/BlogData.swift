// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let blogDataWithPage = try? newJSONDecoder().decode(BlogDataWithPage.self, from: jsonData)

import Foundation

// MARK: - BlogDataWithPage
struct BlogDataWithPage: Codable {
    let list: [Blog]
    let page: Page
}

// MARK: - List
struct Blog: Codable,Identifiable {
    let aliasString: String
    let author: Author
    let category: Category
    let content: String
    let createTime: Int
    let dateString: String
    let id: Int
    let tags: [Tag]
    let thumbnail, title: String
}

enum Author: String, Codable {
    case 梁典典 = "梁典典"
}

// MARK: - Category
struct Category: Codable {
    let createTime: Int?
    let id: Int
    let intro: String
    let logo: String
    let name: String
}

// MARK: - Tag
struct Tag: Codable {
    let id: Int
    let name: String
}

// MARK: - Page
struct Page: Codable {
    let currentPage: Int
    let hasPrevious: Bool
    let maxPage, pageSize: Int
    let paged: Bool
    let total: Int
}
