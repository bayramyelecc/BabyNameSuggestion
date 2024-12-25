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
    let nameLabel = UILabel()
    let meaningLabel = UILabel()
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
        backView.backgroundColor = .cell
        backView.layer.cornerRadius = 15
        backView.snp.makeConstraints { make in
            make.top.bottom.equalToSuperview().inset(5)
            make.left.right.equalToSuperview()
        }
        backView.addSubview(nameLabel)
        nameLabel.textColor = .tabItem
        nameLabel.font = UIFont(name: "Helvetica-Bold", size: 25)
        nameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(10)
            make.left.equalToSuperview().inset(20)
        }
        
        backView.addSubview(meaningLabel)
        meaningLabel.textColor = .black
        meaningLabel.font = UIFont(name: "Avenir", size: 20)
        meaningLabel.numberOfLines = 0
        meaningLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(5)
            make.left.right.equalToSuperview().inset(20)
            make.bottom.equalToSuperview().inset(10)
        }
    }
    
}
