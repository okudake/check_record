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
        let userInfo: UserInfo?
        let metadata: Metadata?
        let segments: [Segment]
    }
    
    
    
    struct PlatformInfo: Codable {
        let platformSlug: String
    }
    
    struct UserInfo: Codable {
        let userId: Int?
    }
    
    struct Metadata: Codable {
        let currentSeason: Int
        let activeLegendName: String
    }
    
    struct Segment: Codable {
        let type: String
        let stats: Stats?
        let metadata: LegendMetadata?
    }
    
    struct Stats: Codable {
        let level: StatsData?
        let kills: StatsData?
        let killsPerMatch: StatsData?
        let winningKills: StatsData?
        let damage: StatsData?
        let matchesPlayed: StatsData?
        let revives: StatsData?
        let sniperKills: StatsData?
        let rankScore: RankData?
        let arenaRankScore: RankData?
    }
    
    struct StatsData: Codable {
        let displayValue: String?
    }
    
    struct RankData: Codable {
        let displayValue: String
        let imageUrl: URL?
    }
    
    
    struct LegendMetadata: Codable {
        let name: String
        let imageUrl: URL?
    }
    
    let data: Data?
}
