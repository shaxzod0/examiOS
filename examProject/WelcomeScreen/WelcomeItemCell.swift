//
//  WelcomeItemCell.swift
//  examProject
//
//  Created by Shaxzod Azamatjonov on 11/12/21.
//


import UIKit
import SnapKit

class WelcomeItemCell: UICollectionViewCell {
    
    static let identifier = "WelcomeItemCell"
    
    let titleLabel = UILabel()
    let definitionLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setItem(item: WelcomeModel) {
        titleLabel.text = item.name
        definitionLabel.text = item.definition
        imageView.image = item.image
    }
    
    
    
    private func initViews() {
        
        self.addSubview(titleLabel)
        self.addSubview(definitionLabel)
        self.addSubview(imageView)
        
        titleLabel.font = .systemFont(ofSize: 40, weight: .bold)
        definitionLabel.font = .systemFont(ofSize: 28, weight: .regular)
        definitionLabel.textAlignment = .center
        definitionLabel.numberOfLines = 3
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(self.snp.centerY).offset(100)
        }
        
        definitionLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(10)
            make.left.right.equalToSuperview().inset(40)
        }
        
        imageView.snp.makeConstraints { make in
            make.bottom.equalTo(titleLabel.snp.top).offset(-20)
            make.height.width.equalTo(200)
            make.centerX.equalToSuperview()
        }
        
        
        
    }
    
    
    
}
