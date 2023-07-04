//
//  HomeListModel.swift
//  job-gsm
//
//  Created by 선민재 on 2023/07/05.
//

import Foundation

struct HomeListModel: Codable {
    let data: HomeListResponse
}

struct HomeListResponse: Codable {
    let idx: Float
    let companyName: String
    let address: String
    let major: String
    let thumbnailUrl: String
}
