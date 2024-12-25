//
//  AddVC.swift
//  BabyNameSuggestion
//
//  Created by Bayram Yeleç on 25.12.2024.
//

import UIKit

class AddVC: UIViewController {
    
    private let genderLabel = UILabel()
    private let genderSegmentedController = UISegmentedControl(items: ["Erkek", "Kadın", "Unisex"])
    private let popularityLabel = UILabel()
    private let popularitySegmentedController = UISegmentedControl(items: ["Yaygın", "Nadir", "Farketmez"])
    private let categoryLabel = UILabel()
    private let categorySegmentedController = UISegmentedControl(items: ["Modern", "Mitoloji", "Doğa", "Tarih", "Osmanlı"])
    private let harmonyLabel = UILabel()
    private let descHarmonyLabel = UILabel()
    private let harmonyTextField = UITextField()
    private let addButton = UIButton()
    
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    
    var viewModel = MainViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        let tap = UITapGestureRecognizer(target: self, action: #selector(closekeyboard))
        view.addGestureRecognizer(tap)
    }
    
    @objc func closekeyboard() {
        view.endEditing(true)
    }
    
}

// MARK: -- Func

extension AddVC {
    func setup() {
        setupNavigationController()
        setupUI()
    }
    
    func setupUI() {
        view.backgroundColor = .background
        
        view.addSubview(genderLabel)
        genderLabel.text = "Cinsiyet"
        genderLabel.textColor = .tabItem
        genderLabel.textAlignment = .center
        genderLabel.font = .systemFont(ofSize: 25, weight: .black)
        genderLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide).inset(10)
            make.left.equalToSuperview().inset(30)
        }
        
        view.addSubview(genderSegmentedController)
        genderSegmentedController.selectedSegmentIndex = 2
        genderSegmentedController.backgroundColor = .background
        genderSegmentedController.selectedSegmentTintColor = .tabItem
        genderSegmentedController.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        genderSegmentedController.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        genderSegmentedController.snp.makeConstraints { make in
            make.top.equalTo(genderLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(popularityLabel)
        popularityLabel.text = "Popülerlik"
        popularityLabel.textColor = .tabItem
        popularityLabel.textAlignment = .center
        popularityLabel.font = .systemFont(ofSize: 25, weight: .black)
        popularityLabel.snp.makeConstraints { make in
            make.top.equalTo(genderSegmentedController.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(30)
        }
        
        view.addSubview(popularitySegmentedController)
        popularitySegmentedController.selectedSegmentIndex = 1
        popularitySegmentedController.backgroundColor = .background
        popularitySegmentedController.selectedSegmentTintColor = .tabItem
        popularitySegmentedController.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        popularitySegmentedController.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        popularitySegmentedController.snp.makeConstraints { make in
            make.top.equalTo(popularityLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(categoryLabel)
        categoryLabel.text = "Kategori"
        categoryLabel.textColor = .tabItem
        categoryLabel.textAlignment = .center
        categoryLabel.font = .systemFont(ofSize: 25, weight: .black)
        categoryLabel.snp.makeConstraints { make in
            make.top.equalTo(popularitySegmentedController.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(30)
        }
        
        view.addSubview(categorySegmentedController)
        categorySegmentedController.selectedSegmentIndex = 0
        categorySegmentedController.backgroundColor = .background
        categorySegmentedController.selectedSegmentTintColor = .tabItem
        categorySegmentedController.setTitleTextAttributes([.foregroundColor: UIColor.white], for: .selected)
        categorySegmentedController.setTitleTextAttributes([.foregroundColor: UIColor.black], for: .normal)
        categorySegmentedController.snp.makeConstraints { make in
            make.top.equalTo(categoryLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(harmonyLabel)
        harmonyLabel.text = "Uyum"
        harmonyLabel.textColor = .tabItem
        harmonyLabel.textAlignment = .center
        harmonyLabel.font = .systemFont(ofSize: 25, weight: .black)
        harmonyLabel.snp.makeConstraints { make in
            make.top.equalTo(categorySegmentedController.snp.bottom).offset(20)
            make.left.equalToSuperview().inset(30)
        }
        
        view.addSubview(descHarmonyLabel)
        descHarmonyLabel.text = "(Soyadınız ile uyumu)"
        descHarmonyLabel.textColor = .tabItem
        descHarmonyLabel.textAlignment = .center
        descHarmonyLabel.font = .systemFont(ofSize: 15, weight: .bold)
        descHarmonyLabel.snp.makeConstraints { make in
            make.top.equalTo(harmonyLabel.snp.bottom).offset(5)
            make.left.equalToSuperview().inset(30)
        }
        
        view.addSubview(harmonyTextField)
        let placeholder = "Enter text"
        let placeholderColor = UIColor.gray
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: placeholderColor
        ]
        
        harmonyTextField.attributedPlaceholder = NSAttributedString(string: placeholder, attributes: attributes)
        harmonyTextField.font = .systemFont(ofSize: 15, weight: .bold)
        harmonyTextField.backgroundColor = .textField
        harmonyTextField.borderStyle = .roundedRect
        harmonyTextField.layer.borderWidth = 1
        harmonyTextField.layer.borderColor = UIColor.lightGray.cgColor
        harmonyTextField.layer.cornerRadius = 10
        harmonyTextField.layer.masksToBounds = true
        
        harmonyTextField.snp.makeConstraints { make in
            make.top.equalTo(descHarmonyLabel.snp.bottom).offset(15)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
        
        view.addSubview(addButton)
        addButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .bold)
        addButton.setTitleColor(.white, for: .normal)
        addButton.setTitle("Listele", for: .normal)
        addButton.backgroundColor = .tabItem
        addButton.layer.cornerRadius = 15
        addButton.layer.masksToBounds = true
        addButton.addTarget(self, action: #selector(addButtonTapped), for: .touchUpInside)
        addButton.snp.makeConstraints { make in
            make.top.equalTo(harmonyTextField.snp.bottom).offset(20)
            make.centerX.equalToSuperview()
            make.width.equalTo(view.snp.width).multipliedBy(0.4)
            make.height.equalTo(view.snp.width).multipliedBy(0.15)
        }
        
        view.addSubview(activityIndicator)
        activityIndicator.color = .black
        activityIndicator.center = view.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.snp.makeConstraints { make in
            make.height.equalTo(view.snp.height).multipliedBy(0.3)
            make.width.equalTo(view.snp.height).multipliedBy(0.3)
            make.center.equalToSuperview()
        }
        
    }
    
    func setupNavigationController(){
        let title = UILabel()
        title.text = "Özellikler"
        title.textColor = .tabItem
        title.textAlignment = .center
        title.font = .systemFont(ofSize: 30, weight: .black)
        navigationItem.titleView = title
    }
    
    // MARK: -- Button Func
    
    @objc func addButtonTapped() {
        fetchNamesCompleted()
    }
    
    func fetchNamesCompleted() {
        activityIndicator.startAnimating()
        activityIndicator.isHidden = false
        DispatchQueue.global().async {
            Task {
                await self.addButtonTappedAsync()
                DispatchQueue.main.async {
                    self.activityIndicator.stopAnimating()
                    self.activityIndicator.isHidden = true
                }
            }
        }
    }
    
    func addButtonTappedAsync() async {
        guard let gender = genderSegmentedController.titleForSegment(at: genderSegmentedController.selectedSegmentIndex),
              let popularity = popularitySegmentedController.titleForSegment(at: popularitySegmentedController.selectedSegmentIndex),
              let category = categorySegmentedController.titleForSegment(at: categorySegmentedController.selectedSegmentIndex),
              let harmony = harmonyTextField.text, !harmony.isEmpty else {
            let alert = UIAlertController(title: "Uyarı", message: "Soyadı Boş Bırakılamaz", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Tamam", style: .default, handler: nil))
            present(alert, animated: true, completion: nil)
            return
        }
        await viewModel.fetchNames(gender: gender, popularity: popularity, category: category, harmony: harmony)
        dismiss(animated: true, completion: nil)
    }
    
}

