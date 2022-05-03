//
//  SettingsTableSections.swift
//  SetitngsUiKit
//
//  Created by SNZ on 03.05.2022.
//

import UIKit

//MARK: - Models

struct Sections {
    let title: String
    let options: [SettingsOptionsType]
}

enum SettingsOptionsType {
    case staticCell(model: SettingsOptions)
    case switchCell(model: SettingsSwitchOptions)
}

struct SettingsSwitchOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
    var isOn: Bool
}

struct SettingsOptions {
    let title: String
    let icon: UIImage?
    let iconBackgroundColor: UIColor
    let handler: (() -> Void)
}

//MARK: - Extension

extension Sections {
    static func getSections() -> [Sections] {
        return [
            // Первая секция
            Sections(title: "", options: [
                .switchCell(model: SettingsSwitchOptions(title: "Авиарежим", icon: UIImage(systemName: "airplane"), iconBackgroundColor: .systemOrange, handler: {
                    print("Нажата ячейка Авиарежим")
                }, isOn: false)),
                .staticCell(model: SettingsOptions(title: "Wi-Fi", icon: UIImage(systemName: "wifi"), iconBackgroundColor: .link) {
                    print("Нажата ячейка Wi-Fi")
                }),
                .staticCell(model: SettingsOptions(title: "Bluetooth", icon: UIImage(systemName: "bonjour"), iconBackgroundColor: .systemBlue, handler: {
                    print("Нажата ячейка Bluetooth")
                })),
                .staticCell(model: SettingsOptions(title: "Сотовая связь", icon: UIImage(systemName: "antenna.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Сотовая связь")
                }),
                .staticCell(model: SettingsOptions(title: "Режим модема", icon: UIImage(systemName: "dot.radiowaves.left.and.right"), iconBackgroundColor: .systemGreen) {
                    print("Нажата ячейка Режим модема")
                }),
                .switchCell(model: SettingsSwitchOptions(title: "VPN", icon: UIImage(systemName: "network.badge.shield.half.filled"), iconBackgroundColor: .systemBlue, handler: {
                    print("Нажата ячейка VPN")
                }, isOn: true)),
            ]),
            
            // Вторая секция
            Sections(title: "", options: [
                .staticCell(model: SettingsOptions(title: "Уведомления", icon: UIImage(systemName: "bell.badge.fill"), iconBackgroundColor: .systemRed) {
                    print("Нажата ячейка Уведомления")
                }),
                .staticCell(model: SettingsOptions(title: "Звуки, тактильные сигналы", icon: UIImage(systemName: "speaker.wave.3.fill"), iconBackgroundColor: .systemPink) {
                    print("Нажата ячейка Звуки, тактильные сигналы")
                }),
                .staticCell(model: SettingsOptions(title: "Не беспокоить", icon: UIImage(systemName: "moon.fill"), iconBackgroundColor: .systemPurple) {
                    print("Нажата ячейка Не беспокоить")
                }),
                .staticCell(model: SettingsOptions(title: "Экранное время", icon: UIImage(systemName: "hourglass"), iconBackgroundColor: .systemPurple) {
                    print("Нажата ячейка Экранное время")
                })
            ]),
            
            // Третья секция
            Sections(title: "", options: [
                .staticCell(model: SettingsOptions(title: "Основные", icon: UIImage(systemName: "gear"), iconBackgroundColor: .systemGray) {
                    print("Нажата ячейка Основные")
                }),
                .staticCell(model: SettingsOptions(title: "Пункт управления", icon: UIImage(systemName: "switch.2"), iconBackgroundColor: .systemGray) {
                    print("Нажата ячейка Пункт управления")
                }),
                .staticCell(model: SettingsOptions(title: "Экран и яркость", icon: UIImage(systemName: "textformat.size"), iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Экран и яркость")
                }),
                .staticCell(model: SettingsOptions(title: "Экран \"Домой\"", icon: UIImage(systemName: "homekit"), iconBackgroundColor: .link) {
                    print("Нажата ячейка Экран \"Домой\"")
                }),
                .staticCell(model: SettingsOptions(title: "Универсальный доступ", icon: UIImage(systemName: "figure.roll"), iconBackgroundColor: .systemBlue) {
                    print("Нажата ячейка Универсальный доступ")
                })
            ])
        ]
    }
}

