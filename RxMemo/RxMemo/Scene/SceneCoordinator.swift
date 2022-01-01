//
//  SceneCoordinator.swift
//  RxMemo
//
//  Created by 1v1 on 2021/12/26.
//

import Foundation
import RxSwift
import RxCocoa

class SceneCoordinator: SceneCoordinatorType {
    private let bag = DisposeBag() // 리소스 정리에 사용
    
    private var window: UIWindow
    private var currentVC: UIViewController
    
    required init(window: UIWindow) {
        self.window = window
        currentVC = window.rootViewController!
    }
    
    @discardableResult
    func transition(to scene: Scene, using style: TransitionStyle, animated: Bool) -> Completable {
        // 전환 결과를 방출할 subject
        let subject = PublishSubject<Void>()
        
        let target = scene.instantiate()
        
        switch style {
        case .root:
            currentVC = target
            window.rootViewController = target
            subject.onCompleted()
        case .push: // 네비게이션 컨트롤러에 임베드되어 있을 떄만 의미가 있음. 확인 필요!
            guard let nav = currentVC.navigationController else {
                subject.onError(TransitionError.navigationControllerMissing)
                break
            }
            
            nav.pushViewController(target, animated: animated)
            currentVC = target
            
            subject.onCompleted()
        case .modal:
            currentVC.present(target, animated: animated) {
                subject.onCompleted()
            }
            currentVC = target
        }
        
        return subject.ignoreElements() // completable로 변환되어 리턴됨
    }
    
    @discardableResult
    func close(animated: Bool) -> Completable {
        <#code#>
    }
    
    
}
