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
    let iconBackgroundColor: UIColor
}

struct SettingsOption {
    let title: String
    let icon: UIImage?
    let rightLabel: String?
    let iconBackgroundColor: UIColor
    
}


class ViewController: UIViewController {
    

    
    private var model = [Section]()
    let spacing: CGFloat = 60.0
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
//        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        tableView.register(SettingsSwitchTableViewCell.self, forCellReuseIdentifier: "swichcell")
        tableView.register(SettingsOptionsTableViewCell.self, forCellReuseIdentifier: "optioncell")
        tableView.dataSource = self
        tableView.delegate = self
        
        return tableView
    }()

    
    private func setupCells() {
        model.append(Section(options: [.switchCell(model: SettingsSwitchOption(title: "Авиарежим", icon: UIImage(systemName: "airplane"), isOn: true, iconBackgroundColor: .systemOrange)),
                                       .standartCell(model: SettingsOption(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), rightLabel: "Не подключено", iconBackgroundColor: .systemBlue)),
                                       .standartCell(model: SettingsOption(title: "Bluetooth", icon: UIImage(systemName: "pawprint"), rightLabel: "Вкл.", iconBackgroundColor: .systemBlue)),
                                       .standartCell(model: SettingsOption(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), rightLabel: nil, iconBackgroundColor: .systemGreen)),
                                       .standartCell(model: SettingsOption(title: "Режим модема", icon: UIImage(systemName: "personalhotspot"), rightLabel: nil, iconBackgroundColor: .systemBlue)),
                                       .switchCell(model: SettingsSwitchOption(title: "VPN", icon: UIImage(systemName: "globe"), isOn: true, iconBackgroundColor: .systemBlue))]))
        
        model.append(Section(options: [.standartCell(model: SettingsOption(title: "Уведомления", icon: UIImage(systemName: "bell.fill"), rightLabel: nil, iconBackgroundColor: .red)),
                                       .standartCell(model: SettingsOption(title: "Звуки, тактильные сигнали", icon: UIImage(systemName: "speaker.wave.2.circle.fill"), rightLabel: nil, iconBackgroundColor: .systemPink)),
                                       .standartCell(model: SettingsOption(title: "Не беспокоить", icon: UIImage(systemName: "moon.circle.fill"), rightLabel: nil, iconBackgroundColor: .systemPurple)),
                                       .standartCell(model: SettingsOption(title: "Экранное время", icon: UIImage(systemName: "hourglass.circle.fill"), rightLabel: nil, iconBackgroundColor: .systemPink))]))
        model.append(Section(options: [.standartCell(model: SettingsOption(title: "Основные", icon: UIImage(systemName: "gear"), rightLabel: nil, iconBackgroundColor: .lightGray)),
                                       .standartCell(model: SettingsOption(title: "Пункт управления", icon: UIImage(systemName: "list.bullet.circle.fill"), rightLabel: nil, iconBackgroundColor: .lightGray)),
                                       .standartCell(model: SettingsOption(title: "Экран и яркость", icon: UIImage(systemName: "a.circle.fill"), rightLabel: nil, iconBackgroundColor: .systemBlue)),
                                       .standartCell(model: SettingsOption(title: "Экран «Домой»", icon: UIImage(systemName: "circle.grid.3x3.circle.fill"), rightLabel: nil, iconBackgroundColor: .blue)),
                                       .standartCell(model: SettingsOption(title: "Универсальный доступ", icon: UIImage(systemName: "person.crop.circle.fill"), rightLabel: nil, iconBackgroundColor: .systemBlue))]))
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


extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model[section].options.count
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.count
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        let models = model[indexPath.section].options[indexPath.row]
        print(models)
        

        switch models.self {
        case .standartCell(let models):
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "optioncell",for: indexPath) as? SettingsOptionsTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: models)
            cell.accessoryType = .disclosureIndicator
            return cell
        

        case .switchCell(let models):

            guard let cell = tableView.dequeueReusableCell(withIdentifier: "swichcell",for: indexPath) as? SettingsSwitchTableViewCell else {
                return UITableViewCell()
            }
            cell.configure(with: models)
            return cell
            
            
        }


    }
    
    

}
