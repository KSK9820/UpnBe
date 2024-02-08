//
//  ProfileJoinView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/08.
//

import SwiftUI

struct ProfileJoinView: View {
    var body: some View {
        
        ZStack {
            Color.background1
                .ignoresSafeArea()
            VStack {
                ProfileHeaderView(ProfileHeaderViewModel(userInfo: nil))
                
                Spacer()
                
                Text("로그인 후 자유롭게 서비스를 이용해보세요")
                    .font(.heading4)
                    .foregroundStyle(.white)
                    .verticalPadding(direction: .bottom, size: 27)
                
                Image(.futsalLevel)
                    .resizable()
                    .scaledToFit()
                    .frameForUPNBE(width: 200, height: 200)
                
                Spacer()
                
                Text("로그인하기")
                    .applyMintButtonModifier(width: 320, height: 50)
                    .verticalPadding(direction: .bottom, size: 45)
            }
        }
    }
}

#Preview {
    ProfileJoinView()
}
