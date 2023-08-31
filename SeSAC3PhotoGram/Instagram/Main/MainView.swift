//
//  MainHeaderView.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/29.
//

import UIKit

class MainView: BaseView {
    
    let mainTableView = {
        let view = UITableView()
        view.backgroundColor = .systemBackground
        view.register(MainTableViewCell.self, forCellReuseIdentifier: "MainTableViewCell")
        view.register(MainImageTableViewCell.self, forCellReuseIdentifier: "MainImageTableViewCell")
        return view
    }()
    
    let mainHeaderView = {
        let view = UIView()
        return view
    }()
    
    let profileImage = {
        let view = ProfileImageView(frame: .zero)
        view.image = UIImage(named: "프로필사진")
        return view
    }()
    
    let abatarImage = {
        let view = AvatarImageView(frame: .zero)
        view.backgroundColor = .clear
        return view
    }()
    
    let editLabel = {
        let view = UILabel()
        view.text = "사진 또는 아바타 수정"
        view.font = .systemFont(ofSize: 14, weight: .medium)
        view.textColor = .systemBlue
        return view
    }()
    
    override func setNeedsLayout() {
        super.setNeedsLayout()
    }
    
    override func configureView() {
        super.configureView()
        
        addSubview(mainTableView)
        
    }
    
    override func setConstraints() {
        super.setConstraints()

        mainTableView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
        
    }
    
}
