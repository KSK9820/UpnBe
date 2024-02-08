//
//  ReportShortfallView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/08.
//

import SwiftUI

struct ReportShortfallView: View {
    var body: some View {
        ZStack {
            Color.background1.ignoresSafeArea()
            VStack {
                Spacer()
                Text("나의 풋살 레벨은?")
                    .font(.heading1)
                    .foregroundStyle(.color1)
                    .verticalPadding(direction: .bottom, size: 16)
                
                Text("앞으로 {#평가수 20개 - 누적평가수}개의\n드릴 평가를 하면 레벨 확인이 가능해요")
                    .font(.heading4)
                    .foregroundStyle(.basic)
                    .lineLimit(2)
                    .verticalPadding(direction: .bottom, size: 13)
                
                Image(.futsalLevel)
                    .resizable()
                    .scaledToFit()
                    .frameForUPNBE(width: 380, height: 380)
                Spacer()
                Text("드릴 평가하러 가기")
                    .applyMintButtonModifier(width: 320, height: 50)
                    .verticalPadding(direction: .bottom, size: 45)
            }
        }
    }
}

#Preview {
    ReportShortfallView()
}
