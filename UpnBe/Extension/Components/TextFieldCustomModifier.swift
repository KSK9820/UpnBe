//
//  TextFieldCustomModifier.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/06.
//

import SwiftUI

struct TextFieldModifier: ViewModifier {
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.heading2)
            .foregroundStyle(.basic)
            .frameForUPNBE(width: width, height: height)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.background2)
            }
            .overlay {
                RoundedRectangle(cornerRadius: 20)
                    .stroke(.background4, lineWidth: 1)
                    .frameForUPNBE(width: width, height: height)
            }
    }
}
