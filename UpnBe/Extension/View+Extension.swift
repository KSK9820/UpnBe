//
//  View+Extension.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/05.
//

import SwiftUI

// MARK: - CustomButton

extension View {
    
    func applyDisableButtonModifier(width: CGFloat, height: CGFloat) -> some View {
        return modifier(DisableButtonModifier(width: width, height: height))
    }
    
    func applyGrayButtonModifier(width: CGFloat, height: CGFloat) -> some View {
        return modifier(GrayButtonModifier(width: width, height: height))
    }
    
    func applyMintButtonModifier(width: CGFloat, height: CGFloat) -> some View {
        return modifier(MintButtonModifier(width: width, height: height))
    }
    
    func applyChangableButtonModifier(width: CGFloat, height: CGFloat, isActive: Binding<Bool>?) -> some View {
        return modifier(ChangableButtonModifier(width: width, height: height, isActive: isActive?.wrappedValue))
    }
    
    func applyTextFieldModifier(width: CGFloat, height: CGFloat) -> some View {
        return modifier(TextFieldModifier(width: width, height: height))
    }
    
    func applyFilterButtonModifier(isActive: Binding<Bool>) -> some View {
        return modifier(FilterButtonModifier(isActive: isActive.wrappedValue))
    }
    
    func cornerRadius(_ radius: CGFloat, corners: [UIRectCorner]) -> some View {
        let combinedCorners = corners.reduce(into: UIRectCorner()) { result, corner in
            result.formUnion(corner)
        }
        return clipShape(RoundedCorner(radius: radius, corners: combinedCorners))
    }
    
    func applyProfileListButtonModifier() -> some View {
        return modifier(ProfileListButtonModifier())
    }
    
    func applyTabbarButtonModifier(isActive: Binding<Bool>) -> some View {
        return modifier(TabbarButtonModifier(isActive: isActive.wrappedValue))
    }
}

// MARK: - device에 따른 frame 크기 변환

extension View {
    static var scene: UIWindowScene { UIApplication.shared.connectedScenes.first as! UIWindowScene }
    
    func frameForUPNBE(width: CGFloat, height: CGFloat, alignment: Alignment = .center) -> some View {
        let width = widthForUPNBE(width: width, screenWidth: Self.scene.screen.bounds.width)
        let height = heightForUPNBE(height: height, screenHeight: Self.scene.screen.bounds.height)
        return self.frame(width: width, height: height, alignment: alignment)
    }
    
    private func widthForUPNBE(width: CGFloat, screenWidth: CGFloat) -> CGFloat {
        let temp = width / 360 * screenWidth
        return temp > screenWidth ? screenWidth : temp
    }
    
    private func heightForUPNBE(height: CGFloat, screenHeight: CGFloat) -> CGFloat {
        let temp = height / 740 * screenHeight
        return temp > screenHeight ? screenHeight : temp
    }
    
    func verticalPadding(direction: Edge.Set, size: CGFloat) -> some View {
        return self.padding(direction, size / 740 * Self.scene.screen.bounds.height)
    }
    
    func horizontalPadding(direction: Edge.Set, size: CGFloat) -> some View {
        return self.padding(direction, size / 360 * Self.scene.screen.bounds.width)
    }
}
