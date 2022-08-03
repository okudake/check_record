//
//  ResultJson.swift
//  checkRecord
//
//  Created by 奥田 健生 on 2022/08/03.
//

import Foundation

struct ResultJson: Codable {
    struct Data: Codable {
        let platformInfo: PlatformInfo?
    }
    
    struct PlatformInfo: Codable {
        let platformSlug: String
    }
    
    let data: Data?
}
