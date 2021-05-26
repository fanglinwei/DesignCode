//
//  UpdateDetail.swift
//  DesignCode
//
//  Created by 方林威 on 2021/5/24.
//

import SwiftUI

struct UpdateDetail: View {

    var update: Update = updateData[1]
    
    var body: some View {
        VStack(spacing: 20.0) {
            Text(update.title)
                .font(.largeTitle)
                .fontWeight(.bold)
            
            Image(update.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 200)
            
            Text(update.text)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.leading)
            
            Spacer()
        }
        .padding(30)
    }
}

struct UpdateDetail_Previews: PreviewProvider {
    static var previews: some View {
        UpdateDetail()
    }
}
