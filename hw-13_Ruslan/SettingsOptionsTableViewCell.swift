//
//  SettingsOptionsTableViewCell.swift
//  hw-13_Ruslan
//
//  Created by Ruslan Medetbayev on 01.07.2023.
//

import UIKit

class SettingsOptionsTableViewCell: UITableViewCell {
    
    public func configure(with model: SettingsOption) {
        
        label.text = model.title
        iconImageView.image = model.icon
        label2.text = model.rightLabel
        iconImageView.backgroundColor = model.iconBackgroundColor
    }
    
    private lazy var iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.tintColor = .white
        imageView.contentMode = .center
        return imageView
    }()

    private lazy var label: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var label2: UILabel = {
        let label2 = UILabel()
        return label2
    }()

    private lazy var uiSwitch: UISwitch = {
        let uiSwitch = UISwitch(frame: .zero)
        return uiSwitch
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupViews()
        setupConstraints()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func setupViews() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
        contentView.addSubview(label2)
        
    }

    private func setupConstraints() {
        iconImageView.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalToSuperview().offset(18)
            make.height.equalTo(33)
            make.width.equalTo(30)
        }
        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        
        label2.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalTo(contentView.snp.trailing).offset(-16)
        }
        
        
    }
    
    

}
