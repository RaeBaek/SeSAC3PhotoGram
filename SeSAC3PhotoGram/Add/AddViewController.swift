//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/28.
//

import UIKit

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    
    override func loadView() { // viewDidLoad보다 먼저 호출된다, suer 메서드 호출 X
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: NSNotification.Name("SelectImage"), object: nil)
        
    }
    
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        print("selectImageNotificationObserver")
        print(notification.userInfo?["name"])
        print(notification.userInfo?["sample"])
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
    }
    
    @objc func searchButtonClicked() {
        
        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()!])
        present(SearchViewController(), animated: true)
        
    }
    
    override func configureView() {
        super.configureView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        print("Add SetConstrints")
        
    }
    
}

