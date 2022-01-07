//
//  SampleVC.swift
//  RxSwiftPractice
//
//  Created by 1v1 on 2022/01/07.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class SampleVC: UIViewController {
    static let ID = "SampleVC"
    
    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var label: UILabel!
    
    var viewModel: SampleViewModel!
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    private func bind() {
        
        let input = SampleViewModel.Input(text: textField.rx.text.orEmpty.asObservable())
        
        guard let text = label.text else { return }
        
        viewModel = SampleViewModel(input: input, dependency: text)
        
        viewModel.output.result
            .bind(to: label.rx.text)
            .disposed(by: disposeBag)
        
    }
}
