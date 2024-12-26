//
//  CustomButton.swift
//  BabyNameSuggestion
//
//  Created by Bayram Yeleç on 26.12.2024.
//

import UIKit
import SnapKit

extension UIButton {
    func customButton(title: String, image: UIImage?, width: CGFloat, height: CGFloat) {
        var config = UIButton.Configuration.plain()
        config.image = image
        config.title = title
        config.imagePadding = 10
        config.imagePlacement = .leading
        config.baseForegroundColor = .cell
        config.background.backgroundColor = .tabItem
        config.attributedTitle = AttributedString(
            title,
            attributes: AttributeContainer([.font: UIFont.systemFont(ofSize: 16, weight: .bold)])
        )
        self.configuration = config
        self.layer.cornerRadius = 10
        self.clipsToBounds = true
        self.contentHorizontalAlignment = .leading
        self.snp.makeConstraints { make in
            make.width.equalTo(width)
            make.height.equalTo(height)
        }
    }
}
