//
//  userDataController.swift
//  checkRecord
//
//  Created by 奥田 健生 on 2022/08/10.
//

import Foundation

class userDataViewModel: ObservableObject{
    @Published var userData: ResultJson?
    @Published var legendsData: [ResultJson.Segment]?
    
    
    var trackerApi = TrackerApi()
    
    init(){
        
    }
    
    func searchUser(userName: String) async{
        await searchUser(keyword: userName)
    }
    

    
    
    func getOverviewData() -> ResultJson.Stats {
        return (userData?.data?.segments.first?.stats!)!
    }
    
    func getKills() -> String {
        return userData?.data?.segments.first?.stats?.kills?.displayValue ?? "No data"
    }
    
    func getKillPerMatch() -> String {
        return userData?.data?.segments.first?.stats?.killsPerMatch?.displayValue ?? "No data"
    }
    
    func getActiveLegendName() -> String {
        return userData?.data?.metadata?.activeLegendName ?? "No data"
    }
    
    func getRankScore() -> String {
        return (userData?.data?.segments.first?.stats?.rankScore?.displayValue) ?? "no data"

    }
    
    func getLegendData() -> [ResultJson.Segment]?{
        //TODO nullの時エラーはくので直す
        return userData?.data?.segments
        
    }
    
    func getPlatformSlug() -> String {
        return userData?.data?.platformInfo?.platformSlug ?? "だめ"
        
    }
    
    func searchUser(keyword: String) async {
        
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else {
            return
        }
        
        
        guard let req_url = URL(string: const.ApiURL + keyword_encode)
        
        else {
            return
        }
        
        
        var request = URLRequest(url: req_url)
        request.addValue(const.TRNApiKey, forHTTPHeaderField: "TRN-Api-Key")
        
    
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            
            //検索前に一度持っているデータを全て消去
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(ResultJson.self , from: data!)
            
                DispatchQueue.main.async {
                    self.userData = decodedData

                }
                print(decodedData)

            } catch {
                print(error)
            }
        }
        task.resume()
    
    }
    
}
