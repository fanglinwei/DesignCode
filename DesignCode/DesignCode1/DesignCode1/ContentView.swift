//
//  ContentView.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/20.
//

import SwiftUI

struct ContentView: View {
    
    @State var show = false
    
    @State var viewState = CGSize.zero
    
    var body: some View {
        ZStack {
            BlurView(style: .systemMaterial)
            
            TitleView()
                .blur(radius: show ? 20 : 0)
                .animation(.default)
            
            CardView()
                .background(show ? Color("background4") : Color("background9"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -400 : -40)
                .scaleEffect(0.85)
                .rotationEffect(Angle(degrees: show ? 15 : 0))
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
                .animation(.easeInOut(duration: 0.6))
            
            CardView()
                .background(show ? Color("background5") : Color("background8"))
                .cornerRadius(10)
                .shadow(radius: 20)
                .offset(x: 0, y: show ? -200 : -20)
                .scaleEffect(0.9)
                .rotationEffect(Angle(degrees: show ? 10 : 0))
                .blendMode(.hardLight)
                .offset(x: viewState.width, y: viewState.height)
                .animation(.easeInOut(duration: 0.4))
            
            CertificateView()
                .offset(x: viewState.width, y: viewState.height)
                .scaleEffect(0.95)
                .rotationEffect(Angle(degrees: show ? 5 : 0))
                .animation(.spring())
                .onTapGesture {
                    show.toggle()
                }
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            viewState = value.translation
                            show = true
                            
                        }.onEnded { value in
                            viewState = .zero
                            show = false
                        }
                )
            
            CardBottomView(show: $show)
                .blur(radius: show ? 20 : 0)
                .animation(.timingCurve(0.2, 0.8, 0.2, 1, duration: 0.8))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct CardView: View {
    
    var body: some View {
        VStack {
            Text("Card back")
        }.frame(width: 340, height: 220)
    }
}

struct CertificateView: View {
    
    var item = Certificate(title: "UI Design", image: "Background", width: 340, height: 220)
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text(item.title)
                        .font(.headline)
                        .fontWeight(.bold)
                        .foregroundColor(Color("accent"))
                        .padding(.top)
                    Text("Certificate")
                        .foregroundColor(Color.white)

                }
                Spacer()
                Image("Logo")
                    .resizable()
                    .frame(width: 30.0, height: 30.0)
            }
            .padding(.horizontal)
            Spacer()
            Image(item.image)
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                .offset(y: 70)
        }
        .frame(width: item.width, height: item.height)
        .background(Color.black)
        .cornerRadius(10)
        .shadow(radius: 10)
    }
}

struct TitleView: View {
    var body: some View {
        VStack {
            HStack {
                Text("Certificates")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                Spacer()
            }
            Image("Illustration5")
            Spacer()
        }.padding()
    }
}

struct CardBottomView: View {
    @Binding var show: Bool
    
    var body: some View {
        VStack(spacing: 30.0) {
            Rectangle()
                .frame(width: 60, height: 6)
                .cornerRadius(3)
                .opacity(0.1)
            
            Text("This certificate is proof that Meng To has achieved the UI Design course with approval from a Design+Code instructor.")
            
            Spacer()
        }
        .padding()
        .padding(.horizontal)
        .frame(maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: screen.height - (show ? 370 : 170))
    }
}
