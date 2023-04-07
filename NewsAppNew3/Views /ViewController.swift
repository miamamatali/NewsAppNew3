//
//  ViewController.swift
//  NewsAppNew3
//
//  Created by Indira on 3/4/23.
//

import UIKit
import SnapKit
import Kingfisher

class ViewController: UIViewController {
    
    private lazy var getRequest: UIButton = {
        let get = UIButton(type: .system)
        get.setTitle("Get", for: .normal)
        get.backgroundColor = .systemPink
        get.setTitleColor(.white, for: .normal)
        get.layer.cornerRadius = 10
        get.addTarget(self, action: #selector(getRequest(sender:)), for: .touchUpInside)
        
        return get
    }()
    
    private lazy var postRequest: UIButton = {
        let post = UIButton(type: .system)
        post.setTitle("Post", for: .normal)
        post.backgroundColor = .systemPink
        post.setTitleColor(.white, for: .normal)
        post.layer.cornerRadius = 10
        post.addTarget(self, action: #selector(postRequest(sender:)), for: .touchUpInside)
        
        return post
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(getRequest)
        view.addSubview(postRequest)
        
        getRequest.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(200)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        postRequest.snp.makeConstraints {make in
            make.top.equalTo(getRequest.snp.bottom).offset(50)
            make.leading.trailing.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        
    }
    @objc private func getRequest(sender: UIButton) {
        APIManager.shared.getData { [weak self] result in
            switch result {
            case .success(let data):
                
                DispatchQueue.main.async {
                    let vc = GetRequestPage()
                    vc.timeData = data.products ?? []
                    self?.navigationController?.pushViewController(vc, animated: true)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    @objc private func postRequest(sender: UIButton) {
        navigationController?.pushViewController(PostRequestPage(), animated: true)
    }
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        present(alert, animated: true)
    }

}

