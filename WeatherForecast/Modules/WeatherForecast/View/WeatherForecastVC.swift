//
//  ViewController.swift
//  WeatherForecast
//
//  Created by Алексей Гвоздков on 18.05.2025.
//

import UIKit
import SnapKit

final class WeatherForecastVC: UIViewController {
    
    private lazy var weatherCityLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.textAlignment = .center
        label.text = "Moscow"
        label.font = Fonts.title
        return label
    }()
    
    private lazy var currentWeatherLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.black
        label.textAlignment = .center
        label.text = "35°C"
        label.font = Fonts.bigTitle
        return label
    }()
    
    private lazy var forecastTitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = Colors.lightBlack
        label.textAlignment = .left
        label.text = "Прогноз погоды на 5 дней"
        label.font = Fonts.subtitle
        return label
    }()

    private lazy var weatherCollectionView: WeatherCollectionView = {
        let view = WeatherCollectionView()
        return view
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupConstraints()
    }

    private func setupConstraints() {
        view.backgroundColor = .white
        
        view.addSubview(weatherCityLabel)
        view.addSubview(currentWeatherLabel)
        view.addSubview(forecastTitleLabel)
        view.addSubview(weatherCollectionView)
        
        weatherCityLabel.snp.makeConstraints {
            $0.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(40)
            $0.centerX.equalToSuperview()
        }
        
        currentWeatherLabel.snp.makeConstraints {
            $0.top.equalTo(weatherCityLabel.snp.bottom).offset(20)
            $0.centerX.equalToSuperview()    
        }
        
        forecastTitleLabel.snp.makeConstraints {
            $0.top.equalTo(currentWeatherLabel.snp.bottom).offset(60)
            $0.leading.equalTo(20)
        }
        
        weatherCollectionView.snp.makeConstraints {
            $0.top.equalTo(forecastTitleLabel.snp.bottom).offset(20)
            $0.leading.equalTo(20)
            $0.trailing.equalTo(-20)
            $0.size.equalTo(500)
        }
    }

}

