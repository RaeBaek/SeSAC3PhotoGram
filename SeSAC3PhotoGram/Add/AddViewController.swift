//
//  AddViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/28.
//

import UIKit
import SeSAC3PhotoGramFramework
import Kingfisher

// Protocol 값 전달 1.
protocol PassDataDelegate {
    func receiveDate(date: Date)
}

// Protocol 값 전달 1.
protocol PassImageDataDelegate {
    func receiveImageData(url: URL)
}

class AddViewController: BaseViewController {
    
    let mainView = AddView()
    let picker = UIImagePickerController()
    
    override func loadView() { // viewDidLoad보다 먼저 호출된다, suer 메서드 호출 X
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
//        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: NSNotification.Name("SelectImage"), object: nil)
        
        ClassOpenExample.publicExample()
        ClassPublicExample.publicExample()
//        ClassPublicExample.internalExample()
        
        APIService.shared.callRequest(query: "sky") { _ in
            
        }
        
    }
    
    deinit {
        print("deinit", self)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print(#function)
//        NotificationCenter.default.addObserver(self, selector: #selector(selectImageNotificationObserver), name: .selectImage, object: nil)
        
//        sesacShowActivityViewController(image: UIImage(systemName: "star")!, url: "hello", text: "hi")

    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        NotificationCenter.default.removeObserver(self, name: NSNotification.Name("SelectImage"), object: nil)
        
    }
    
    @objc func selectImageNotificationObserver(notification: NSNotification) {
        
        print(#function)
        
        if let name = notification.userInfo?["name"] as? String {
            mainView.photoImageView.image = UIImage(systemName: name)
        }
        
    }
    
    @objc func searchButtonClicked() {
        
        let word = ["Apple", "Banana", "Cookie", "Cake", "Sky"]
        
        NotificationCenter.default.post(name: NSNotification.Name("RecommandKeyword"), object: nil, userInfo: ["word": word.randomElement()!])
        
        let alert = UIAlertController(title: "원하시는 기능을 선택하세요!", message: "선택하세요!", preferredStyle: .actionSheet)
        
        let gallery = UIAlertAction(title: "갤러리에서 가져오기", style: .default) { _ in
            // 2. available
            guard UIImagePickerController.isSourceTypeAvailable(.camera) else {
                print("갤러리 사용 불가, 사용자에게 토스트/얼럿")
                return
            }
            
            // 읽는 권한과 쓰는 권한은 다르다고 볼 수 있다.
            // 이미지를 선택하는 읽는 권한은 요청없이 가져올 수 있다.
            self.picker.sourceType = .photoLibrary // .camera
            self.picker.delegate = self
            self.picker.allowsEditing = true
            
    //        let picker = UIColorPickerViewController() //UIFontPickerViewController()
            
            self.picker.modalPresentationStyle = .fullScreen
            self.present(self.picker, animated: true)
        }
        
        let web = UIAlertAction(title: "웹에서 검색하기", style: .default) { _ in
            let vc = SearchViewController()
            vc.delegate = self
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
        let cancel = UIAlertAction(title: "취소", style: .cancel)
        
        alert.addAction(gallery)
        alert.addAction(web)
        alert.addAction(cancel)
        
        present(alert, animated: true)
        
//        navigationController?.pushViewController(SearchViewController(), animated: true)
        
    }
    
    @objc func dateButtonClicked() {
        // Protocol 값 전달 5.
//        let vc = DateViewController()
//        vc.delegate = self
//        navigationController?.pushViewController(vc, animated: true)
        
        let vc = HomeViewController()
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func searchProtocolButtonClicked() {
        let vc = SearchViewController()
        vc.delegate = self
        present(vc, animated: true)
        
    }
    
    @objc func titleButtonClicked() {
        let vc = TitleViewController()
        
        //Closure - 3
        vc.completionHandler = { title, age, push in
            self.mainView.titleButton.setTitle(title, for: .normal)
            print("지금이지롱 completionHandler", age, push)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    @objc func contentButtonClicked() {
        let vc = ContentViewController()
        
        vc.completionHandler = { text in
            self.mainView.contentButton.setTitle(text, for: .normal)
        }
        navigationController?.pushViewController(vc, animated: true)
    }
    
    override func configureView() {
        super.configureView()
        print("Add ConfigureView")
        mainView.searchButton.addTarget(self, action: #selector(searchButtonClicked), for: .touchUpInside)
//        mainView.searchProtocolButton.addTarget(self, action: #selector(searchProtocolButtonClicked), for: .touchUpInside)
        mainView.dateButton.addTarget(self, action: #selector(dateButtonClicked), for: .touchUpInside)
        mainView.titleButton.addTarget(self, action: #selector(titleButtonClicked), for: .touchUpInside)
        mainView.contentButton.addTarget(self, action: #selector(contentButtonClicked), for: .touchUpInside)
        
    }
    
    override func setConstraints() {
        super.setConstraints()
        print("Add SetConstrints")
        
    }
    
}

// Protocol 값 전달 4.
extension AddViewController: PassDataDelegate {
    
    func receiveDate(date: Date) {
        mainView.dateButton.setTitle(DateFormatter.convertDate(date: date), for: .normal)
        
    }
}

// Protocol 값 전달 4.
extension AddViewController: PassImageDataDelegate {
    
    func receiveImageData(url: URL) {
        mainView.photoImageView.kf.setImage(with: url)
        
    }
}

extension AddViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    // 취소 버튼 클릭 시
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        print(#function)
        dismiss(animated: true)
    }
    
    // 사진을 선택하거나 카메라 촬영 직후 호출
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print(#function)
        
        if let image = info[UIImagePickerController.InfoKey.editedImage] as? UIImage {
            self.mainView.photoImageView.image = image
            dismiss(animated: true)
        }
        
    }
}
