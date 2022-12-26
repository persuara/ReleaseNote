//
//  LoginUI.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/11/22.
//

import UIKit

class LoginUI: UIView {
    
    lazy var userNameTextField: UITextField = {
        let view: UITextField = .init()
        view.placeholder = "Your UserName..."
        view.backgroundColor = .white
        view.borderStyle = .roundedRect
        view.textColor = .purple
        view.font = UIFont.preferredFont(forTextStyle: .body)
        return view
    }()
    lazy var passwordTextField: UITextField = {
        let view: UITextField = .init()
        view.placeholder = "Your Password..."
        view.backgroundColor = .white
        view.borderStyle = .roundedRect
        view.textColor = .purple
        view.font = UIFont.preferredFont(forTextStyle: .body)
        return view
    }()
    lazy var verifyUserNameBtn: UIButton = {
        let view: UIButton = .init(frame: .zero)
        view.setTitle("Verify", for: .normal)
        view.backgroundColor = .white
        view.setTitleColor(.systemPurple, for: .normal)
        return view
    }()
    lazy var verifyPasswordBtn: UIButton = {
        let view: UIButton = .init(frame: .zero)
        view.setTitle("Verify", for: .normal)
        view.setTitleColor(.systemPurple, for: .normal)
        view.backgroundColor = .white
        view.tintColor = .systemPurple
        return view
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
    
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setUpLoginButtonConstraints(_ superView: UIView) -> Void {
        superView.addSubview(verifyUserNameBtn)
        superView.addSubview(verifyPasswordBtn)
        
        verifyUserNameBtn.translatesAutoresizingMaskIntoConstraints = false
        verifyPasswordBtn.translatesAutoresizingMaskIntoConstraints = false
        
        let userTrail = verifyUserNameBtn.trailingAnchor.constraint(equalTo: userNameTextField.trailingAnchor, constant: -5)
        let passTrail = verifyPasswordBtn.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor, constant: -5)
        
        let userY = verifyUserNameBtn.centerYAnchor.constraint(equalTo: userNameTextField.centerYAnchor, constant: 0)

        let passY = verifyPasswordBtn.centerYAnchor.constraint(equalTo: passwordTextField.centerYAnchor, constant: 0)
        
        let userWidth = verifyUserNameBtn.widthAnchor.constraint(equalToConstant: 50)
        let passWidth = verifyPasswordBtn.widthAnchor.constraint(equalToConstant: 50)
        
        let _ = [userTrail, userWidth, passTrail, passWidth, userY, passY].map {$0.isActive = true}
        
        
    }
    public func setUpLoginTextFieldsConstraints(_ superView: UIView) -> Void {
        superView.addSubview(userNameTextField)
        superView.addSubview(passwordTextField)
        
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        
        let userX = userNameTextField.centerXAnchor.constraint(equalTo: superView.centerXAnchor)
        let passX = passwordTextField.centerXAnchor.constraint(equalTo: superView.centerXAnchor)
        
        let userY = userNameTextField.centerYAnchor.constraint(equalTo: superView.centerYAnchor,constant: -20)
        let passTop = passwordTextField.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20)
        
        let userLead = userNameTextField.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20)
        let passLead = passwordTextField.leadingAnchor.constraint(equalTo: superView.leadingAnchor, constant: 20)
        let userTrail = userNameTextField.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20)
        let passTrail = passwordTextField.trailingAnchor.constraint(equalTo: superView.trailingAnchor, constant: -20)
        
        let userHeight = userNameTextField.heightAnchor.constraint(equalToConstant: 40)
        let passHeight = passwordTextField.heightAnchor.constraint(equalToConstant: 40)
        
        let _ = [userX ,passX, userY, passTop, userLead, passLead, userTrail, passTrail, userHeight, passHeight].map {$0.isActive = true}
        
        
        
    }
    
}
