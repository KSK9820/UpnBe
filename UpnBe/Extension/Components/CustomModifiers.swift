//
//  GrayButtonModifier.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/05.
//

import SwiftUI

struct DisableButtonModifier: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.heading2)
            .foregroundStyle(.black)
            .frameForUPNBE(width: width, height: height)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.background2)
            }
    }
}

struct GrayButtonModifier: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.heading2)
            .foregroundStyle(.background5)
            .frameForUPNBE(width: width, height: height)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.background2)
            }
    }
}

struct MintButtonModifier: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.heading2)
            .foregroundStyle(.black)
            .frameForUPNBE(width: width, height: height)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(.color1)
            }
    }
}

struct ChangableButtonModifier: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    var isActive: Bool?
    
    func body(content: Content) -> some View {
        content
            .font(.heading2)
            .foregroundStyle(isActive ?? false ? .black : .background5)
            .frameForUPNBE(width: width, height: height)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(isActive ?? false ? .color1 : .background2)
            }
    }
}

struct TextFieldModifier: ViewModifier {
    
    var width: CGFloat
    var height: CGFloat
    
    func body(content: Content) -> some View {
        content
            .font(.heading2)
            .foregroundStyle(.basic)
            .frameForUPNBE(width: width, height: height)
            .background{
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
