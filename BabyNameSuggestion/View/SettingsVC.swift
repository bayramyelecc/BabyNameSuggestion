//
//  SettingsVC.swift
//  BabyNameSuggestion
//
//  Created by Bayram Yeleç on 24.12.2024.
//

import UIKit
import SnapKit

class SettingsVC: UIViewController {
    
    private let stackView = UIStackView()
    private let linkedinButton = UIButton()
    private let githubButton = UIButton()
    private let twitterButton = UIButton()
    private let instagramButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
}

extension SettingsVC {
    func setup(){
        setupUI()
    }
    
    func setupUI(){
        view.addSubview(stackView)
        stackView.axis = .vertical
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        stackView.snp.makeConstraints { make in
            make.center.equalToSuperview()
        }
        
        let linkedinImage = UIImage(named: "linkedin")?.resizedImage(targetSize: CGSize(width: 25, height: 25))
        stackView.addArrangedSubview(linkedinButton)
        linkedinButton.customButton(title: "LinkedIn", image: linkedinImage, width: view.frame.width / 1.2, height: 50)
        linkedinButton.addTarget(self, action: #selector(linkedinButtonTapped), for: .touchUpInside)
        
        let githubImage = UIImage(named: "github")?.resizedImage(targetSize: CGSize(width: 25, height: 25))
        stackView.addArrangedSubview(githubButton)
        githubButton.customButton(title: "Github", image: githubImage, width: view.frame.width / 1.2, height: 50)
        githubButton.addTarget(self, action: #selector(githubButtonTapped), for: .touchUpInside)
        
        let twitterImage = UIImage(named: "twitter")?.resizedImage(targetSize: CGSize(width: 25, height: 25))
        stackView.addArrangedSubview(twitterButton)
        twitterButton.customButton(title: "X", image: twitterImage, width: view.frame.width / 1.2, height: 50)
        twitterButton.addTarget(self, action: #selector(twitterButtonTapped), for: .touchUpInside)
        
        let instagramImage = UIImage(named: "instagram")?.resizedImage(targetSize: CGSize(width: 25, height: 25))
        stackView.addArrangedSubview(instagramButton)
        instagramButton.customButton(title: "Instagram", image: instagramImage, width: view.frame.width / 1.2, height: 50)
        instagramButton.addTarget(self, action: #selector(instagramButtonTapped), for: .touchUpInside)
    }
}

extension SettingsVC {
    
    @objc func linkedinButtonTapped(){
        guard let url = URL(string: "https://www.linkedin.com/in/bayramyelec") else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func githubButtonTapped(){
        guard let url = URL(string: "https://github.com/bayramyelecc") else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func twitterButtonTapped(){
        guard let url = URL(string: "https://x.com/bayramyelec0") else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
    @objc func instagramButtonTapped(){
        guard let url = URL(string: "https://www.instagram.com/bayramyelecc") else {return}
        if UIApplication.shared.canOpenURL(url) {
            UIApplication.shared.open(url)
        }
    }
    
}

extension UIImage {
    func resizedImage(targetSize: CGSize) -> UIImage {
        let renderer = UIGraphicsImageRenderer(size: targetSize)
        return renderer.image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }
}
