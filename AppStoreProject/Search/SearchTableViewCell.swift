//
//  SearchTableViewCell.swift
//  AppStoreProject
//
//  Created by Chaewon on 2023/11/07.
//

import UIKit
import SnapKit

class SearchTableViewCell: UITableViewCell {
    
    static let identifier = "SearchTableViewCell"
    
    let appIconImageView: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleAspectFit
        view.clipsToBounds = true
        view.layer.cornerRadius = 8
        return view
    }()
    
    let appNameLabel: UILabel = {
        let label = UILabel()
        label.font = .systemFont(ofSize: 18, weight: .semibold)
        label.textColor = .black
        return label
    }()
    
    let downloadButton: UIButton = {
        let button = UIButton()
        button.setTitle("받기", for: .normal)
        button.setTitleColor(.systemBlue, for: .normal)
        button.isUserInteractionEnabled = true
        button.backgroundColor = .lightGray
        button.layer.cornerRadius = 16
        return button
    }()
    
    let starImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "star.fill")
        view.tintColor = .darkGray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let ratingLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .darkGray
        return label
    }()
    
    let ratingStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }()
    
    let sellerImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "person.crop.square")
        view.tintColor = .darkGray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let sellerNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .darkGray
        return label
    }()
    
    let sellerStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }()
    
    let genreImageView: UIImageView = {
        let view = UIImageView()
        view.image = UIImage(systemName: "lasso")
        view.tintColor = .darkGray
        view.contentMode = .scaleAspectFit
        return view
    }()
    
    let genreNameLabel: UILabel = {
        let label = UILabel()
        label.font = .boldSystemFont(ofSize: 10)
        label.textColor = .darkGray
        return label
    }()
    
    let genreStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.spacing = 4
        return stack
    }()
    
    let detailStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.spacing = 16
        stack.alignment = .center
        return stack
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        configure()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configure() {
        [starImageView, ratingLabel].forEach {
            ratingStackView.addArrangedSubview($0)
        }
        
        [sellerImageView, sellerNameLabel].forEach {
            sellerStackView.addArrangedSubview($0)
        }
        
        [genreImageView, genreNameLabel].forEach {
            genreStackView.addArrangedSubview($0)
        }
        
        [ratingStackView, sellerStackView, genreStackView].forEach {
            detailStackView.addArrangedSubview($0)
        }
        
        [appIconImageView, appNameLabel, downloadButton, detailStackView].forEach {
            contentView.addSubview($0)
        }
    }
    
    private func setConstraints() {
        appIconImageView.snp.makeConstraints { make in
            make.top.leading.equalToSuperview().offset(15)
            make.size.equalTo(60)
        }
        appNameLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().offset(25)
            make.leading.equalTo(appIconImageView.snp.trailing).offset(8)
            make.width.equalToSuperview().multipliedBy(0.5)
        }
        downloadButton.snp.makeConstraints { make in
            make.centerY.equalTo(appIconImageView)
            make.trailing.equalToSuperview().inset(15)
            make.width.equalTo(72)
            make.height.equalTo(32)
        }
        
        sellerNameLabel.snp.makeConstraints { make in
            make.width.equalTo(contentView).multipliedBy(0.25)
        }
        
        detailStackView.snp.makeConstraints { make in
            make.top.equalTo(appIconImageView.snp.bottom).offset(15)
            make.centerX.equalToSuperview()
            make.horizontalEdges.equalToSuperview().inset(15)
        }
    }
}
