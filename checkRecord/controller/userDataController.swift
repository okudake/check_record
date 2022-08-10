//
//  userDataController.swift
//  checkRecord
//
//  Created by 奥田 健生 on 2022/08/10.
//

import Foundation

class userData{
    @Published var userData: ResultJson
    
    init(Data: ResultJson){
        userData = Data
    }
    
    func getOverviewData() -> ResultJson.Stats {
        return userData.data?.segments.first?.stats ?? ResultJson.Stats
    }
    
    func getKills() -> String {
        return (userData.data?.segments.first?.stats?.kills?.displayValue!)!
    }
    
    func getKillPerMatch() -> String {
        return (userData.data?.segments.first?.stats?.killsPerMatch?.displayValue!)!
    }
    
    func getRankScore() -> String {
        return (userData.data?.segments.first?.stats?.rankScore?.displayValue)!

    }
    
    func getLegendData(index: Int) -> ResultJson.LegendMetadata {
        //TODO nullの時エラーはくので直す
        return (userData.data?.segments[index].metadata!)!
        
    }
    
    func getPlatformSlug() -> String {
        return userData.data?.platformInfo?.platformSlug ?? "だめ"
        
    }
    
}
