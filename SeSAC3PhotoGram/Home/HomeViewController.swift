//
//  HomeViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/31.
//

import UIKit

// AnyObject: 클래스에서만 프로토콜을 정의할 수 있도록 제약
protocol HomeViewProtocol: AnyObject {
    func didSelectItemAt(indexPath: IndexPath)
}

class HomeViewController: BaseViewController {
    
    let mainView = HomeView()
    
    var list: Photo = Photo(total: 0, total_pages: 0, results: [])
    
    deinit {
        print(self, "deinit!!!")
    }
    
    override func loadView() {
        mainView.delegate = self
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print(self, #function)
        
        mainView.collectionView.dataSource = self
        mainView.collectionView.delegate = self
        
        APIService.shared.callRequest(query: "sky") { photo in
            
            guard let photo = photo else {
                print("ALERT ERROR")
                return
            }
            print("API END")
            self.list = photo
            
            self.mainView.collectionView.reloadData()
            
        }
    }
}

extension HomeViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        print(#function)
        
        guard let count = list.results?.count else { return 0 }
        
        return count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        print(#function)
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        cell.imageView.backgroundColor = .systemBlue
        
        guard let thumb = list.results?[indexPath.item].urls.thumb else { return UICollectionViewCell() }
        
        // 링크를 기반으로 이미지를 보여준다? -> 네트워크 통신이다!
        guard let url = URL(string: thumb) else { return UICollectionViewCell() }
        
        DispatchQueue.global().async {
            guard let data = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                cell.imageView.image = UIImage(data: data)
            }
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(#function)
//        delegate?.didSelectItemAt(indexPath: indexPath)
        
    }
}


extension HomeViewController: HomeViewProtocol {
    
    func didSelectItemAt(indexPath: IndexPath) {
        print(indexPath)
        navigationController?.popViewController(animated: true)
    }
    
}

