//
//  SettingsTableViewCell.swift
//  SetitngsUiKit
//
//  Created by SNZ on 03.05.2022.
//

import UIKit

class SettingsTableViewCell: UITableViewCell {

    //MARK: - Containers

    static let identifier = Strings.identifierText

    private let iconContainer: UIView = {
        let view = UIView()
        view.clipsToBounds = true
        view.layer.masksToBounds = true
        view.layer.cornerRadius = Metric.size8

        return view
    }()

    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFill

        return imageView
    }()

    private let label: UILabel = {
        let label = UILabel()
        label.numberOfLines = Metric.size1

        return label
    }()

    let additionalLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .right
        label.text = ""
        label.textColor = .gray
        label.numberOfLines = Metric.size1
        return label
    }()

    private lazy var numLabel: UILabel = {

        let numLabel = UILabel()
        numLabel.text = "1"
        numLabel.font = .systemFont(ofSize: 20)
        numLabel.textAlignment = .center
        numLabel.textColor = .white
        numLabel.backgroundColor = .red
        numLabel.layer.masksToBounds = true
        numLabel.layer.cornerRadius = 10
        numLabel.adjustsFontSizeToFitWidth = true

        return numLabel
    }()

    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        additionalLabel.text = ""
    }

    private func setupDisplay(with model: SettingsOptions) {
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator

        let size: CGFloat = contentView.frame.size.height - Metric.size15
        iconContainer.frame = CGRect(x: Metric.size15, y: Metric.size6, width: size, height: size)

        let imageSize: CGFloat = size / Metric.size1_6
        iconImageView.frame = CGRect(x: (size - imageSize) / Metric.size2,
                                     y: (size - imageSize) / Metric.size2,
                                     width: imageSize,
                                     height: imageSize)

        label.frame = CGRect(x: Metric.size25 + iconContainer.frame.size.width,
                             y: Metric.size0,
                             width: contentView.frame.size.width - Metric.size25 - iconContainer.frame.size.width,
                             height: contentView.frame.size.height)

        if model.title == "Wi-Fi" || model.title == "Bluetooth" {
            contentView.addSubview(additionalLabel)

            additionalLabel.frame = CGRect(x: (contentView.frame.size.width - contentView.frame.size.width / Metric.size1_9),
                                           y: (contentView.frame.size.height / Metric.size7),
                                           width: contentView.frame.size.width / Metric.size2,
                                           height: iconContainer.frame.size.height)

        }
        if model.title == "Основные" {
            contentView.addSubview(numLabel)
            numLabel.frame = CGRect(x: (contentView.frame.size.width - contentView.frame.size.width * 0.1),
                                    y: (contentView.frame.size.height / 4),
                                    width: 21,
                                    height: 21)
        }
    }

    //MARK: - Create methods

    public func configure(with model: SettingsOptions) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        setupDisplay(with: model)

        switch label.text {
        case "Wi-Fi":
            additionalLabel.text = Strings.wifiText
        case "Bluetooth":
            additionalLabel.text = Strings.bluetoothText
        default:
            break
        }
    }
}

//MARK: - Constants

extension SettingsTableViewCell {
    
    //Размеры
    enum Metric {
        static let size0: CGFloat = 0
        static let size1 = 1
        static let size1_6: CGFloat = 1.6
        static let size1_9: CGFloat = 1.9
        static let size2: CGFloat = 2
        static let size6: CGFloat = 6
        static let size7: CGFloat = 7
        static let size8: CGFloat = 8
        static let size15: CGFloat = 15
        static let size25: CGFloat = 25
    }
    
    //Cтринги
    enum Strings {
        static let identifierText = "SettingsTableViewCell"
        static let errorText = "error"
        static let wifiText = "MTSRouter-6AE9F7"
        static let bluetoothText = "Выкл"
    }
    
}
