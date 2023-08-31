//
//  SearchViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/28.
//

import UIKit
import Kingfisher

class SearchViewController: BaseViewController {
    
    let mainView = SearchView()
    
    // Protocol 값 전달 2.
    var delegate: PassImageDataDelegate?
    
    var unsplashList: Unsplash?
    
    let imageList = ["pencil", "star", "person", "star.fill", "xmark", "person.circle"]
    
    deinit {
        print(self, "Deinit!!")
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // addObserver보다 post가 먼저 신호를 보내면 addObserver가 신호를 받지 못한다!
        NotificationCenter.default.addObserver(self, selector: #selector(recommandKeywordNotificationObserver), name: NSNotification.Name("RecommandKeyword"), object: nil)
        
        mainView.searchBar.becomeFirstResponder()
        mainView.searchBar.delegate = self
        
    }
    
    func callRequestSearchPhotoAPI(searchType: SearchType, word: String) {
        UnsplashAPIManager.shared.requestSearchPhotoAPI(searchType: searchType, word: word) { result in
            
            self.unsplashList = result
            self.mainView.collectionView.reloadData()
        }
    }
    
    @objc func recommandKeywordNotificationObserver(notification: NSNotification) {
        print("recommandKeywordNotificationObserver")
    }
    
    override func configureView() {
        super.configureView()
        
        mainView.collectionView.delegate = self
        mainView.collectionView.dataSource = self
        
    }
    
}

extension SearchViewController: UISearchBarDelegate {
 
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        mainView.searchBar.resignFirstResponder()
        
        guard let text = searchBar.text else { return }
        self.callRequestSearchPhotoAPI(searchType: .photos, word: text)
        
    }
    
}

extension SearchViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        guard let count = unsplashList?.results.count else { return 0 }
        return count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "SearchCollectionViewCell", for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
        
        guard let imageString = unsplashList?.results[indexPath.row].urls.full else { return  UICollectionViewCell() }
        let imageURL = URL(string: imageString)
        
        cell.imageView.kf.setImage(with: imageURL)
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let imageString = unsplashList?.results[indexPath.row].urls.full else { return }
        guard let imageURL = URL(string: imageString) else { return }
        
        // Protocol 값 전달 3.
        delegate?.receiveImageData(url: imageURL)
        
//        NotificationCenter.default.post(name: NSNotification.Name("SelectImage"), object: nil, userInfo: ["name": imageList[indexPath.item], "sample": "고래밥"])
        
        navigationController?.popViewController(animated: true)
    }
    
}
