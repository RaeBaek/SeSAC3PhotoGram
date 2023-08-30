//
//  BaseViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/28.
//

import UIKit
//import SnapKit

class BaseViewController: UIViewController { //UIViewConroller가 아닌 UIPageViewController를 상속받고 있어 오류가 발생했던 것!

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setConstraints()
        
    }
    
    func configureView() { // addSubview
        view.backgroundColor = .systemBackground
        print("Base ConfigureView")
    }
    
    func setConstraints() { // 제약조건
        print("Base SetConstrints")
    }

}
