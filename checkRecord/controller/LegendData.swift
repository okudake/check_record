//
//  LegendData.swift
//  checkRecord
//
//  Created by 奥田 健生 on 2022/08/10.
//

import Foundation


//今のとこいらない
class legendData{
    var legendData: ResultJson.LegendMetadata
    
    init(Data: ResultJson.LegendMetadata){
        legendData = Data
    }
    
    //imageUrlを返す
    func getImageUrl() -> URL {
        return legendData.imageUrl!
    }
    
    //legendの名前を返す
    func getLegendName() -> String {
        return legendData.name
    }
}

