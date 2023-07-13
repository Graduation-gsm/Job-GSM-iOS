import Foundation

struct ProfileModel: Codable {
    let data: ProfileResponse
}

struct ProfileResponse: Codable {
    let name: String
    let phoneNumber: String
    let portfolioUrl: String
    let major: String
    let jobCount: Int
    let profileUrl: String
}
