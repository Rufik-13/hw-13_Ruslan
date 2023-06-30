//
//  ViewController.swift
//  hw-13_Ruslan
//
//  Created by Ruslan Medetbayev on 30.06.2023.
//

import UIKit
import SnapKit

struct Section {
    let options: [SettingsOptionType]
}

enum SettingsOptionType {
    case standartCell(model: SettingsOption)
    case switchCell(model: SettingsSwitchOption)
}

struct SettingsSwitchOption {
    let title: String
    let icon: UIImage?
    var isOn: Bool
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let rightLabel: String?
    
}



class ViewController: UIViewController {
    
//    private var names = ["John", "Dima", "Nikita", "Alexey", "Sonya", "Anna", "Elena", "Alexander", "Ivan", "Petr", "Ilya"]
    
    private var model = [Section]()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.dataSource = self
        
        return tableView
    }()

    
    private func setupCells() {
        model.append(Section(options: [.switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), isOn: true))]))
        
        model.append(Section(options: [.standartCell(model: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "bell.circle.fill"), rightLabel: nil))]))
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupCells()
        setupViews()
        setupConstraints()
        
    }
    
    
    func setupViews() {
        view.backgroundColor = .white
        title = "Настройки"
        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
}




extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        model.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = model[indexPath.section].options[indexPath.row]
        return cell
    }
    
   
}
