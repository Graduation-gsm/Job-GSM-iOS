import Foundation

struct DetailModel: Codable {
    let data: DetailResponse
}

struct DetailResponse: Codable {
    let companyName: String
    let address: String
    let description: String
    let major: [String]
    let business: String // 주요 업무
    let qualification: String // 자격 요건
    let preferential: String // 우대 사항
    let procedure: String // 절차
    let militaryService: String // 병역 특례
    let humanResourcesInfo: String // 인사 담당자 정보
    let homePage: String
    let detailLink: String // 별도 링크
    let employmentCount: Int // 채용 수
    let hireTime: String // 채용 시기
    let totalEmploymentCount: Int // 총 사원수
    let swEmploymentCount: Int // sw 사원수
    let capital: Int // 자본금
    let annualSales: Int// 연간 매출
    let companyPhoneNumber: String
    let ceoName: String
    let isExistDormitory: Bool
    let isExistMeals: Bool
    let isExistBus: Bool
    let thumbnailUrl: String

}
