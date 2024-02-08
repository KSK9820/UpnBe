//
//  ReportLoginView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/08.
//

import SwiftUI

struct ReportLoginView: View {
    var body: some View {
        ZStack {
            Color.background1.ignoresSafeArea()
            VStack {
                Spacer()
                Text("나의 풋살 레벨은?")
                    .font(.heading1)
                    .foregroundStyle(.color1)
                    .verticalPadding(direction: .bottom, size: 16)
                
                Text("로그인을 하면 레벨을 확인할 수 있어요")
                    .font(.heading4)
                    .foregroundStyle(.basic)
                    .verticalPadding(direction: .bottom, size: 13)
                
                Image(.futsalLevel)
                    .resizable()
                    .scaledToFit()
                    .frameForUPNBE(width: 380, height: 380)
                Spacer()
                Text("로그인하기")
                    .applyMintButtonModifier(width: 320, height: 50)
                    .verticalPadding(direction: .bottom, size: 45)
            }
        }
    }
}

#Preview {
    ReportLoginView()
}
