//
//  ContentViewController.swift
//  SeSAC3PhotoGram
//
//  Created by 백래훈 on 2023/08/29.
//

import UIKit

class ContentViewController: BaseViewController {

    let textView = {
        let view = UITextView()
        view.backgroundColor = .systemGray4
        return view
    }()
    
    let yellowView = {
        let view = UIView()
        view.backgroundColor = .systemYellow
        return view
    }()
    
    let greenView = {
        let view = UIView()
        view.backgroundColor = .systemGreen
        return view
    }()
    
    var completionHandler: ((String) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    deinit {
        print("deinit", self)
    }
    
    func setAnimation() {
        // 시작
        yellowView.alpha = 0
        greenView.alpha = 0
        // 끝
        UIView.animate(withDuration: 2, delay: 2, options: .curveLinear) {
            self.yellowView.alpha = 1
            self.yellowView.backgroundColor = .blue
        } completion: { bool in
            UIView.animate(withDuration: 2) {
                self.greenView.alpha = 1
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        guard let text = textView.text else { return }
        completionHandler?(text)
    }
    
    override func configureView() {
        super.configureView()
        
        view.addSubview(textView)
        view.addSubview(yellowView)
        view.addSubview(greenView)
        setAnimation()
        
    }
    
    override func setConstraints() {
        textView.snp.makeConstraints {
            $0.top.horizontalEdges.equalTo(view.safeAreaLayoutGuide).inset(10)
            $0.height.equalTo(300)
        }
        
        yellowView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.center.equalTo(view)
        }
        
        greenView.snp.makeConstraints {
            $0.size.equalTo(100)
            $0.centerX.equalToSuperview()
            $0.bottom.equalTo(view.safeAreaLayoutGuide).inset(50)
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 1.0
            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 0.5
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        DispatchQueue.main.async {
            self.greenView.alpha = 0.5
            UIView.animate(withDuration: 0.3) {
                self.greenView.alpha = 1.0
            }
        }
    }

}
