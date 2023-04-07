//
//  GetRequestPage.swift
//  NewsAppNew3
//
//  Created by Indira on 3/4/23.
//

import UIKit
import SnapKit
import Kingfisher


class GetRequestPage: UIViewController {

    var timeData: [Product] = []
    
    private lazy var tableView: UITableView = {
        let view = UITableView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        setupConstraints()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "+", style: .plain, target: self, action: #selector(goToNext))
        
    }

    func setupTableView() {
        tableView.register(CustomCell.self, forCellReuseIdentifier: CustomCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        
    }
    
    func setupConstraints() {
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    @objc private func goToNext() {
        navigationController?.pushViewController(PostRequestPage(), animated: true)
    }
}

extension GetRequestPage: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        timeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell else {
                    fatalError("error")
                }
                cell.configure(with: timeData[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        200
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = GetRequestFullPage()
        vc.configure(with: timeData[indexPath.row])
        
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
