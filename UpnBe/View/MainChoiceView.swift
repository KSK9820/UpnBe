//
//  MainChoiceView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/05.
//

import SwiftUI

final class MainChoiceViewModel: ObservableObject {
    @Published var selected = [false, false, false, false]
    
    func selectedButton(sport: Int){
        selected = [false, false, false, false]
        selected[sport] = true
    }
}

struct MainChoiceView: View {
    @ObservedObject var viewModel = MainChoiceViewModel()
    @State var isActive = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background
                VStack {
                    Spacer()
                        .frameForUPNBE(width: 0, height: 117)
                    
                    Text("어떤 종목을 함께 할까요?")
                        .font(.heading1)
                        .foregroundStyle(.color1)
                    
                    Spacer()
                        .frameForUPNBE(width: 0, height: 80)
                    
                    VStack(alignment: .center) {
                        HStack {
                            Button(action: {
                                viewModel.selectedButton(sport: 0)
                                isActive = true
                            }, label: {
                                Image(.futsal)
                                    .frameForUPNBE(width: 164, height: 100)
                            })
                            
                            Button(action: {
                                viewModel.selectedButton(sport: 1)
                                isActive = false
                            }, label: {
                                Image(.basket)
                                    .frameForUPNBE(width: 164, height: 100)
                            })
                        }
                        
                        HStack {
                            Button(action: {
                                viewModel.selectedButton(sport: 2)
                                isActive = false
                            }, label: {
                                Image(.volei)
                                    .frameForUPNBE(width: 164, height: 100)
                            })
                            
                            Button(action: {
                                viewModel.selectedButton(sport: 3)
                                isActive = false
                            }, label: {
                                Image(.swim)
                                    .frameForUPNBE(width: 164, height: 100)
                            })
                        }
                        .horizontalPadding(direction: .horizontal, size: 10)
                    }
                    
                    Spacer()
                  
                    Button {
                    
                    } label: {
                        if isActive {
                            NavigationLink(destination: MainReadyView()) {
                                Text("다음")
                                    .ApplyGrayButtonModifier(width: 320, height: 50, isActive: $isActive)
                            }
                        } else {
                            Text("다음")
                                .font(.heading2)
                                .ApplyGrayButtonModifier(width: 320, height: 50, isActive: nil)
                        }
                    }
                    .horizontalPadding(direction: .horizontal, size: 20)
                    .verticalPadding(direction: .bottom, size: 30)
                }
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    MainChoiceView()
}



