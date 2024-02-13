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
            if false {
                ProfileJoinView()
                    .tabItem {
                        Image(.iconProfileOff)
                            .renderingMode(.template)
                    }
            } else {
                ProfileBasicView(ProfileHeaderViewModel())
                    .tabItem {
                        Image(.iconProfileOff)
                            .renderingMode(.template)
                    }
            }
            if false {
                ReportLoginView()
                    .tabItem {
                        Image(.iconReportOff)
                            .renderingMode(.template)
                    }
            } else {
                ReportBasicView(ReportBasicViewModel())
                    .tabItem {
                        Image(.iconReportOff)
                            .renderingMode(.template)
                    }
            }
            
            VideoBasicView(VideoBasicViewModel())
                .tabItem {
                    Image(.iconShortformOff)
                        .renderingMode(.template)
                }
            SaveBasicView(saveBasicViewModel())
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
