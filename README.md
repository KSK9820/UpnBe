## 프로젝트 개요

> 좋은 퀄리티의 훈련 진행’에 앞서, 스포츠에 참여하는 이들의 데이터를 취합하고 정량화하기 위한 데이터 수집 앱
스포츠 동영상을 활용하여 자신의 수준을 점검할 수 있다.
> 
- Target version: 16.0
- Framework: SwiftUI, AVKit
<br/>

## 구현 화면
| 온보딩1 | 온보딩2 | 온보딩3 |
| --- | --- | --- |
|<img width="432" alt="Iphone 15 (Color 1)" src="https://github.com/KSK9820/UpnBe/assets/68066104/83968faf-d3ec-41e3-9ce1-2db0d5d51a9d">|<img width="432" alt="Iphone 15 (Color 1)-2" src="https://github.com/KSK9820/UpnBe/assets/68066104/e1181bfe-35d2-487f-a7a9-1dcc2a065b7b">|<img width="432" alt="Iphone 15 (Color 1)-1" src="https://github.com/KSK9820/UpnBe/assets/68066104/e6ff2e71-4a91-4426-a6c6-2f319895732e"> |

| 프로필 | 레포트 | 재생| 저장 | 필터 | 
| --- | --- | --- | --- | --- |
|<img width="432" alt="1" src="https://github.com/KSK9820/UpnBe/assets/68066104/ea1191ac-a5af-420e-85f3-9240c6fdd649">|![2](https://github.com/KSK9820/UpnBe/assets/68066104/d7176b82-325c-4776-8e43-5662f88439cb)|<img width="432" alt="3" src="https://github.com/KSK9820/UpnBe/assets/68066104/b6f22f0c-096f-4e71-9d97-c386dd38294d">|<img width="432" alt="4-1" src="https://github.com/KSK9820/UpnBe/assets/68066104/895b0d3b-faa6-4321-97a8-859ba5df4a62">|<img width="432" alt="5-1" src="https://github.com/KSK9820/UpnBe/assets/68066104/47763768-304c-4e47-a1ff-cc799cac43e2">|

<br/>

## 프로젝트 파일 구조
```
.
├── UpnBe
│   ├── ContentView.swift
│   ├── Info.plist
│   ├── UpnBeApp.swift
│   ├── Extension
│   │   ├── Components
│   │   │   ├── ButtonCustomModifier.swift
│   │   │   ├── RoundedCorner.swift
│   │   │   └── TextFieldCustomModifier.swift
│   │   ├── Font+Extension.swift
│   │   └── View+Extension.swift
│   └── View
│       ├── OnBoarding
│       │   ├── MainChoiceView.swift
│       │   ├── MainNumberView.swift
│       │   └── MainReadyView.swift
│       └── TabBar
│           ├── 1.Profile
│           │   ├── ProfileBasicView.swift
│           │   └── ProfileJoinView.swift
│           ├── 2.Report
│           │   ├── ReportBasicView.swift
│           │   ├── ReportLoginView.swift
│           │   └── ReportShortfallView.swift
│           ├── 3.Video
│           │   └── VideoBasicView.swift
│           ├── 4. Save
│           │   └── SaveBasicView.swift
│           ├── 5.Filter
│           │   └── FilterBasicView.swift
│           └── ReusableView
│               ├── ProfileHeaderView.swift
│               └── ReportHeaderView.swift
```
<br/>

## 노력한 점
- 기기별 화면 크기에 맞게 내부 컴포넌트들의 크기를 유동적으로 조절하기 위해, 기기의 전체 크기 사이즈를 기반으로 주어진 크기에 맞춰 비율 계산함
- view와 viewModel을 분리하여 view는 view에서 표시하기를 위한 데이터만 가지고 있고, viewModel에서 데이터 가공 및 로직을 처리함

<br/>
