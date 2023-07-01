//
//  TableViewCell.swift
//  hw-13_Ruslan
//
//  Created by Ruslan Medetbayev on 01.07.2023.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    // MARK: - Outlet
    
    var settingModel: SettingsOption? {
        didSet {
            label.text = settingModel?.title
            iconImageView.image = settingModel?.icon
            iconImageView.backgroundColor = settingModel?.iconBackgroundColor
        }
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

//    private lazy var uiSwitch: UISwitch = {
//        let uiSwitch = UISwitch(frame: .zero)
//        return uiSwitch
//    }()
    
    
    
    // MARK: - Initializers
    
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
    // MARK: - Setup
    
    private func setupHierarchy() {
        contentView.addSubview(iconImageView)
        contentView.addSubview(label)
//        contentView.addSubview(uiSwitch)
        
    }

    private func setupLayout() {
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
//        uiSwitch.snp.makeConstraints { make in
//            make.centerY.equalToSuperview()
//            make.trailing.equalToSuperview().offset(-10)
//        }
        
    }
  
}
