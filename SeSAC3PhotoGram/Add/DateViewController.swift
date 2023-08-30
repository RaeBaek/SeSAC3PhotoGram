//
//  DateViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/29.
//

import UIKit

class DateViewController: BaseViewController {

    let mainView = DateView()
    
    // Protocol 값 전달 2.
    var delegate: PassDataDelegate?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        // Protocol 값 전달 3.
        delegate?.receiveDate(date: mainView.picker.date)
        
    }
    
    override func viewDidLoad() {
        view.backgroundColor = .systemBackground
        super.viewDidLoad()
        
    }
    
    override func configureView() {
        
    }
    
    override func setConstraints() {
        
    }

}
