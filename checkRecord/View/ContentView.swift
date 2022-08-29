//
//  ContentView.swift
//  checkRecord
//
//  Created by 奥田 健生 on 2022/08/03.
//

import SwiftUI

struct ContentView: View {
    
    @State var inputText = ""
    @ObservedObject var userData = userDataViewModel()
    
    
    var body: some View {
        
        let _ = Self._printChanges()
        VStack {
            TextField("ユーザーネーム", text: $inputText, prompt: Text("ユーザーネームを入力してね！"))
                .onSubmit {
                    Task {
                        await userData.searchUser(userName: "k_n399")
                    }
                }
                .submitLabel(.search)
                .padding()
            
            Button(action: {
                Task {
                    await userData.searchUser(userName: "k_n399")
                    
                }
            }, label:  {
                Text("k_n399で検索する")
            })
            
            VStack {
                HStack {
                    Image(systemName: "star")
                    
                    AsyncImage(url: URL(string: "https://trackercdn.com/cdn/apex.tracker.gg/legends/portraits/pathfinder.png")) { image in
                        image
                            .resizable()
                            .frame(width: 60, height: 60)
                    Text(userData.getActiveLegendName())
                    } placeholder: {
                        ProgressView()
                    }
                }
                
                Text("総キル数:" + userData.getKills())
                Text("ランク: " + userData.getRankScore())
                
            }
            
            //                    ForEach(0 ..< (userData.userData?.data?.segments.count ?? 0)) { i in
            //                        let legendData = userData.overviewData?[i].metadata
            //                        VStack{
            //                            Text(legendData?.name ?? "pas")
            //                                .font(.title)
            //
            //                            HStack{
            //                                //レジェンド画像
            //                                AsyncImage(url: legendData?.imageUrl) { image in
            //                                    image
            //                                        .resizable()
            //                                        .frame(width: 100, height: 100)
            //
            //                                } placeholder: {
            //                                    ProgressView()
            //                                }
            //
            //                            }
            //
            //                        }
            //                    }
        }
        
        TabView {
                    TabAView()
                        .tabItem {
                            VStack {
                                Image(systemName: "a")
                                Text("TabA")
                            }
                    }.tag(1)
                    TabBView()
                        .tabItem {
                            VStack {
                                Image(systemName: "bold")
                                Text("TabB")
                            }
                    }.tag(2)
                }
        
        
        Spacer()
        
    }
}

struct TabAView: View {
    var body: some View {
        Text("TabA")
    }
}
struct TabBView: View {
    var body: some View {
        Text("自分のデータ")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .previewInterfaceOrientation(.portraitUpsideDown)
    }
}
