//
//  MainTableViewCell.swift
//  BabyNameSuggestion
//
//  Created by Bayram Yeleç on 24.12.2024.
//

import UIKit

class MainTableViewCell: UITableViewCell {
    
    static let identifier: String = "cell"
    
    private let backView = UIView()
    private let rightButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(){
        contentView.addSubview(backView)
        backView.backgroundColor = .systemGray6
        backView.layer.cornerRadius = 15
        backView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.left.right.equalToSuperview()
        }
        backView.addSubview(rightButton)
        rightButton.setImage(UIImage(systemName: "chevron.right"), for: .normal)
        rightButton.tintColor = .black
        rightButton.titleLabel?.font = .systemFont(ofSize: 20, weight: .black)
        rightButton.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(10)
            make.right.equalToSuperview().inset(20)
        }
    }
    
}
