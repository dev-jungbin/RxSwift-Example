//
//  ViewController.swift
//  RxSwiftBasic
//
//  Created by 1v1 on 2021/10/12.
//

import UIKit
import RxSwift

class ViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    lazy var activityIndicator: UIActivityIndicatorView = {
        let activityIndicator = UIActivityIndicatorView()
        activityIndicator.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        activityIndicator.center = self.view.center
        activityIndicator.color = .tintColor
        activityIndicator.hidesWhenStopped = true
        activityIndicator.style = UIActivityIndicatorView.Style.white
        print("activity Indicator called \(activityIndicator.isAnimating)")
        return activityIndicator
        
    }()
    var disposable: Disposable?
    var imageURLStr = "https://www.clementoni.com/media/prod/es/31994/le-mont-saint-michel-1500-piezas-high-quality-collection_dC2G5NH.jpg"
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(activityIndicator)
        
    }
    // MARK: DispatchQueue 사용
    func showImage(_ url: String) {
        self.activityIndicator.startAnimating()
        DispatchQueue.global().async {
            let imgUrl = URL(string: url)
            let data = try! Data(contentsOf: imgUrl!)
            DispatchQueue.main.async {
                self.activityIndicator.stopAnimating()
                self.imageView.image = UIImage(data: data)
            }
        }
        
    }
    
    // MARK: RxSwift 사용
    func showImageRx(_ url: String) -> Observable<UIImage?>{
        return Observable.create { seal in
            asyncLoadImage(from: url) { image in
                seal.onNext(image)
                seal.onCompleted()
            }
            return Disposables.create()
        }
    }
    @IBAction func tapDownloadBtn(_ sender: Any) {
        print("tapDownloadBtn called")
        showImage(imageURLStr)
    }
    @IBAction func tapDownloadRxBtn(_ sender: Any) {
        disposable = showImageRx(imageURLStr)
            .observe(on: MainScheduler.instance)
            .subscribe({ result in
                switch result {
                case let .next(image):
                    print("called .next")
                    self.imageView.image = image
                case let .error(err):
                    print(err.localizedDescription)
                case .completed:
                    print("called .completed")
                    break
                }
            })
    }
    @IBAction func tapDisposeBtn(_ sender: Any) {
        disposable?.dispose()
    }
    @IBAction func tapClearBtn(_ sender: Any) {
        imageView.image = nil

    }
    
    
}

