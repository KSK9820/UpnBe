//
//  ReportBasicView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/07.
//

import SwiftUI

struct ReportBasicView: View {
    private let viewModel: ReportBasicViewData
    
    init() {
        self.viewModel = ReportBasicViewData()
    }
    
    var body: some View {
        ZStack {
            Color.background1
                .ignoresSafeArea()
            VStack(spacing: 15) {
                ReportHeaderView()
                configureLevel(level: viewModel.drillLevel)
                configureUpBoard(level: viewModel.drillLevel, max: viewModel.drillMaxLevel)
                Spacer()
            }
            
        }

    }
}

extension ReportBasicView {
    @ViewBuilder
    private func configureLevel(level: [Int]) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("드릴별 레벨")
                .font(.heading4)
                .foregroundStyle(.white)
            HStack {
                ForEach(viewModel.drillLevelName.indices, id: \.self) { index in
                    VStack {
                        Text(viewModel.drillLevelName[index])
                            .font(.paragraph3)
                            .foregroundStyle(.white)
                            .verticalPadding(direction: .bottom, size: 5)
                        Text("\(viewModel.drillLevel[index])")
                            .font(.heading2)
                            .foregroundStyle(.color1)
                    }
                    .padding()
                }
            }
            .background {
                RoundedCorner(radius: 20)
                    .fill(.background2)
                    .frameForUPNBE(width: 310, height: 100)
            }
            .frameForUPNBE(width: 310, height: 100)
        }
        
    }
    
    private func configureUpBoard(level: [Int], max: [Int]) -> some View {
        VStack(alignment: .leading, spacing: 5) {
            Text("드릴 가능UP 현황")
                .font(.heading4)
                .foregroundStyle(.white)
            VStack {
                ForEach(viewModel.drillLevelName.indices, id: \.self) { index in
                    VStack(alignment: .leading, spacing: 5) {
                        HStack {
                            Text(viewModel.drillLevelName[index])
                                .font(.paragraph3)
                                .foregroundStyle(.white)
                            Spacer()
                            
                            Text("\(level[index])")
                                .font(.paragraph5)
                                .foregroundColor(.background5)
                            +
                            Text("/\(max[index])")
                                .font(.paragraph5)
                                .foregroundColor(.background4)
                        }
                        
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.color1)
                            .frameForUPNBE(width: viewModel.percentageOfDrillUp(index: index), height: 20)
                            .background(alignment: .leading) {
                                RoundedRectangle(cornerRadius: 20)
                                    .fill(.background3)
                                    .frameForUPNBE(width: 280, height: 20)
                            }
                    }
                    .frameForUPNBE(width: 280, height: 58)
                }
            }
            .background {
                RoundedCorner(radius: 20)
                    .fill(.background2)
                    .frameForUPNBE(width: 310, height: 280)
            }
            .frameForUPNBE(width: 310, height: 280)
        }
    }
}


#Preview {
    ReportBasicView()
}
