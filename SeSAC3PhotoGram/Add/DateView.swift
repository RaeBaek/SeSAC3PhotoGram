//
//  DateView.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/29.
//

import UIKit

class DateView: BaseView {
    
    let picker = {
        let view = UIDatePicker()
        view.datePickerMode = .date
        view.preferredDatePickerStyle = .wheels
        return view
    }()
    
    override func configureView() {
        addSubview(picker)
    }
    
    override func setConstraints() {
        picker.snp.makeConstraints {
            $0.top.leading.trailing.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
