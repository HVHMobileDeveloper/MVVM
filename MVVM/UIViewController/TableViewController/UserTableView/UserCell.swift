//
//  UserCell.swift
//  MVVM
//
//  Created by mobileteam on 2/18/20.
//  Copyright © 2020 mobileteam. All rights reserved.
//

import Foundation
import UIKit

class UserCell: UITableViewCell {
    var mainView = UIStackView()
    var label = UILabel()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupMainView()
        layoutIfNeeded()
    }

    private func setupMainView() {
        self.addSubview(mainView)
        mainView.snp.makeConstraints { (make) in
            make.height.equalTo(30)
            make.width.equalTo(UIScreen.main.bounds.width)
        }
        self.mainView.addArrangedSubview(label)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
