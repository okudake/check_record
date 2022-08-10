//
//  TrackerApi.swift
//  checkRecord
//
//  Created by 奥田 健生 on 2022/08/03.
//

import Foundation

struct OkashiItem: Identifiable {
    let id = UUID()
    let name: String
    let link: URL
    let image: URL
    
}

class TrackerApi: ObservableObject {
    
    
    @Published var dataList: [ResultJson] = []
    
    
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
            DispatchQueue.main.async {
                self.dataList.removeAll()
                
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedData = try decoder.decode(ResultJson.self , from: data!)
                
                DispatchQueue.main.async {
                    self.dataList.append(decodedData)
                }
                
            
                
                print(decodedData)
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
    
    }

}
