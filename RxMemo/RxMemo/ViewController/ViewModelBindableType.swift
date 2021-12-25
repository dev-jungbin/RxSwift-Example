//
//  ViewModelBindableType.swift
//  RxMemo
//
//  Created by 1v1 on 2021/12/12.
//

import UIKit

protocol ViewModelBindableType {
    associatedtype ViewModelType
    
    var viewModel: ViewModelType! { get set }
    func bindViewModel()
}

extension ViewModelBindableType where Self: UIViewController {
    // VC에 추가된 bindable 속성의 실제 모델을 저장하고, bind 뷰모델 메소드를 자동으로 호출하는 메소드
    // 개별 VC에서 bind view model 메소드를 직접 호출할 필요가 없음! 간편!
    
    mutating func bind(viewModel: Self.ViewModelType) {
        self.viewModel = viewModel
        loadViewIfNeeded()
        
        bindViewModel()
    }
    
}
