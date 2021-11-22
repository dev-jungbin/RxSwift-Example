//
//  Memo.swift
//  RxMemo
//
//  Created by 1v1 on 2021/11/22.
//

import Foundation
// Equatable 프로토콜? 연산자를 통해 비교할 수 있는 타입을 만들 때 채택하여 사용하는 프로토콜

struct Memo: Equatable {
    var content: String
    var insertDate: Date
    var identity: String
    
    init(content: String, insertDate: Date = Date()) {
        self.content = content
        self.insertDate = insertDate
        self.identity = "\(insertDate.timeIntervalSinceReferenceDate)"
    }
    
    // 업데이트된 내용으로 새로운 메모 인스턴스를 생성할 때 사용하는 생성자
    init(original: Memo, updatedContent: String) {
        self = original
        self.content = updatedContent
    }
}
