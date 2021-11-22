//
//  MemoStorageType.swift
//  RxMemo
//
//  Created by 1v1 on 2021/11/22.
//

import Foundation
import RxSwift

protocol MemoStorageType {
    // CRUD 구현
    
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> // 이 옵저버블을 구독하는 구독자가 작업 결과를 원하는 대로 처리할 수 있음
    
    @discardableResult
    func memoList() -> Observable<[Memo]>
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo>
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo>
}
