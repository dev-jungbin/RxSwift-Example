//
//  ViewController.swift
//  RxSwiftPractice
//
//  Created by 1v1 on 2021/11/08.
//

import UIKit
import RxSwift

class SignUpViewController: UIViewController {
    @IBOutlet weak var IDTextFIeld: UITextField!
    @IBOutlet weak var PWTextField: UITextField!
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var enterBtn: UIButton!
    
    let disposeBag = DisposeBag()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func initIDTextField() {
        self.IDTextFIeld.rx.control
    }


}

