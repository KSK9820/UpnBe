//
//  ProfileHeaderView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/08.
//

import SwiftUI

struct ProfileHeaderView: View {
    private let headerViewData: ProfileHeaderViewData
    
    init(_ viewModel: ProfileHeaderViewData) {
        self.headerViewData = viewModel
    }
    
    var body: some View {
        HStack() {
            HStack(spacing: 35) {
                Image(.profile)
                    .resizable()
                    .frameForUPNBE(width: 80, height: 80)
                    .background {
                        Circle()
                            .fill(.background1)
                            .frameForUPNBE(width: 90, height: 90)
                    }
                
                VStack(alignment: .leading, spacing: 5) {
                    Text(headerViewData.userInfo?.nickName ?? "반가워요 여행자님")
                    Text(headerViewData.userInfo?.period ?? "")
                    Text(headerViewData.partyAndTraining ?? "")
                }
                .font(.heading2)
                .foregroundStyle(.background1)
            }
            .horizontalPadding(direction: .leading, size: 30)
            
            Spacer()
            
            VStack(spacing: 77) {
                Image(.iconSetting)
                    .renderingMode(.template)
                    .foregroundStyle(.black)
                    .frameForUPNBE(width: 25, height: 25)
                
                Button {
                } label: {
                    if headerViewData.userInfo != nil {
                        Text("수정")
                            .underline()
                            .font(.heading5)
                            .foregroundStyle(.background1)
                    }
                }
            }
            .horizontalPadding(direction: .trailing, size: 10)
        }
        .frameForUPNBE(width: 360, height: 160)
        .background {
            Rectangle()
                .fill(.color1)
                .cornerRadius(30, corners: [.topLeft, .topRight])
        }
    }
}

#Preview {
//    ProfileHeaderView(ProfileHeaderViewData(userInfo: ProfileUserInformation(nickName: "민첩한곰돌이", period: "12개월", party: "혼자서", training: "기술훈련")))
    ProfileHeaderView(ProfileHeaderViewData(userInfo: nil))
}
