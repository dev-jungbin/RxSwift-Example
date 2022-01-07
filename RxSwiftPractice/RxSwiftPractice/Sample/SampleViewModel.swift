//
//  SampleViewModel.swift
//  RxSwiftPractice
//
//  Created by 1v1 on 2022/01/07.
//

import Foundation
import RxSwift
/// ViewModel정의, input이 들어오면 내부에서 output할 것을 Observable로 생성
class SampleViewModel: ViewModelType {
    let input: Input
    let output: Output
    
    init(input: Input, dependency: String) {
        self.input = input
        let rxResult = input.text.asObservable()
        self.output = Output(result: rxResult)
    }
}

extension SampleViewModel {
    struct Input {
        let text: Observable<String>
    }
    
    struct Output {
        let result: Observable<String>
    }
}
