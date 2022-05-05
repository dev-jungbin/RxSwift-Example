//
//  Scene.swift
//  RxMemo
//
//  Created by 1v1 on 2021/12/26.
//

import UIKit

enum Scene {
    case list(MemoListViewModel) // 씬 이름과 연관된 뷰모델을 연관값으로 지정
    case detail(MemoDetailViewModel)
    case compose(MemoComposeViewModel)
}

extension Scene {
    // 스토리보드에 있는 씬을 생성하고, 연관값에 있는 뷰모델을 바인딩해서 리턴하는 메소드
    func instantiate(from storyboard: String = "Main") -> UIViewController {
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        
        switch self {
        case .list(let viewModel):
            // 메모 목록 씬 생성 후, 뷰모델을 바인딩하여 리턴
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ListNav") as? UINavigationController else {
                fatalError()
            }
            guard var listVC = nav.viewControllers.first as? MemoListViewController else {
                fatalError()
            }
            listVC.bind(viewModel: viewModel)
            return nav
            
        case .detail(let viewModel):
            // 상세 보기 씬 생성
            guard var detailVC = storyboard.instantiateViewController(withIdentifier: MemoDetailViewController.ID) as? MemoDetailViewController else {
                fatalError()
            }
            detailVC.bind(viewModel: viewModel)
            return detailVC
            
        case .compose(let viewModel):
            guard let nav = storyboard.instantiateViewController(withIdentifier: "ComposeNav") as? UINavigationController else {
                fatalError()
            }
            guard var composeVC = nav.viewControllers.first as? MemoComposeViewController else {
                fatalError()
            }
            composeVC.bind(viewModel: viewModel)
            return nav
        }
    }
}
