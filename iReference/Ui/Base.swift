//
//  Base.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/19/22.
//

import UIKit

class Base: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        _ = view.applyGradient(colours: [.systemFill.withAlphaComponent(0.2), .systemPurple])
    }

}
