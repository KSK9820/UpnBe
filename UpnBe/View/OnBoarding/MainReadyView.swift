//
//  MainReadyView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/05.
//

import SwiftUI

struct MainReadyView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background1
                VStack {
                    Spacer()
                        .frameForUPNBE(width: 0, height: 117)
                    
                    Text("나의 풋살 레벨은?")
                        .font(.heading1)
                        .foregroundStyle(.color1)
                        .verticalPadding(direction: .bottom, size: 16)
                    Text("내 레벨을 알기까지 걸리는 시간은 단 2분\n단 20개의 영상을 보고 선택만 하세요!")
                        .font(.heading5)
                        .foregroundStyle(.background5)
                        .multilineTextAlignment(.center)
                        .verticalPadding(direction: .bottom, size: 109)
                    
                    VStack(alignment: .leading) {
                        configureIcon(image: .iconUpOn, text: "동작을 잘 따라할 수 있다면?")
                        configureIcon(image: .iconBe, text: "연습이 조금 더 필요하다면?")
                        configureIcon(image: .iconSave, text: "계속 저장하고 보고 싶을땐?")
                    }
                    
                    Spacer()
                    
                    NavigationLink(destination: MainReadyView()) {
                        Text("시작하기")
                            .applyMintButtonModifier(width: 320, height: 50)
                    }
                    .horizontalPadding(direction: .horizontal, size: 20)
                    .verticalPadding(direction: .bottom, size: 30)
                }
            }
            .ignoresSafeArea()
        }
        .navigationBarBackButtonHidden()
    }
}

extension MainReadyView {
    @ViewBuilder
    private func configureIcon(image: ImageResource, text: String) -> some View {
        HStack {
            Image(image)
                .resizable()
                .frameForUPNBE(width: 40, height: 40)
            Spacer()
                .frameForUPNBE(width: 19, height: 0)
            Text(text)
                .font(.heading5)
                .foregroundStyle(.background5)
        }
        .verticalPadding(direction: .bottom, size: 40)
    }
}


#Preview {
    MainReadyView()
}
