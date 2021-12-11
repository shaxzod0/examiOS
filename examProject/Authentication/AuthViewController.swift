//
//  AuthViewController.swift
//  examProject
//
//  Created by Shaxzod Azamatjonov on 11/12/21.
//

import UIKit
import SnapKit
class AuthViewController: UIViewController {
    
    let restView = UIView()
    let backgroundImage = UIImageView()
    override func viewDidLoad() {
        super.viewDidLoad()
        initViews()
        // Do any additional setup after loading the view.
    }
}

extension AuthViewController{
    func initViews(){
        
        view.addSubview(backgroundImage)
        backgroundImage.image = #imageLiteral(resourceName: "authBackground")
        backgroundImage.contentMode = .scaleAspectFill
        backgroundImage.snp.makeConstraints { make in
            make.right.left.top.bottom.equalToSuperview()
        }
        view.addSubview(restView)
        restView.backgroundColor = .white
        restView.layer.cornerRadius = 20
        restView.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        restView.snp.makeConstraints { make in
            make.right.left.bottom.equalToSuperview()
            make.height.equalTo(view.snp.height).multipliedBy(0.4)
        }
        let nextButton = UIButton()
        restView.addSubview(nextButton)
        nextButton.setTitle("Login", for: .normal)
        nextButton.backgroundColor = #colorLiteral(red: 0.9921568627, green: 0.6549019608, blue: 0.3450980392, alpha: 1)
        nextButton.layer.cornerRadius = 10
        nextButton.titleLabel?.font = .systemFont(ofSize: 30)
        nextButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.snp.bottom).inset(50)
            make.right.left.equalToSuperview().inset(20)
        }

        
        let loginWithLabel = UILabel()
        restView.addSubview(loginWithLabel)
        loginWithLabel.text = "Log in with email"
        loginWithLabel.font = .systemFont(ofSize: 16)
        loginWithLabel.textAlignment = .center
        loginWithLabel.snp.makeConstraints { make in
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.centerX.equalTo(view.snp.centerX)
            make.top.equalTo(restView.snp.top).offset(20)
        }
        let registrationView = UIView()
        restView.addSubview(registrationView)
        registrationView.snp.makeConstraints { make in
            make.top.equalTo(loginWithLabel.snp.bottom).offset(20)
            make.centerX.equalTo(view.snp.centerX)
            make.width.equalTo(view.snp.width).multipliedBy(0.8)
            make.bottom.equalTo(nextButton.snp.top).offset(-20)
        }
        
        
        let emailRegistarionTextField = UITextField()
        registrationView.addSubview(emailRegistarionTextField)
        emailRegistarionTextField.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.9294117647, alpha: 1)
        emailRegistarionTextField.setLeftImage(imageName: "mail")
        emailRegistarionTextField.layer.cornerRadius = 12
        emailRegistarionTextField.textColor = #colorLiteral(red: 0.9921568627, green: 0.6549019608, blue: 0.3450980392, alpha: 1)
        emailRegistarionTextField.text = "Jonathansmth@gmail.com"
        emailRegistarionTextField.snp.makeConstraints { make in
            make.top.equalTo(loginWithLabel.snp.bottom).offset(25)
            make.height.equalTo(60)
            make.width.equalTo(registrationView.snp.width)
        }
        let passwordTextField = UITextField()
        registrationView.addSubview(passwordTextField)
        passwordTextField.backgroundColor = #colorLiteral(red: 1, green: 0.9647058824, blue: 0.9294117647, alpha: 1)
        passwordTextField.setLeftImage(imageName: "lock")
        passwordTextField.layer.cornerRadius = 10
        passwordTextField.isSecureTextEntry = true
        passwordTextField.snp.makeConstraints { make in
            make.height.equalTo(60)
            make.width.equalTo(registrationView.snp.width)
            make.top.equalTo(emailRegistarionTextField.snp.bottom).offset(20)
        }
    }
}

extension UITextField{

    func setLeftImage(imageName:String) {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: 50))
        let imageView = UIImageView(frame: CGRect(x: 10, y: 5, width: 30, height: 30))
        imageView.image = UIImage(named: imageName)
                  view.addSubview(imageView)
        self.leftView = view
        self.leftViewMode = .always
    }
}
