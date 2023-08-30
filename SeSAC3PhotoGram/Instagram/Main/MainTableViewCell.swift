//
//  MainTableViewCell.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/30.
//

import UIKit

class MainTableViewCell: BaseTableViewCell {
    
    let titleLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    let subtitleLabel = {
        let view = UILabel()
        view.font = .systemFont(ofSize: 17, weight: .regular)
        view.textColor = .black
        return view
    }()
    
    let nextImage = {
        let view = UIImageView()
        view.image = UIImage(systemName: "chevron.right")
        view.tintColor = .lightGray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    override func configureCell() {
        super.configureCell()
        
        [titleLabel, subtitleLabel, nextImage].forEach {
            contentView.addSubview($0)
        }
    }
    
    override func setConstraints() {
        super.setConstraints()
        
        titleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalToSuperview().offset(16)
            $0.width.equalTo(100)
        }
        
        nextImage.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.trailing.equalToSuperview().inset(16)
            $0.size.equalTo(15)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.centerY.equalToSuperview()
            $0.leading.equalTo(titleLabel.snp.trailing).offset(16)
            $0.trailing.equalTo(nextImage.snp.leading).offset(-16)
        }
        
    }
}
