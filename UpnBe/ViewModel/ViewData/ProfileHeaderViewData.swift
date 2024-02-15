//
//  ProfileHeaderViewData.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/15.
//

final class ProfileHeaderViewData {
    var userInfo: ProfileUserInformation?
    
    var partyAndTraining: String? {
        guard let party = userInfo?.party else { return nil }
        guard let training = userInfo?.training else { return nil }
        return "\(party) | \(training)"
    }
    
    init(userInfo: ProfileUserInformation? = nil) {
        self.userInfo = userInfo
    }
}
