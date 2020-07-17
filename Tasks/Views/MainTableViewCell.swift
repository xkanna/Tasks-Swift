//
//  MainTableViewCell.swift
//  Tasks
//
//  Created by Katarina Veljkovic on 10/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit

class MainTableViewCell: UITableViewCell {

    let label = UILabel()
    let view = UIView()
       
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
        label.textColor = .black
        label.text = "jajja"
        
        stack.addArrangedSubview(view)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.widthAnchor.constraint(equalToConstant: 10).isActive = true
        //view.heightAnchor.constraint(equalToConstant: 10).isActive = true
        
        
        
    }

}
