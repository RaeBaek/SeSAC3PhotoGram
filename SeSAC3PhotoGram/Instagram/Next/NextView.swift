//
//  NextView.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/30.
//

import UIKit

class NextView: BaseView {
    
    let textField = {
        let view = UITextField()
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.borderStyle = .line
        return view
    }()
    
    let lineView = {
        let view = UIView()
        view.backgroundColor = .systemGray6
        return view
    }()
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
    override func configureView() {
        super.configureView()
        
        addSubview(textField)
        addSubview(lineView)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        textField.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(self.safeAreaLayoutGuide).inset(16)
            $0.height.equalTo(35)
        }
        
        lineView.snp.makeConstraints {
            $0.top.equalTo(textField.snp.bottom).offset(10)
            $0.horizontalEdges.equalToSuperview()
            $0.height.equalTo(1)
        }
    }
    
}
