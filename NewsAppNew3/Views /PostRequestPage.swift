//
//  PostRequestPage.swift
//  NewsAppNew3
//
//  Created by Indira on 3/4/23.
//

import UIKit

class PostRequestPage: UIViewController {
    
    private lazy var textField1: UITextField = {
        let textf = UITextField()
        textf.placeholder = "\tID"
        textf.layer.cornerRadius = 12
        textf.layer.backgroundColor = UIColor.white.cgColor
        
        return textf
    }()
    private lazy var textField2: UITextField = {
        let textf = UITextField()
        textf.placeholder = "\tdescription"
        textf.layer.cornerRadius = 12
        textf.layer.backgroundColor = UIColor.white.cgColor
        
        return textf
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
        view.backgroundColor = .gray
        
        view.addSubview(textField1)
        textField1.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(500)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        view.addSubview(textField2)
        textField2.snp.makeConstraints { make in
            make.top.equalTo(textField1.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        view.addSubview(postRequest)
        postRequest.snp.makeConstraints { make in
            make.top.equalTo(textField2.snp.bottom).offset(30)
            make.left.right.equalToSuperview().inset(30)
            make.height.equalTo(40)
        }
        
        
    }
    @objc private func postRequest(sender: UIButton) {
        APIManager.shared.postRequest(id: Int(textField1.text!)!, title: textField2.text!) { result in
            switch result {
        case .success(let data):
            
            DispatchQueue.main.async {
                self.showAlert(with: "Success", message: "\(data)")
            }
        case .failure(let error):
            break
        }
        }
    }
    private func showAlert(with title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(.init(title: "Ok", style: .default))
        present(alert, animated: true)
    }
}
