//
//  AddView.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/28.
//

import UIKit

class AddView: BaseView {
    
    let photoImageView = {
        let view = UIImageView()
        view.backgroundColor = .lightGray
        view.contentMode = .scaleAspectFill
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let searchButton = {
        let view = UIButton()
        view.setImage(UIImage(systemName: "magnifyingglass"), for: .normal)
        view.backgroundColor = .systemGreen
        return view
    }()
    
    let searchProtocolButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        return view
    }()
    
    let dateButton = {
        let view = UIButton()
        view.backgroundColor = .systemPink
        view.setTitle(DateFormatter.today(), for: .normal)
        return view
    }()
    
    let titleButton = {
        let view = UIButton()
        view.backgroundColor = .systemBlue
        view.setTitle("오늘의 사진", for: .normal)
        return view
    }()
    
    let contentButton = {
        let view = UIButton()
        view.backgroundColor = .systemCyan
        view.setTitle("오늘의 명언", for: .normal)
        return view
    }()
    
    override func configureView() {
        [photoImageView, searchButton, dateButton, searchProtocolButton, titleButton, contentButton].forEach {
            addSubview($0)
        }
    }
    
    override func setConstraints() {
        photoImageView.snp.makeConstraints {
            $0.topMargin.leadingMargin.trailingMargin.equalTo(self.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(self).multipliedBy(0.3)
        }
        
        searchButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.bottom.trailing.equalTo(photoImageView)
        }
        
        searchProtocolButton.snp.makeConstraints {
            $0.size.equalTo(50)
            $0.bottom.leading.equalTo(photoImageView)
        }
        
        dateButton.snp.makeConstraints {
            $0.top.equalTo(photoImageView.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        
        titleButton.snp.makeConstraints {
            $0.top.equalTo(dateButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(50)
        }
        
        contentButton.snp.makeConstraints {
            $0.top.equalTo(titleButton.snp.bottom).offset(10)
            $0.horizontalEdges.equalTo(self.safeAreaLayoutGuide)
            $0.height.equalTo(100)
        }
    }
    
}
