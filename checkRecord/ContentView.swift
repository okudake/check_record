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
                        await trackerApi.searchOkashi(keyword: inputText)
                    }
                }
                .submitLabel(.search)
                .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
