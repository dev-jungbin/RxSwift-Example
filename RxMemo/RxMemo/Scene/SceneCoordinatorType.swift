//
//  SceneCoordinatorType.swift
//  RxMemo
//
//  Created by 1v1 on 2021/12/26.
//

import Foundation
import RxSwift

protocol SceneCoordinatorType {
    @discardableResult // Return 안 해도 ㄱㅊ
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable
    
    @discardableResult
    func close(animated: Bool) -> Completable
}
