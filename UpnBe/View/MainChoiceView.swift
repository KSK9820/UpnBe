//
//  MainChoiceView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/05.
//

import SwiftUI

final class MainChoiceViewModel: ObservableObject {
    @Published var selected = [false, false, false, false]
    
    func selectedButton(sport: Int) {
        selected = [false, false, false, false]
        selected[sport] = true
    }
    
    func selectedSport() -> String {
        guard let index = selected.firstIndex(of: true) else { return "" }
        let sportName = ["축구", "농구", "배구", "수영"]
        return sportName[index]
    }
}

struct MainChoiceView: View {
    @ObservedObject var viewModel = MainChoiceViewModel()
    @State var isActive = false
    @State var isSheetActive = false
    
    let buttons = ["Futsal", "Basket", "volei", "swim"]
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
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
                    
                    LazyVGrid(columns: columns) {
                        ForEach(buttons.indices, id: \.self) { index in
                            Button(action: {
                                viewModel.selectedButton(sport: index)
                                print(viewModel.selected)
                                if buttons[index] == "Futsal" {
                                    isActive = true
                                    isSheetActive = false
                                } else {
                                    isActive = false
                                    isSheetActive = true
                                }
                            }) {
                                Image(buttons[index])
                                    .resizable()
                                    .scaledToFit()
                                    .frameForUPNBE(width: 164, height: 100)
                            }
                            .sheet(isPresented: $isSheetActive, content: {
                                MainNumberView(sportName: viewModel.selectedSport())
                                    .presentationDetents([.fraction(37/74)])
                                    .presentationDragIndicator(.visible)
                            })
                        }
                    }
                    .verticalPadding(direction: .horizontal, size: 10)
                    
                    Spacer()
                    
                    if isActive {
                        NavigationLink(destination: MainReadyView()) {
                            Text("다음")
                                .applyChangableButtonModifier(width: 320, height: 50, isActive: $isActive)
                                .horizontalPadding(direction: .horizontal, size: 20)
                                .verticalPadding(direction: .bottom, size: 30)
                        }
                    } else {
                        Text("다음")
                            .font(.heading2)
                            .applyDisableButtonModifier(width: 320, height: 50)
                            .horizontalPadding(direction: .horizontal, size: 20)
                            .verticalPadding(direction: .bottom, size: 30)
                    }
                }
            }.ignoresSafeArea()
        }
    }
}

#Preview {
    MainChoiceView()
}



