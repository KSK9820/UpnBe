//
//  RoundedCorner.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/07.
//

import SwiftUI

// MARK: - 개별적인 corner의 radius를 설정

struct RoundedCorner: Shape {
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}
