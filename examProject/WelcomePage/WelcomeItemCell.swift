//
//  WelcomeItemCell.swift
//  examProject
//
//  Created by Shaxzod Azamatjonov on 11/12/21.
//

import UIKit

class WelcomeItemCell: UICollectionViewCell{
    static let identidier = "WelcomeItemCell"
    
    let titleLabel = UILabel()
    let defenitionLabel = UILabel()
    let imageView = UIImageView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initViews()
    }
  
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func setItem(item: WelcomeModel){
        titleLabel.text = item.header.uppercased()
        titleLabel.font = .systemFont(ofSize: 32, weight: .semibold)
        titleLabel.lineBreakMode = .byWordWrapping
        titleLabel.numberOfLines = 2
        titleLabel.textAlignment = .center
        titleLabel.textColor = #colorLiteral(red: 0.4191444516, green: 0.2704297006, blue: 0.3997567892, alpha: 1)
        imageView.image = item.image
        imageView.clipsToBounds = true
        imageView.contentMode = .scaleAspectFit
        defenitionLabel.text = item.defenition.uppercased()
        defenitionLabel.textColor = #colorLiteral(red: 0.4191444516, green: 0.2704297006, blue: 0.3997567892, alpha: 1)
        defenitionLabel.lineBreakMode = .byWordWrapping
        defenitionLabel.numberOfLines = 2
        defenitionLabel.font = .systemFont(ofSize: 17, weight: .bold)
        defenitionLabel.textAlignment = .center
    }
    
    
    
    private func initViews(){
        self.addSubview(titleLabel)
        self.addSubview(defenitionLabel)
        self.addSubview(imageView)
        
        titleLabel.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.left.right.equalToSuperview().inset(32)
            make.top.equalToSuperview().offset(81)
        }
        imageView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.top.equalTo(titleLabel.snp.bottom).offset(20)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(414)
        }
        defenitionLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(15)
            make.right.left.equalToSuperview().inset(32)
        }
    }
}
