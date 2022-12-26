//
//  ViewController.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/11/22.
//

import UIKit

class LoginViewController: UIViewController {
    
    lazy var loginUi = LoginUI()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemPurple
        
        loginUi.setUpLoginTextFieldsConstraints(view)
        loginUi.setUpLoginButtonConstraints(view)
        
        
    }


}

