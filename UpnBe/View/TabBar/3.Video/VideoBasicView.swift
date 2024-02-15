//
//  VideoBasicView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/13.
//

import SwiftUI
import AVKit

struct VideoBasicView: View {
    @ObservedObject var viewModel: VideoBasicViewModel
    @State var possible: Bool
    @State var whenever: Bool
    @State var save: Bool
    
    init(_ viewModel: VideoBasicViewModel) {
        self.viewModel = viewModel
        self.possible = viewModel.selectedStatus.possible
        self.whenever = viewModel.selectedStatus.whenever
        self.save = viewModel.selectedStatus.save
    }

    var body: some View {
        ZStack {
            let currentUrl = viewModel.provideURL()
            let player = AVPlayer(url: currentUrl)
            VideoPlayer(player: player)
            
            HStack {
                Spacer()
                VStack {
                    Button {
                    } label: {
                        Image(.iconDesc)
                            .resizable()
                            .frameForUPNBE(width: 30, height: 30)
                            .verticalPadding(direction: .top, size: 30)
                    }
                    Spacer()
                    VStack(spacing: 20) {
                        videoButton(.possible, status: $possible)
                        videoButton(.whenever, status: $whenever)
                        videoButton(.save, status: $save)
                    }
                    
                    .horizontalPadding(direction: .bottom, size: 50)
                }
                .verticalPadding(direction: .trailing, size: 20)
            }
        }
        .onReceive(viewModel.objectWillChange) { _ in
            self.possible = self.viewModel.selectedStatus.possible
            self.whenever = self.viewModel.selectedStatus.whenever
            self.save = self.viewModel.selectedStatus.save
        }
        .ignoresSafeArea()
    }
}

extension VideoBasicView {
    @ViewBuilder
    func videoButton(_ type: ButtonType, status: Binding<Bool>) -> some View {
        VStack {
            Button(action: {
                status.wrappedValue.toggle()
                if status.wrappedValue == true {
                    viewModel.updateVideoStatus(status: type)
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                        viewModel.nextVideo()
                    }
                }
            }, label: {
                if status.wrappedValue {
                    Image(type.image)
                        .resizable()
                        .renderingMode(.template)
                        .frameForUPNBE(width: 40, height: 40)
                        .foregroundStyle(.color2)
                } else {
                    Image(type.image)
                        .resizable()
                        .frameForUPNBE(width: 40, height: 40)
                }
            })
            Text(type.rawValue)
                .font(.heading6)
                .foregroundStyle(.basic)
        }
    }
}

#Preview {
    VideoBasicView(VideoBasicViewModel())
}
