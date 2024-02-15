//
//  ProfileBasicView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/08.
//

import SwiftUI

struct ProfileBasicView: View {
    let viewModel: ProfileHeaderViewModel
    
    init() {
        self.viewModel = ProfileHeaderViewModel(userInfo: ProfileUserInformation(nickName: "민첩한곰돌이", period: "12개월", party: "혼자서", training: "기술훈련"))
    }
    
    var body: some View {
        ZStack {
            Color.background1
                .ignoresSafeArea()
            VStack {
                ProfileHeaderView(ProfileHeaderViewModel(userInfo: viewModel.userInfo))
                configureList()
                    .verticalPadding(direction: .top, size: 20)
                Spacer()
            }
        }
    }
}

extension ProfileBasicView {
    @ViewBuilder
    func configureList() -> some View {
        let contents: [String] = ["숏츠 영상 등록하기", "카카오톡 문의하기", "자주 묻는 질문", "공지사항"]
        VStack(alignment: .leading, spacing: 20) {
            ForEach(contents, id: \.self) { content in
                Text(content)
                    .applyProfileListButtonModifier()
                    .horizontalPadding(direction: .horizontal, size: 20)
                    
            }
        }
    }
}

#Preview {
    ProfileBasicView()
}
