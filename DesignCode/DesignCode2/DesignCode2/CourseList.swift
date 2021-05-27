//
//  CourseList.swift
//  DesignCode2
//
//  Created by 方林威 on 2021/5/27.
//

import SwiftUI

struct CourseList: View {
    var body: some View {
        VStack {
            CourseView()
        }
        
    }
}

struct CourseList_Previews: PreviewProvider {
    static var previews: some View {
        CourseList()
    }
}

struct CourseView: View {
    
    @State var show = false
    
    var body: some View {
        ZStack {
            Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
                .frame(maxWidth: show ? .infinity : screen.width - CGFloat(60), maxHeight: show ? .infinity : CGFloat(280))
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .ignoresSafeArea()
            
            VStack {
                HStack(alignment: .top) {
                    VStack(alignment: .leading, spacing: 8.0) {
                        Text("SwiftUI Advanced")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                        Text("20 Sections")
                            .foregroundColor(.white.opacity(0.7))
                    }
                    Spacer()
                    Image("Logo1")
                }
                Spacer()
                Image("Card2")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(maxWidth: .infinity)
                    .frame(height: 140, alignment: .top)
            }
            .padding(20)
            .frame(maxWidth: show ? .infinity : screen.width - CGFloat(60), maxHeight: show ? .infinity : CGFloat(280))
            .background(Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)))
            .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
            .shadow(color: Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1)).opacity(0.3), radius: 20, x: 0, y: 20)
            .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
            .onTapGesture {
                show.toggle()
        }
        }
    }
}
