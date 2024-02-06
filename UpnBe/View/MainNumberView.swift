//
//  MainNumberView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/05.
//

import SwiftUI

struct MainNumberView: View {
    @State private var text = String()
    var sportName: String
    
    init(sportName: String) {
        self.sportName = sportName
    }
    
    var body: some View {
        ZStack(alignment: .top) {
            Color.black.ignoresSafeArea()
            
            VStack() {
                Spacer()
                Text("\(sportName)도 빠르게 준비중이에요.\n\(sportName) 출시 알림을 받고싶다면\n연락처를 남겨주세요.")
                    .lineLimit(3)
                    .multilineTextAlignment(.center)
                    .font(.heading4)
                    .foregroundStyle(.white)
                    
                    .verticalPadding(direction: .bottom, size: 59)
                
                TextField("", text: $text, prompt: Text("휴대폰번호").foregroundColor(.basic))
                    .applyTextFieldModifier(width: 310, height: 54)
                    .multilineTextAlignment(.center)
                    .lineLimit(1)
                    .verticalPadding(direction: .bottom, size: 50)
                
                HStack {
                    Text("종목출시만 요청")
                        .applyGrayButtonModifier(width: 150, height: 50)
                    Spacer()
                        .frameForUPNBE(width: 10, height: 0)
                    Text("미리알림받기")
                        .applyMintButtonModifier(width: 150, height: 50)
                }
                
                
            }
            
              
        }
    }
}

#Preview {
    MainNumberView(sportName: "축구")
}

