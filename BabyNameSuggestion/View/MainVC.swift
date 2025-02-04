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
    private let backView = UIImageView()
    
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        self.viewModel = GenerativeService.shared.viewModel
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        closures()
    }
    
    func closures() {
        viewModel.reloadNames = { [weak self] in
            DispatchQueue.main.async {
                guard let self = self else { return }
                if self.viewModel.names.isEmpty {
                    self.tableView.isHidden = true
                    self.backView.isHidden = false
                } else {
                    self.tableView.isHidden = false
                    self.backView.isHidden = true
                }
                self.tableView.reloadData()
            }
        }
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
        titleLabel.font = .systemFont(ofSize: 30, weight: .black)
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
        
        view.addSubview(backView)
        backView.isHidden = false
        backView.image = UIImage(named: "backView")
        backView.contentMode = .scaleAspectFit
        backView.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalTo(view.safeAreaLayoutGuide)
        }
        
    }
    
    func setupTableView(){
        tableView.isHidden = true
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: MainTableViewCell.identifier)
        tableView.separatorStyle = .none
        tableView.showsVerticalScrollIndicator = false
        tableView.backgroundColor = .background
        view.addSubview(tableView)
        tableView.snp.makeConstraints { make in
            make.top.equalTo(addButton.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(10)
            make.bottom.equalTo(self.view.safeAreaLayoutGuide.snp.bottom)
        }
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
        return viewModel.names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: MainTableViewCell.identifier, for: indexPath) as! MainTableViewCell
        cell.selectionStyle = .none
        cell.backgroundColor = .clear
        let names = viewModel.names[indexPath.row].name
        cell.nameLabel.text = names
        let meanings = viewModel.meanings[indexPath.row].name
        cell.meaningLabel.text = meanings
        return cell
    }
    
}
