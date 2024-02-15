//
//  ButtonType.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/15.
//

enum ButtonType: String {
    case possible = "가능"
    case whenever = "언젠간"
    case save = "저장"
    
    var image: String {
        switch self {
        case .possible:
            "icon-up-on"
        case .whenever:
            "icon-be"
        case .save:
            "icon-save"
        }
    }
}
