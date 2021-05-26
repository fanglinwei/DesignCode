//
//  TabBar.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/24.
//

import SwiftUI

struct TabBar: View {
    var body: some View {
        TabView() {
            Home()
                .tabItem {
                    Image("IconHome")
                    Text("Home")
                }
                .tag(0)
            
            ContentView()
                .tabItem {
                    Image("IconCards")
                    Text("Cards")
                }
                .tag(1)
            
            Settings()
                .tabItem {
                    Image("IconSettings")
                    Text("Settings")
                }
                .tag(2)
        }
    }
}

struct TabBar_Previews: PreviewProvider {
    static var previews: some View {
        TabBar()
    }
}
