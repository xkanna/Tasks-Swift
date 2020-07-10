//
//  FifthTableViewCell.swift
//  Tasks
//
//  Created by Katarina Veljkovic on 08/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit

class FifthTableViewCell: UITableViewCell {

    let label = UILabel()
    let uiSwitch = UISwitch()
       
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
    super.init(style: style, reuseIdentifier: reuseIdentifier)
         setupUI()
    }
       
    required init?(coder: NSCoder) {
           fatalError("init(coder:) has not been implemented")
    }
    func setupUI(){
        let stack = UIStackView()
        contentView.addSubview(stack)
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 20).isActive = true
        stack.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20).isActive = true
        stack.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -20).isActive = true
        stack.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20).isActive = true
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fill
        stack.spacing = 10

        stack.addArrangedSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false

        stack.addArrangedSubview(uiSwitch)
        uiSwitch.translatesAutoresizingMaskIntoConstraints = false
        //uiSwitch.isEnabled = false;
        
        
        
    }
}
