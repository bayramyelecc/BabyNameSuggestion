//
//  MainVC.swift
//  BabyNameSuggestion
//
//  Created by Bayram Yeleç on 24.12.2024.
//

import UIKit
import SnapKit

class MainVC: UIViewController {
    
    private let titleLabel = UILabel()
    private let addButton = UIButton()
    private let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

// MARK: -- Func

extension MainVC {
    func setup(){
        setupUI()
        setupTableView()
    }
    
    func setupUI(){
        view.backgroundColor = .background
        
        view.addSubview(titleLabel)
        titleLabel.text = "İsimler"
        titleLabel.textColor = .tabItem
        titleLabel.font = .systemFont(ofSize: 30, weight: .bold)
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.left.equalToSuperview().inset(20)
        }
        
        view.addSubview(addButton)
        addButton.setTitle("+", for: .normal)
        addButton.titleLabel?.font = .systemFont(ofSize: 30, weight: .semibold)
        addButton.tintColor = .white
        addButton.backgroundColor = .tabItem
        addButton.layer.cornerRadius = (UIScreen.main.bounds.width)*0.05
        addButton.layer.masksToBounds = true
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.right.equalToSuperview().inset(20)
            make.width.equalTo(view.snp.width).multipliedBy(0.1)
            make.height.equalTo(view.snp.width).multipliedBy(0.1)
        }
        
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
        
    }
    
    func setupTableView(){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
    }
    
}

// MARK: -- Button Func

extension MainVC {
    
    @objc func addButtonTapped(){
        let vc = AddVC()
        let nav = UINavigationController(rootViewController: vc)
        nav.modalPresentationStyle = .formSheet
        nav.modalTransitionStyle = .flipHorizontal
        present(nav, animated: true, completion: nil)
    }
    
}

// MARK: -- TableView Settings

extension MainVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
}
