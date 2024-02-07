//
//  ContentView.swift
//  UpnBe
//
//  Created by 김수경 on 2024/02/05.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            FilterBasicView()
                .tabItem {
                    Image(.iconProfileOff)
                        .renderingMode(.template)
                }
            ReportBasicView(viewModel: ReportBasicViewModel())
                .tabItem {
                    Image(.iconReportOff)
                        .renderingMode(.template)
                }
            FilterBasicView()
                .tabItem {
                    Image(.iconShortformOff)
                        .renderingMode(.template)
                }
            FilterBasicView()
                .tabItem {
                    Image(.iconSaveOff)
                        .renderingMode(.template)
                }
            FilterBasicView()
                .tabItem {
                    Image(.iconFilterOff)
                        .renderingMode(.template)
                }
        }
        //        MainChoiceView()
    }
}

#Preview {
    ContentView()
}
