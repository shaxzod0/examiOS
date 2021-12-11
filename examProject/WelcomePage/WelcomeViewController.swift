//
//  WelcomeViewController.swift
//  examProject
//
//  Created by Shaxzod Azamatjonov on 11/12/21.
//

import UIKit
import SnapKit
class WelcomeViewController: UIViewController {
    
    let pageController = UIPageControl()
    let model = WelcomeDataModel()
    let nextButton = UIButton()
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 0
        layout.minimumInteritemSpacing = 0
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.delegate = self
        cv.dataSource = self
        cv.register(WelcomeItemCell.self, forCellWithReuseIdentifier: WelcomeItemCell.identidier)
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

// MARK: -> UI
extension WelcomeViewController{
    func initViews(){
        
        
        let button = UIButton()
        
        button.setTitle( "Get Started", for: .normal)
        button.backgroundColor = #colorLiteral(red: 0.9993906617, green: 0.7128087878, blue: 0.4174064696, alpha: 1)
        button.layer.cornerRadius = 8
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .bold)
        button.addTarget(self, action: #selector(skipPage), for: .touchUpInside)
        view.addSubview(button)
        button.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-40)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(60)
        }
        startButton = button
        
        view.addSubview(collectionView)
        collectionView.snp.makeConstraints { make in
            make.top.left.right.equalToSuperview()
            make.bottom.equalTo(button.snp.top).offset(-49)
        }
        
        let stackView = UIStackView()
        view.addSubview(stackView)
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        stackView.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(33)
            make.bottom.equalTo(button.snp.top).offset(-10)
        }
        
        let skipButton = UIButton()
        stackView.addArrangedSubview(skipButton)
        skipButton.setTitle("Skip", for: .normal)
        skipButton.setTitleColor(#colorLiteral(red: 0.4191444516, green: 0.2704297006, blue: 0.3997567892, alpha: 1), for: .normal)
        skipButton.addTarget(self, action: #selector(skipPage), for: .touchUpInside)
        skipButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
                
        
        stackView.addArrangedSubview(pageController)
        pageController.currentPage = 0
        pageController.pageIndicatorTintColor = #colorLiteral(red: 0.9858699441, green: 0.758820951, blue: 0.4735049605, alpha: 1)
        pageController.currentPageIndicatorTintColor = #colorLiteral(red: 0.4191444516, green: 0.2704297006, blue: 0.3997567892, alpha: 1)
        pageController.numberOfPages = model.getDataCount()

       
        stackView.addArrangedSubview(nextButton)
        nextButton.setTitle("Next", for: .normal)
        nextButton.addTarget(self, action: #selector(nextPage), for: .touchUpInside)
        nextButton.setTitleColor(#colorLiteral(red: 0.4191444516, green: 0.2704297006, blue: 0.3997567892, alpha: 1), for: .normal)
        nextButton.titleLabel?.font = .systemFont(ofSize: 17, weight: .bold)
    }
}

// MARK: -> CollectionViewDelegate


extension WelcomeViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return model.getDataCount()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: WelcomeItemCell.identidier , for: indexPath) as! WelcomeItemCell
        cell.setItem(item: model.getItem(index: indexPath.item))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        pageController.currentPage = indexPath.item
        pageController.currentPage = nextButton.tag
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        pageController.currentPage = Int(scrollView.contentOffset.x)/Int(scrollView.frame.width)
    }
}

// MARK: -> Action

extension WelcomeViewController {
    @objc func nextPage(){
        pageController.currentPage+=1
    }
    @objc func skipPage(){
        let vc = AuthViewController()
        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
}

