//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by 1v1 on 2021/11/08.
//

import UIKit
import RxSwift
import RxCocoa

class SignUpViewController: UIViewController {
    @IBOutlet weak var PWFirstTextField: UITextField!
    @IBOutlet weak var PWSecondTextField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var enterBtn: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        PWSecondTextField.rx.text
            .orEmpty // optional 걸러 줌
            .skip(1) // 첫 번째 이벤트는 무시
            .distinctUntilChanged() // editingEvents 이벤트는 무시, 값 바뀔 때만 ㅇㅇ
            .subscribe(onNext: { changedText in
                if changedText != self.PWFirstTextField.text {
                    DispatchQueue.main.async {
                        self.infoLabel.isHidden = false
                    }
                } else {
                    DispatchQueue.main.async {
                        self.infoLabel.isHidden = true
                    }
                }
            })
            .disposed(by: disposeBag)
        
    }

}

