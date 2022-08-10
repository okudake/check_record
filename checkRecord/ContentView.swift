//
//  ContentView.swift
//  checkRecord
//
//  Created by 奥田 健生 on 2022/08/03.
//

import SwiftUI

struct ContentView: View {
    @StateObject var trackerApi = TrackerApi()
    @State var inputText = ""
    
    var body: some View {
        VStack {
            TextField("ユーザーネーム", text: $inputText, prompt: Text("ユーザーネームを入力してね！"))
                .onSubmit {
                    Task {
                        await trackerApi.searchUser(keyword: inputText)
                    }
                }
                .submitLabel(.search)
                .padding()
            
            Button(action: {
                Task {
                    await trackerApi.searchUser(keyword: "k_n399")
                }
            }, label:  {
                Text("k_n399で検索する")
            })
            
            Spacer()
            
            if let unwrappedUserData = trackerApi.dataList.first{
                let userData = userData(Data: unwrappedUserData)
                let overviewData = userData.getOverviewData()
                
                Text("総キル数:" + userData.getKills())
                Text("ランク: " + userData.getRankScore())
                
                List {
                    ForEach(1 ..< 6) { index in
                        let legendData = userData.getLegendData(index: index)

                        VStack{
                            Text(legendData.name)
                                .font(.title)

                            HStack{
                                //レジェンド画像
                                AsyncImage(url: legendData.imageUrl) { image in
                                    image
                                        .resizable()
                                        .frame(width: 100, height: 100)

                                } placeholder: {
                                    ProgressView()
                                }

                            }
                        }
                    }
                }
            }
            
            
            
            
            Spacer()
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
