//
//  FilterBasicView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/06.
//

import SwiftUI

enum Filter: Int {
    case division = 0
    case drill = 1
    case location = 2
    case party = 3
}

final class FilterBasicViewModel: ObservableObject {
    @Published var filterStatus: [Filter: [Bool]] = [
            .division: [false, false, false, false, false],
            .drill: [false, false, false, false, false],
            .location: [false, false, false, false],
            .party: [false, false, false]
        ]
    
    func changeStatus(classify: Filter, index: Int) {
            filterStatus[classify] = filterStatus[classify]?.map { _ in false }
            filterStatus[classify]?[index] = true
        }
}

struct FilterBasicView: View {
    @ObservedObject var viewModel = FilterBasicViewModel()
    
    let columns = [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())]
    let filterContent: [Filter: [String]] = [
        .division: ["뉴비", "루키", "아마추어", "올스타", "세미프로"],
        .drill: ["볼마스터리", "드리블", "슈팅", "패스", "트레이닝"],
        .location: ["집", "미니풋살장", "공터", "정규풋살장"],
        .party: ["혼자서", "둘이서", "여러명이서"]
    ]

    var body: some View {
        ZStack {
            Color.black
            
            VStack {
                Text("디비전")
                    .font(.heading4)
                    .foregroundStyle(.white)
                configureSection(.division, count: 3)
                
                Text("드릴")
                    .font(.heading4)
                    .foregroundStyle(.white)
                configureSection(.drill, count: 3)
                
                Text("장소")
                    .font(.heading4)
                    .foregroundStyle(.white)
                configureSection(.location, count: 2)

                Text("참여인원")
                    .font(.heading4)
                    .foregroundStyle(.white)
                configureSection(.party, count: 3)
                
                Text("적용하기")
                    .applyMintButtonModifier(width: 320, height: 50)
                    .verticalPadding(direction: .top, size: 5)
               
            }
            .background {
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color(.background1))
                    .frameForUPNBE(width: 340, height: 600)
            }
            .horizontalPadding(direction: .horizontal, size: 10)
            .verticalPadding(direction: .bottom, size: 10)
        }
        .ignoresSafeArea()
    }
    
}

extension FilterBasicView {
    @ViewBuilder
    private func configureSection(_ filter: Filter, count: Int) -> some View {
        let contentCount = filterContent[filter]?.count ?? 0
        let rowCount = contentCount / count
        
        VStack(alignment: .center) {
            ForEach(0...rowCount, id: \.self) { num in
                let startIndex = num * count
                let endIndex = startIndex + count > contentCount ? contentCount : startIndex + count
                HStack {
                    ForEach(startIndex..<endIndex, id: \.self) { colIndex in
                        Button {
                            viewModel.changeStatus(classify: filter, index: colIndex)
                        } label: {
                            Text(filterContent[filter]?[colIndex] ?? "")
                                .applyFilterButtonModifier(isActive: Binding(
                                    get: { viewModel.filterStatus[filter]?[colIndex] ?? false },
                                    set: { viewModel.filterStatus[filter]?[colIndex] = $0 }
                                ))
                        }
                    }
                }
            }
        }
        .verticalPadding(direction: .top, size: 15)
        .verticalPadding(direction: .bottom, size: 20)
    }
}


#Preview {
    FilterBasicView()
}
