//
//  RingView.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/26.
//

import SwiftUI

struct RingView: View {
    var color1: Color = Color(#colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1))
    var color2: Color = Color(#colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1))
    var width: CGFloat = 88
    var height: CGFloat = 88
    var percent: CGFloat = 80
    
    @Binding var show: Bool
    
    private var multiplier: CGFloat { width / 44 }
    private var progress: CGFloat { percent / 100 }
    
    var body: some View {
        
        ZStack {
            Circle()
                .stroke(Color.black.opacity(0.1), style: StrokeStyle(lineWidth: 5 * multiplier))
                .frame(width: width, height: height)
            Circle()
                .trim(from: show ? 1 - progress : 1, to: 1)
//                .rotation(Angle(degrees: 90))
                .stroke(LinearGradient(gradient: Gradient(colors: [color1, color2]), startPoint: .topTrailing, endPoint: .bottomLeading),
                    style: StrokeStyle(lineWidth: 5 * multiplier, lineCap: .round, lineJoin: .round, miterLimit: .infinity, dash: [20, 0], dashPhase: 0))
                .rotationEffect(Angle(degrees: 90))
                .rotation3DEffect(Angle(degrees: 180), axis: (x: 1, y: 0, z: 0.0))
                .frame(width: width, height: height)
                .shadow(color: color2.opacity(0.1), radius: 3 * multiplier, x: 0, y: 3 * multiplier)
                .animation(.easeOut)
            
            Text("\(Int(percent))%")
                .font(.system(size: 14 * multiplier))
                .fontWeight(.bold)
        }
    }
}

struct RingView_Previews: PreviewProvider {
    static var previews: some View {
        RingView(show: .constant(true))
    }
}
