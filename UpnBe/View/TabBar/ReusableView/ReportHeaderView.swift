//
//  ReportHeaderView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/07.
//

import SwiftUI

struct ReportHeaderView: View {
    let userInfo: UserInformation
    
    init() {
        self.userInfo = UserInformation(nickName: "민첩한곰돌이", level: 12, division: "Rookie", agency: "지구대학교")
    }
    
    var body: some View {
        HStack(spacing: 30) {
            Image(.profile)
                .resizable()
                .frameForUPNBE(width: 80, height: 80)
                .background {
                    Circle()
                        .fill(.background1)
                        .frameForUPNBE(width: 90, height: 90)
                }
                .horizontalPadding(direction: .leading, size: 30)
            
            VStack(alignment: .leading) {
                Text(userInfo.nickName)
                    .font(.heading2)
                    .foregroundStyle(.background1)
                    .verticalPadding(direction: .bottom, size: 11)
                
                HStack {
                    VStack(alignment: .leading) {
                        Text("레벨")
                        Text("디비전")
                        Text("소속")
                    }
                    .font(.heading3)
                    .foregroundStyle(.background1)
                    .horizontalPadding(direction: .trailing, size: 10)
                    
                    VStack(alignment: .leading) {
                        Text("\(userInfo.level)")
                        Text("\(userInfo.division)")
                        Text("\(userInfo.agency)")
                    }
                    .font(.heading3)
                    .foregroundStyle(.background1)
                }
            }
            Spacer()
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
    ReportHeaderView()
}


