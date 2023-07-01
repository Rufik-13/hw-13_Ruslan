//
//  SettingsSwitchTableViewCell.swift
//  hw-13_Ruslan
//
//  Created by Ruslan Medetbayev on 01.07.2023.
//

import UIKit

class SettingsSwitchTableViewCell: UITableViewCell {
    
    
    
    public func configure(with model: SettingsSwitchOption) {
        label.text = model.title
        iconImageView.image = model.icon
//        label.text = model.rightLabel
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
        contentView.addSubview(label)
        contentView.addSubview(uiSwitch)
    }

    private func setupConstraints() {

        label.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.leading.equalTo(iconImageView.snp.trailing).offset(16)
        }
        uiSwitch.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.trailing.equalToSuperview().offset(-10)
        }
    }

}
