//
//  Home.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/21.
//

import SwiftUI

let status = UIApplication.shared.windows.first?.safeAreaInsets.top
let windows = UIApplication.shared.windows.first

let screen = UIScreen.main.bounds

struct Home: View {
    
    @State var show = false
    
    @State var showProfile = false
    
    var body: some View {
        ZStack {
            
            HomeList()
                .blur(radius: show ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
            
            ContentView()
                .frame(minWidth: 0, maxWidth: 712)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 40 : UIScreen.main.bounds.height)
            
            MenuButton(show: $show)
                .offset(x: -30, y: showProfile ? 0 : 80)
                .animation(.spring())
            
            MenuRight(show: $showProfile)
                .offset(x: -16, y: showProfile ? 0 : 88)
                .animation(.spring())
            
            MenuView(show: $show)
        }
        .background(Color("background").ignoresSafeArea())
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    
    func debug() -> Self {
        print(Mirror(reflecting: self).subjectType)
        return self
    }
}

struct MenuRow: View {
    var image = "creditcard"
    var text = "My Account"
    
    @State var settings = false
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(text)
                .foregroundColor(.primary)
                .font(.headline)
            Spacer()
        }
        .onTapGesture {
            if text == "Settings" {
                settings.toggle()
            }
        }
        .sheet(isPresented: $settings) {
            Settings()
        }
    }
}

struct Menu: Identifiable {
    let id = UUID()
    let icon: String
    var title: String
}

let menuData = [
    Menu(icon: "person.crop.circle", title: "My Account"),
    Menu(icon: "gear", title: "Settings"),
    Menu(icon: "creditcard", title: "Billing"),
    Menu(icon: "person.and.person", title: "Team"),
    Menu(icon: "arrow.uturn.down", title: "Sign out")
]


struct MenuView: View {
    
    var menus = menuData
    
    @Binding var show: Bool
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 20.0) {
                ForEach(menus) { item in
                    MenuRow(image: item.icon, text: item.title)
                }
                Spacer()
            }
            .padding(30)
            .padding(.top, 20)
            .frame(minWidth: 0, maxWidth: 360)
            .background(Color("button"))
            .cornerRadius(30)
            .padding(.trailing, 60)
            .shadow(radius: 20)
            .rotation3DEffect(
                Angle(degrees: show ? 0 : 60),
                axis: (x: 0.0, y: 10.0, z: 0.0)
            )
            .animation(.default)
            .offset(x: show ? 0 : -UIScreen.main.bounds.width)
            .onTapGesture {
                show.toggle()
            }
            Spacer()
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CircleButton: View {
    var icon = "person.crop.circle"
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundColor(.primary)
        }
        .frame(width: 44, height: 44)
        .background(Color("button"))
        .cornerRadius(30)
        .shadow(color: Color("buttonShadow"), radius: 10, x: 0.0, y: 20)
    }
}

struct MenuButton: View {
    @Binding var show: Bool
    
    var body: some View {
        
        ZStack {
            Button(action: { show.toggle() } ) {
                HStack {
                    Spacer()
                    Image(systemName: "list.dash")
                        .foregroundColor(.primary)
                }
                .padding(.trailing, 20)
                .frame(width: 90, height: 60)
                .background(Color("button"))
                .cornerRadius(30)
                .shadow(color: Color("buttonShadow"), radius: 10, x: 0.0, y: 20)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topLeading)
    }
}

struct MenuRight: View {
    @Binding var show: Bool
    
    @State private var isPresented = false
    
    var body: some View {
        ZStack() {
            HStack {
                Button(action: { show.toggle() } ) {
                    CircleButton(icon: "person.crop.circle")
                }
                
                Button(action: { isPresented.toggle() } ) {
                    CircleButton(icon: "bell")
                }
                .sheet(isPresented: $isPresented) {
                    UpdateList()
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .topTrailing)
    }
}
