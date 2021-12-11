//
//  WelcomeViewController.swift
//  examProject
//
//  Created by Shaxzod Azamatjonov on 11/12/21.
//

import UIKit

class WelcomeViewController: UIViewController{
    let pageControl = UIPageControl()
    let model = WelcomeDataModel()
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(WelcomeItemCell.self, forCellWithReuseIdentifier: WelcomeItemCell.identifier)
        cv.isPagingEnabled = true
        cv.showsHorizontalScrollIndicator = false
        return cv
    }()
    
    weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        
    }
}

//MARK: - Action
extension WelcomeViewController {
    
    @objc func navigateToAuthController() {
        let vc = AuthViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    
}



// MARK: - UI

extension WelcomeViewController {
    func initViews() {
        
        let button = UIButton()
        button.setTitle("Get Started", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        button.layer.cornerRadius = 12
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = .systemFont(ofSize: 20, weight: .semibold)
        view.addSubview(button)
        button.addTarget(self, action: #selector(navigateToAuthController), for: .touchUpInside)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).offset(-30)
            make.left.right.equalToSuperview().inset(40)
            make.height.equalTo(55)
        }
        startButton = button
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(button.snp.top).offset(-30)
        }
        
        view.addSubview(pageControl)
        pageControl.currentPage = 0
        pageControl.currentPageIndicatorTintColor = .black
        pageControl.pageIndicatorTintColor = .lightGray
        pageControl.numberOfPages = model.getDataCount()
        pageControl.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.bottom.equalTo(button.snp.top).offset(-100)
            make.height.equalTo(44)
        }
        
        
    }
}


// MARK: - Collection View Delegates
extension WelcomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:  WelcomeItemCell.identifier, for: indexPath) as! WelcomeItemCell
        
        cell.setItem(item: model.getItem(index: indexPath.item))
        
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.getDataCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageControl.currentPage = indexPath.item
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        
        pageControl.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
    
}



