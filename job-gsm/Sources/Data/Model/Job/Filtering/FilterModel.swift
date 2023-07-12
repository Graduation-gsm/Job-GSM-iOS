import Foundation

struct FilterModel: Codable {
    let data: FilterResponse
}

struct FilterResponse: Codable {
    let idx: Int
    let companyName: String
    let address: String
    let thumbnailUrl: String
}
