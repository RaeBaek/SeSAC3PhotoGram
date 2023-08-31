//
//  TitleViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/29.
//

import UIKit

class TitleViewController: BaseViewController {
    
    let textField = {
        let view = UITextField()
        view.placeholder = "제목을 입력하세요."
        return view
    }()
    
    //Closure - 1
    var completionHandler: ((String, Int, Bool) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    deinit {
        print("deinit", self)
    }
    
    override func configureView() {
        super.configureView()
        view.addSubview(textField)
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "완료", style: .plain, target: self, action: #selector(doneButtonClicked))
    }
    
    @objc func doneButtonClicked() {
        guard let text = textField.text else { return }
        
        //Closure - 2
        completionHandler?(text, 26, true)
        
        navigationController?.popViewController(animated: true)
    }
    
    override func setConstraints() {
        textField.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(50)
        }
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
}
