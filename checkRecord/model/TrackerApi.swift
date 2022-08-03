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
    
    
    @Published var okashiList: [OkashiItem] = []
    func searchOkashi(keyword: String) async {
        
        guard let keyword_encode = keyword.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        else {
            return
        }
        
        
        guard let req_url = URL(string: "https://public-api.tracker.gg/v2/apex/standard/profile/psn/\(keyword_encode)")
        
        else {
            return
        }
        
        var request = URLRequest(url: req_url)
        request.addValue("d0c20a65-5dc6-47b4-b920-baa10d6a56ce", forHTTPHeaderField: "TRN-Api-Key")
        
    
        let task = URLSession.shared.dataTask(with: request) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                let json = try decoder.decode(ResultJson.self , from: data!)
                
                print(json.data?.platformInfo?.platformSlug)
                
                print(data!)
            } catch {
                print(error)
            }
            
        }
        task.resume()
        
        print(self.okashiList)
    
    }

}
