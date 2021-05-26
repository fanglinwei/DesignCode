//
//  BlurView.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/22.
//

import SwiftUI

struct BlurView: UIViewRepresentable {
    
    typealias UIViewType = UIView
    
    typealias Context = UIViewRepresentableContext<BlurView>
    
    
    let style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIViewType {
        let view = UIView(frame: .zero)
        view.backgroundColor = .clear
        let effect = UIBlurEffect(style: style)
        let blurView = UIVisualEffectView(effect: effect)
        blurView.translatesAutoresizingMaskIntoConstraints = false
        view.insertSubview(blurView, at: 0)
        blurView.widthAnchor.constraint(equalTo: view.widthAnchor).isActive = true
        blurView.heightAnchor.constraint(equalTo: view.heightAnchor).isActive = true
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct BlurView_Previews: PreviewProvider {
    static var previews: some View {
        BlurView(style: .light)
    }
}
