//
//  saveTabStatus.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/15.
//

enum saveTabStatus: Int, CaseIterable {
    case possible = 0
    case be = 1
    case saved = 2
    
    var name: String {
        switch self {
        case .possible:
            "가능"
        case .be:
            "언젠간"
        case .saved:
            "저장"
        }
    }
}
