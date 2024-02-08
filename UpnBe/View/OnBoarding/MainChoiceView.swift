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
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.background1.ignoresSafeArea()
                VStack {
                    Spacer()
                    Text("어떤 종목을 함께 할까요?")
                        .font(.heading1)
                        .foregroundStyle(.color1)
                        .verticalPadding(direction: .bottom, size: 96)
                    
                    configureButtons()
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
            }
        }
    }
}

extension MainChoiceView {
    
    @ViewBuilder
    func configureButtons() -> some View {
        let buttons = ["Futsal", "Basket", "volei", "swim"]
        let columns = [GridItem(.flexible()), GridItem(.flexible())]
        
        LazyVGrid(columns: columns) {
            ForEach(buttons.indices, id: \.self) { index in
                Button(action: {
                    viewModel.selectedButton(sport: index)
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
        .horizontalPadding(direction: .horizontal, size: 10)
    }
    
    @ViewBuilder
    func navigationLink() -> some View {
        NavigationLink(destination: MainReadyView()) {
            Text("다음")
                .applyChangableButtonModifier(width: 320, height: 50, isActive: $isActive)
                .horizontalPadding(direction: .horizontal, size: 20)
                .verticalPadding(direction: .bottom, size: 30)
        }
    }
}

#Preview {
    MainChoiceView()
}
