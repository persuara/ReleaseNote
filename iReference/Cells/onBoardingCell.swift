//
//  onBoardingCell.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/25/22.
//

import UIKit

class onBoardingCell: UICollectionViewCell {
    
    lazy var title: UILabel = {
        let view: UILabel = .init(frame: .zero)
        view.textAlignment = .center
        view.text = "TEST TITLE"
        view.textColor = .white
        view.textAlignment = .center
        view.font = UIFont.init(name: "futura", size: 21)
        view.layer.cornerRadius = 15
        view.backgroundColor = .systemPurple
        return view
    }()
        lazy var iconImg: UIImageView = {
            let view: UIImageView = .init(frame: .zero)
            view.image = UIImage.init(systemName: "applepencil")
            view.tintColor = .white
            view.layoutIfNeeded()
            return view
        }()
    lazy var descriptionTitle: UILabel = {
        let view: UILabel = .init(frame: .zero)
        view.textAlignment = .center
        view.text = "descriptionTitle"
        view.textColor = .black
        view.textAlignment = .center
        view.font = UIFont.init(name: "futura", size: 17)
        view.backgroundColor = .clear
        view.isUserInteractionEnabled = false
        
        view.numberOfLines = 0
        return view
    }()
    
 
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .clear
        
        contentView.addSubview(iconImg)
        contentView.addSubview(title)
        contentView.addSubview(descriptionTitle)
        
       
        title.translatesAutoresizingMaskIntoConstraints = false
        iconImg.translatesAutoresizingMaskIntoConstraints = false
        descriptionTitle.translatesAutoresizingMaskIntoConstraints = false
    
        
        NSLayoutConstraint.activate([
    
            iconImg.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 150),
            iconImg.centerXAnchor.constraint(equalTo: contentView.centerXAnchor, constant: 0),
            iconImg.widthAnchor.constraint(equalToConstant: 200),
            iconImg.heightAnchor.constraint(equalToConstant: 170),
            
            title.topAnchor.constraint(equalTo: iconImg.bottomAnchor, constant: 140),
            
            title.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 0),
            title.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: 0),
            title.heightAnchor.constraint(equalToConstant: 50),
            
            descriptionTitle.topAnchor.constraint(equalTo: title.bottomAnchor, constant: 20),
            descriptionTitle.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 10),
            descriptionTitle.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -10),
            descriptionTitle.heightAnchor.constraint(equalToConstant: 200)
            
       
//            descriptionTitle
            
            
        ])
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
