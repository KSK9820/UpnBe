//
//  SaveBasicView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/10.
//

import SwiftUI
import AVKit

enum saveTabStatus: Int, CaseIterable {
    case possible = 0
    case be = 1
    case saved = 2
    
    var name: String {
        switch self {
        case .possible:
            "가능"
        case .be:
            "언젠간"
        case .saved:
            "저장"
        }
    }
}

final class saveBasicViewData {
    private let videos: [saveTabStatus: [URL]?] = [
        .possible: [URL(string: "https://s3-figma-videos-production-sig.figma.com/video/1241797149607002234/TEAM/fad3/24d9/-5c51-4cbe-8c72-eca5b12f79ef?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hUb7m7gz1SN17f3aQoTnEcAoQ7c9PsczfnpecvVQ5eB9MUY6XINJYWh8qTosiDIJOHpX3m7Dh6Nu5TRD8Kov2kDRoLYX9GS5ZkrZWZhID~H7mtMabS770UNiuC9ANjjaOs1P9JweoirBduP6POrhjwBYitFFhR~qE6C3jB6CabDKd3Ym1aO9avmiZBfl~O12-bbTueAYUB5Ij7~ZCF7dCT2~AMj12n-pz9J25a-MiW07aDoXd8ujxvNXUX5ZPk-JM6El3mc6y6A2olrRAgSkH5QedzkaK-e~t6MaFnz32GQpOW00QkoiqGdN4tB6tpkpcnNW-ClXI1-~1hZMJ9a1ow__")!, URL(string: "https://s3-figma-videos-production-sig.figma.com/video/1241797149607002234/TEAM/fad3/24d9/-5c51-4cbe-8c72-eca5b12f79ef?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hUb7m7gz1SN17f3aQoTnEcAoQ7c9PsczfnpecvVQ5eB9MUY6XINJYWh8qTosiDIJOHpX3m7Dh6Nu5TRD8Kov2kDRoLYX9GS5ZkrZWZhID~H7mtMabS770UNiuC9ANjjaOs1P9JweoirBduP6POrhjwBYitFFhR~qE6C3jB6CabDKd3Ym1aO9avmiZBfl~O12-bbTueAYUB5Ij7~ZCF7dCT2~AMj12n-pz9J25a-MiW07aDoXd8ujxvNXUX5ZPk-JM6El3mc6y6A2olrRAgSkH5QedzkaK-e~t6MaFnz32GQpOW00QkoiqGdN4tB6tpkpcnNW-ClXI1-~1hZMJ9a1ow__")!, URL(string: "https://s3-figma-videos-production-sig.figma.com/video/1241797149607002234/TEAM/fad3/24d9/-5c51-4cbe-8c72-eca5b12f79ef?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hUb7m7gz1SN17f3aQoTnEcAoQ7c9PsczfnpecvVQ5eB9MUY6XINJYWh8qTosiDIJOHpX3m7Dh6Nu5TRD8Kov2kDRoLYX9GS5ZkrZWZhID~H7mtMabS770UNiuC9ANjjaOs1P9JweoirBduP6POrhjwBYitFFhR~qE6C3jB6CabDKd3Ym1aO9avmiZBfl~O12-bbTueAYUB5Ij7~ZCF7dCT2~AMj12n-pz9J25a-MiW07aDoXd8ujxvNXUX5ZPk-JM6El3mc6y6A2olrRAgSkH5QedzkaK-e~t6MaFnz32GQpOW00QkoiqGdN4tB6tpkpcnNW-ClXI1-~1hZMJ9a1ow__")!, URL(string: "https://s3-figma-videos-production-sig.figma.com/video/1241797149607002234/TEAM/fad3/24d9/-5c51-4cbe-8c72-eca5b12f79ef?Expires=1708300800&Key-Pair-Id=APKAQ4GOSFWCVNEHN3O4&Signature=hUb7m7gz1SN17f3aQoTnEcAoQ7c9PsczfnpecvVQ5eB9MUY6XINJYWh8qTosiDIJOHpX3m7Dh6Nu5TRD8Kov2kDRoLYX9GS5ZkrZWZhID~H7mtMabS770UNiuC9ANjjaOs1P9JweoirBduP6POrhjwBYitFFhR~qE6C3jB6CabDKd3Ym1aO9avmiZBfl~O12-bbTueAYUB5Ij7~ZCF7dCT2~AMj12n-pz9J25a-MiW07aDoXd8ujxvNXUX5ZPk-JM6El3mc6y6A2olrRAgSkH5QedzkaK-e~t6MaFnz32GQpOW00QkoiqGdN4tB6tpkpcnNW-ClXI1-~1hZMJ9a1ow__")!],
        .be: nil,
        .saved: nil
    ]
    
    func hasVideo(for status: saveTabStatus) -> [URL]? {
        guard let video = videos[status] else {
            return nil
        }
        return video
    }

}

struct SaveBasicView: View {
    @State private var selected: saveTabStatus = .possible
    @State private var selectStatus = [true, false, false]
    
    let viewModel: saveBasicViewData
    
    init() {
        self.viewModel = saveBasicViewData()
    }
    
    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack(alignment: .top, spacing: 62) {
                    ForEach(saveTabStatus.allCases, id: \.self) { status in
                        Text(status.name)
                            .applyTabbarButtonModifier(isActive: $selectStatus[status.rawValue])
                            .onTapGesture {
                                selected = status
                                selectTabbar(idx: status.rawValue)
                            }
                    }
                }
                .background {
                    Rectangle()
                        .fill(.background2)
                        .frame(height: 0.5)
                        .frameForUPNBE(width: 360, height: 0.5)
                        .horizontalPadding(direction: .top, size: 36)
                }
                Spacer()
                configureVideoGrid(selected: $selected)
                    .verticalPadding(direction: .top, size: 10)
                    .horizontalPadding(direction: .horizontal, size: 12)
                   
                Spacer()
            }
        }
    }
}

extension SaveBasicView {
    private func selectTabbar(idx: Int) {
        selectStatus = [Bool](repeating: false, count: saveTabStatus.allCases.count)
        selectStatus[idx] = true
    }
    
    @ViewBuilder
    private func configureVideoGrid(selected: Binding<saveTabStatus>) -> some View {
        let emptyComments: [String] = ["아직 모든 기술을 다 보지 못하셨나요?\n{#이름}님의 실력 향상을 응원해요!", "모든 기술을 다 습득하신건가요?\n그렇다면 {#이름}님은 세미프로!", "내가 모은 훈련 꿀팁을 모아 보세요\n{#이름}님 만의 특별한 훈련 일지가 될거에요"]
        
            if let videoURL = viewModel.hasVideo(for: selected.wrappedValue) {
                let row = Array(repeating: GridItem(.flexible(), spacing: 12), count: 3)
                ScrollView{
                    LazyVGrid(columns: row) {
                        ForEach(videoURL.indices, id: \.self) { index in
                            let player = AVPlayer(url: videoURL[index])
                            VideoPlayer(player: player)
                                .aspectRatio(0.5, contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                        }
                    }
                }
            } else {
                Text(emptyComments[selected.wrappedValue.rawValue])
                    .font(.heading4)
                    .foregroundStyle(.basic)
                    .multilineTextAlignment(.center)
            }
    }
}


#Preview {
    SaveBasicView()
}
