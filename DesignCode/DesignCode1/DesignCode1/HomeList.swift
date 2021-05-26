//
//  HomeList.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/22.
//

import SwiftUI

struct HomeList: View {
    
    var courses = courseData
    
    @State var isPresented = false
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            VStack {
                HStack {
                    VStack(alignment: .leading) {
                        Text("Courses")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                        Text("22 courses")
                            .foregroundColor(.gray)
                    }
                    Spacer()
                }
                .padding(.leading, 70)
                .padding(.bottom, 40)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 30.0) {
                        ForEach(courses) { item in
                            GeometryReader { geometry in
                                CourseView(
                                    title: item.title,
                                    image: item.image,
                                    color: item.color,
                                    shadowColor: item.shadowColor
                                )
                                .rotation3DEffect(
                                    Angle(degrees: Double(geometry.frame(in: .global).minX - 40) / -40
                                ),
                                axis: (x: 0.0, y: 10.0, z: 0.0)
                                )
                                .onTapGesture { isPresented.toggle() }
                                .sheet(isPresented: $isPresented) {
                                    ContentView()
                                }
                            }
                            .frame(width: 246, height: 360)
                        }
                    }
                    .padding(.leading, 40)
                    .padding(.top, 30)
                    .padding(.bottom, 70)
                    
                    Spacer()
                }
                
                CertificateRow()
            }
            .padding(.top, 58.0)
        }
    }
}

struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

struct CourseView: View {
    
    var title: String = "Build an app with SwiftUI"
    var image: String = "Illustration1"
    var color: Color = Color("background3")
    var shadowColor: Color = Color("backgroundShadow3")
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .padding(30)
                .lineLimit(4)
                .padding(.trailing, 50)
            
            Spacer()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(maxWidth: .infinity)
                .frame(height: 150)
                .padding(.bottom, 30)
        }
        .background(color)
        .cornerRadius(30)
        .frame(width: 246, height: 360)
        .shadow(color: shadowColor, radius: 20, x: 0, y: 20)
    }
}

struct Course: Identifiable {
    let id = UUID()
    let title: String
    let image: String
    let color: Color
    let shadowColor: Color
}

let courseData = [
    Course(title: "Build an app with SwiftUI",
           image: "Illustration1",
           color: Color("background3"),
           shadowColor: Color("backgroundShadow3")),
    Course(title: "Design and animate your UI",
           image: "Illustration2",
           color: Color("background4"),
           shadowColor: Color("backgroundShadow4")),
    Course(title: "Swift UI Advanced",
           image: "Illustration3",
           color: Color("background7"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Framer Playground",
           image: "Illustration4",
           color: Color("background8"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
    Course(title: "Flutter for Designers",
           image: "Illustration5",
           color: Color("background9"),
           shadowColor: Color(hue: 0.677, saturation: 0.701, brightness: 0.788, opacity: 0.5)),
]
