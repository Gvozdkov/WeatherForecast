//
//  WeatherCollectionView.swift
//  WeatherForecast
//
//  Created by Алексей Гвоздков on 18.05.2025.
//

import UIKit
import SnapKit

final class WeatherCollectionView: UIView {
    
    private lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 10
        layout.minimumInteritemSpacing = 10
        
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = .clear
        collectionView.showsVerticalScrollIndicator = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(WeatherCollectionCell.self, forCellWithReuseIdentifier: WeatherCollectionCell.reuseID)
        collectionView.dataSource = self
        collectionView.delegate = self
        return collectionView
    }()
    
    private var dataSource = [ForecastDay]()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupConstraints() {
        backgroundColor = .clear
        
        addSubview(collectionView)
        
        collectionView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func configure(data: [ForecastDay]) {
        dataSource = data
        collectionView.reloadData()
    }
}

extension WeatherCollectionView: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WeatherCollectionCell.reuseID, for: indexPath) as? WeatherCollectionCell else {
            return UICollectionViewCell()
        }
        
        let dayData = dataSource[indexPath.row]
        cell.configure(with: dayData)
        
        return cell
    }
}

extension WeatherCollectionView: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = collectionView.bounds.width - 20
        let height: CGFloat = 80
        return CGSize(width: width, height: height)
    }
}

