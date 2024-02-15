//
//  ReportBasicViewData.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/15.
//

import Foundation

final class ReportBasicViewData {
    let drillLevelName: [String] = ["마스터링", "슈팅", "패스", "드리볼"]
    let drillLevel = [22,18,9,11]
    let drillMaxLevel = [64, 18, 13, 35]
    
    func percentageOfDrillUp(index: Int) -> CGFloat {
        CGFloat(drillLevel[index] * 35 / 8)
    }
}
