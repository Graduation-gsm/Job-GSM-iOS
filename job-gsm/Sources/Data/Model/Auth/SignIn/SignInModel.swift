import Foundation

struct SignInModel: Codable {
    let data: SignInResponse
}

struct SignInResponse: Codable {
    let accessToken: String
    let refreshToken: String
    let accessTokenExpiredAt: String
    let refreshTokenExpiredAt: String
    let isExist: Bool
}
