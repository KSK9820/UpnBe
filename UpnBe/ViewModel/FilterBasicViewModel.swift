//
//  FilterBasicViewModel.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/15.
//

import Foundation

final class FilterBasicViewModel: ObservableObject {
    @Published var filterStatus: [Filter: [Bool]] = [
        .division: [false, false, false, false, false],
        .drill: [false, false, false, false, false],
        .location: [false, false, false, false],
        .party: [false, false, false]
    ]
    
    func changeStatus(classify: Filter, index: Int) {
        filterStatus[classify] = filterStatus[classify]?.map { _ in false }
        filterStatus[classify]?[index] = true
    }
}
