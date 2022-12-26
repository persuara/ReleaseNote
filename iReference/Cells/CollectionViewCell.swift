//
//  CollectionViewCell.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/15/22.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    var indexPath: IndexPath?
    lazy var img: UIImageView = {
        let view: UIImageView = .init(frame: .zero)
        return view
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .red
        contentView.layer.cornerRadius = 50
        contentView.clipsToBounds = true
        contentView.addSubview(img)
        img.frame = contentView.bounds
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    public func setModel(_ model: String) {
        img.image = UIImage.init(named: model)
    }

}
