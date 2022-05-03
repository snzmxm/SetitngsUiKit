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
    
    //MARK: - Live style
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(label)
        contentView.addSubview(iconContainer)
        iconContainer.addSubview(iconImageView)
        contentView.addSubview(additionalLabel)
        
        contentView.clipsToBounds = true
        accessoryType = .disclosureIndicator
    }
    
    required init?(coder: NSCoder) {
        fatalError(Strings.errorText)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
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
        
        additionalLabel.frame = CGRect(x: (contentView.frame.size.width - contentView.frame.size.width / Metric.size1_9),
                                       y: (contentView.frame.size.height / Metric.size7),
                                       width: contentView.frame.size.width / Metric.size2,
                                       height: iconContainer.frame.size.height)
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        iconImageView.image = nil
        label.text = nil
        iconContainer.backgroundColor = nil
        additionalLabel.text = ""
    }
    
    //MARK: - Create methods
    
    public func configure(with model: SettingsOptions) {
        label.text = model.title
        iconImageView.image = model.icon
        iconContainer.backgroundColor = model.iconBackgroundColor
        
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
