//
//  GrayButtonModifier.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/05.
//

import SwiftUI

struct GrayButtonModifier: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    var isActive: Bool?
    
    func body(content: Content) -> some View {
        ZStack {
            RoundedRectangle(cornerRadius: 20)
                .frameForUPNBE(width: width, height: height)
                .tint(isActive ?? false ? .color1 : .background2)
            content
                .font(.heading2)
                .foregroundStyle(isActive ?? false ? .black : .background5)
        }
    }
}
