import Foundation

struct RefreshTokenModel: Codable {
    let data: RefreshTokenResponse
}

struct RefreshTokenResponse: Codable {
    let accessToken: String
    let accessTokenExpiredAt: String
    let refreshToken: String
    let refreshTokenExpiredAt: String
}
