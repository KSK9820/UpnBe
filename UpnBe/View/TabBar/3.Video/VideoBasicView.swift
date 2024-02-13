//
//  VideoBasicView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/13.
//

import SwiftUI
import AVKit

enum ButtonType: String {
    case possible = "가능"
    case whenever = "언젠간"
    case save = "저장"
    
    var image: String {
        switch self {
        case .possible:
            "icon-up-on"
        case .whenever:
            "icon-be"
        case .save:
            "icon-save"
        }
    }
}

final class VideoBasicViewModel: ObservableObject {
    private var urls: [(url: URL, status: ButtonType?)] = [(url: URL(string: "https://s3-figma-videos-production-sig.figma.com/video/1241797149607002234/TEAM/fad3/24d9/-5c51-4cbe-8c72-eca5b12f79ef?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hUb7m7gz1SN17f3aQoTnEcAoQ7c9PsczfnpecvVQ5eB9MUY6XINJYWh8qTosiDIJOHpX3m7Dh6Nu5TRD8Kov2kDRoLYX9GS5ZkrZWZhID~H7mtMabS770UNiuC9ANjjaOs1P9JweoirBduP6POrhjwBYitFFhR~qE6C3jB6CabDKd3Ym1aO9avmiZBfl~O12-bbTueAYUB5Ij7~ZCF7dCT2~AMj12n-pz9J25a-MiW07aDoXd8ujxvNXUX5ZPk-JM6El3mc6y6A2olrRAgSkH5QedzkaK-e~t6MaFnz32GQpOW00QkoiqGdN4tB6tpkpcnNW-ClXI1-~1hZMJ9a1ow__")!, status: .whenever), (url: URL(string: "https://youtu.be/ZsJ-BHohXRI?si=1MtTwPc9g_6esb1x")!, status: nil), (url: URL(string: "https://s3-figma-videos-production-sig.figma.com/video/1241797149607002234/TEAM/fad3/24d9/-5c51-4cbe-8c72-eca5b12f79ef?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hUb7m7gz1SN17f3aQoTnEcAoQ7c9PsczfnpecvVQ5eB9MUY6XINJYWh8qTosiDIJOHpX3m7Dh6Nu5TRD8Kov2kDRoLYX9GS5ZkrZWZhID~H7mtMabS770UNiuC9ANjjaOs1P9JweoirBduP6POrhjwBYitFFhR~qE6C3jB6CabDKd3Ym1aO9avmiZBfl~O12-bbTueAYUB5Ij7~ZCF7dCT2~AMj12n-pz9J25a-MiW07aDoXd8ujxvNXUX5ZPk-JM6El3mc6y6A2olrRAgSkH5QedzkaK-e~t6MaFnz32GQpOW00QkoiqGdN4tB6tpkpcnNW-ClXI1-~1hZMJ9a1ow__")!, status: nil), (url: URL(string: "https://s3-figma-videos-production-sig.figma.com/video/1241797149607002234/TEAM/fad3/24d9/-5c51-4cbe-8c72-eca5b12f79ef?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hUb7m7gz1SN17f3aQoTnEcAoQ7c9PsczfnpecvVQ5eB9MUY6XINJYWh8qTosiDIJOHpX3m7Dh6Nu5TRD8Kov2kDRoLYX9GS5ZkrZWZhID~H7mtMabS770UNiuC9ANjjaOs1P9JweoirBduP6POrhjwBYitFFhR~qE6C3jB6CabDKd3Ym1aO9avmiZBfl~O12-bbTueAYUB5Ij7~ZCF7dCT2~AMj12n-pz9J25a-MiW07aDoXd8ujxvNXUX5ZPk-JM6El3mc6y6A2olrRAgSkH5QedzkaK-e~t6MaFnz32GQpOW00QkoiqGdN4tB6tpkpcnNW-ClXI1-~1hZMJ9a1ow__")!, status: nil),]
    
    @Published var videoNumber: Int = 0 {
        didSet {
            objectWillChange.send()
        }
    }
    
    var selectedStatus: (possible: Bool, whenever: Bool, save: Bool) {
        switch urls[videoNumber].status {
        case nil:
            (possible: false, whenever: false, save: false)
        case .possible:
            (possible: true, whenever: false, save: false)
        case .whenever:
            (possible: false, whenever: true, save: false)
        case .save:
            (possible: false, whenever: false, save: true)
        }
    }
    
    func provideURL() -> URL {
        return urls[videoNumber].url
    }
    
    func updateVideoStatus(status: ButtonType) {
        urls[videoNumber].status = status
    }
    
    func nextVideo() {
        videoNumber += 1
    }
}

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
                    DispatchQueue.global().asyncAfter(deadline: .now() + 1) {
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

extension VideoBasicView {
    @ViewBuilder
    func videoButton() -> some View {
        
    }
}

#Preview {
    VideoBasicView(VideoBasicViewModel())
}
