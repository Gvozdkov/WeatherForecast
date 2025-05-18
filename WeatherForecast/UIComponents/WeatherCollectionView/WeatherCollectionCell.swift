//
//  WeatherCollectionCell.swift
//  WeatherForecast
//
//  Created by Алексей Гвоздков on 18.05.2025.
//

import UIKit
import SnapKit

final class WeatherCollectionCell: UICollectionViewCell {
    
    static let reuseID = "WeatherCollectionCell"
    
    private lazy var avgtempLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.textAlignment = .left
        label.text = "17"
        label.font = Fonts.body
        return label
    }()
    
    private lazy var iconWeatherImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "thermometer.sun")
        return imageView
    }()
    
    private lazy var dateLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.textAlignment = .left
        label.text = "PN"
        label.font = Fonts.body
        return label
    }()
    
    private lazy var descriptionLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.textAlignment = .left
        label.text = "Описание погоды"
        label.font = Fonts.body
        return label
    }()
    
    private lazy var maxwindLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.textAlignment = .left
        label.text = "Скорость ветра 54"
        label.font = Fonts.body
        return label
    }()
    
    private lazy var avghumidityLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.textAlignment = .left
        label.text = "Влажность 88"
        label.font = Fonts.body
        return label
    }()
    
    private lazy var avgtempStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [avgtempLabel, iconWeatherImage, dateLabel])
        stackView.axis = .horizontal
        stackView.spacing = 10
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var infoStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [descriptionLabel, maxwindLabel, avghumidityLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    private lazy var weatherStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [avgtempStackView, infoStackView])
        stackView.axis = .horizontal
        stackView.distribution = .fillEqually
        return stackView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        addSubview(weatherStackView)

        weatherStackView.snp.makeConstraints {
            $0.center.equalToSuperview()
        }
    }
    
    func configure(with day: ForecastDay) {
            dateLabel.text = day.date
            avgtempLabel.text = "\(day.day.avgtempC)°C"
            descriptionLabel.text = day.day.condition.text
            maxwindLabel.text = "Ветер: \(day.day.maxwindKph) км/ч"
            avghumidityLabel.text = "Влажность: \(day.day.avghumidity)%"
            
            // Загрузка иконки
 
        }
}
