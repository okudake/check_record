//
//  MyDataView.swift
//  checkRecord
//
//  Created by 奥田 健生 on 2022/08/26.
//

import SwiftUI

struct MyDataView: View {
    var body: some View {
        NavigationView {
                    List {
                        Text("りんご")
                        Text("みかん")
                        Text("スイカ")
                    }
                    .navigationTitle("自分のデータ")
                    .navigationBarTitleDisplayMode(.large)
                }
    }
}

struct MyDataView_Previews: PreviewProvider {
    static var previews: some View {
        MyDataView()
    }
}
