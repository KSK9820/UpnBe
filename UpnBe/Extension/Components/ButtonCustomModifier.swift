//
//  ButtonCustomModifier.swift
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

struct FilterButtonModifier: ViewModifier {
    var isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.heading4)
            .foregroundStyle(isActive ? .background1 : .background5)
            .frameForUPNBE(width: 100, height: 30)
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .foregroundStyle(isActive ? .color2 : .background2)
            }
    }
}

struct ProfileListButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        VStack(spacing: 10) {
            HStack {
                content
                    .font(.paragraph2)
                    .foregroundStyle(.background5)
                Spacer()
                Image(systemName: "chevron.right")
                
                    .foregroundStyle(.basic)
                
            }
            Rectangle()
                .fill(.background3)
                .frame(height: 1)
        }
    }
}

struct TabbarButtonModifier: ViewModifier {
    var isActive: Bool
    
    func body(content: Content) -> some View {
        VStack {
            content
                .font(.heading4)
                .foregroundStyle(.basic)
                .background {
                    if isActive {
                        Rectangle()
                            .fill(.basic)
                            .frameForUPNBE(width: 40, height: 3)       
                            .verticalPadding(direction: .top, size: 32)
                    }
                }
        }
    }
}

