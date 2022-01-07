//
//  ViewModelType.swift
//  RxSwiftPractice
//
//  Created by 1v1 on 2022/01/07.
//

import Foundation

protocol ViewModelType {
    associatedtype Input
    associatedtype Output
    
    var input: Input {get}
    var output: Output {get}
}
