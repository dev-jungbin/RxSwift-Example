//
//  MemoryStorage.swift
//  RxMemo
//
//  Created by 1v1 on 2021/11/22.
//

import Foundation
import RxSwift

class MemoStorage: MemoStorageType {
    private var list = [
        Memo(content: "Hello, RxSwift!!!!!!!!", insertDate: Date().addingTimeInterval(-10)),
        Memo(content: "Bye, RxSwift!!!!!!!!", insertDate: Date().addingTimeInterval(-20))
    ]
    
    // 초기값을 가지고 있는 BehaviorSubject
    private lazy var store = BehaviorSubject<[Memo]>(value: list)
    
    // 배열을 변경한 후 서브젝트에서 새로운 넥스트 이벤트를 방출하는 패턴
    @discardableResult
    func createMemo(content: String) -> Observable<Memo> {
        let memo = Memo(content: content)
        list.insert(memo, at: 0)
        store.onNext(list)
        return Observable.just(memo)
    }
    
    @discardableResult
    func memoList() -> Observable<[Memo]> { // 클래스 외부에서는 항상 이 메소드를 이용해 접근
        return store
    }
    
    @discardableResult
    func update(memo: Memo, content: String) -> Observable<Memo> {
        let updated = Memo(original: memo, updatedContent: content)
        
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
            list.insert(updated, at: index)
        }
        store.onNext(list)
        return Observable.just(updated)
    }
    
    @discardableResult
    func delete(memo: Memo) -> Observable<Memo> {
        if let index = list.firstIndex(where: { $0 == memo }) {
            list.remove(at: index)
        }
        store.onNext(list)
        return Observable.just(memo)
    }
}
