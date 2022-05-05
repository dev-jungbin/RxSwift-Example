//
//  TransitionModel.swift
//  RxMemo
//
//  Created by 1v1 on 2021/12/26.
//

import Foundation

// 화면 전환 방식 열거형
enum TransitionStyle {
    case root
    case push
    case modal
}

// 화면 전환 시 에러 형식 선언
enum TransitionError: Error {
    case navigationControllerMissing
    case cannotPop
    case unknown
}
