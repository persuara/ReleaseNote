//
//  RevisionTableCell.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/20/22.
//

import UIKit

class RevisionTableCell: UITableViewCell {
    
    lazy var label: UILabel = {
        let view: UILabel = .init()
        view.textColor = .black
        view.font = UIFont.init(name: "Futura", size: 15)
        return view
    }()
    lazy var iconImage: UIImageView = {
        let view: UIImageView = .init(frame: .zero)
        view.image = UIImage(systemName: "number.circle.fill")
        view.tintColor = .systemPurple
        return view
    }()
    lazy  var layerGradiant: CALayer = {
        let view: CALayer = .init()
        view.backgroundFilters = [CIImage(color: .blue), CIImage(color: .red), CIImage(color: .yellow)]
        view.backgroundColor = UIColor.systemCyan.cgColor
        view.frame = superview?.frame ?? CGRect(x: 0, y: 0, width: 0, height: 0)
        return view
    }()
    lazy var dateLabel: UILabel = {
        let view: UILabel = .init(frame: .zero)
        view.textColor = .black
        view.font = UIFont.init(name: "Futura", size: 15)
        return view
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.layer.addSublayer(layerGradiant)
       
        contentView.addSubview(label)
        contentView.addSubview(iconImage)
        contentView.addSubview(dateLabel)
        
        
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        iconImage.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 30).isActive = true
        iconImage.widthAnchor.constraint(equalToConstant: 35).isActive = true
        iconImage.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 13).isActive = true
        iconImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -13).isActive = true
        
       
        label.translatesAutoresizingMaskIntoConstraints = false
        label.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 90).isActive = true
        label.widthAnchor.constraint(equalToConstant: 100).isActive = true
        label.heightAnchor.constraint(equalToConstant: 30).isActive = true
        
        dateLabel.translatesAutoresizingMaskIntoConstraints = false
        dateLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true
        dateLabel.leadingAnchor.constraint(equalTo: label.leadingAnchor, constant: 120).isActive = true
        dateLabel.widthAnchor.constraint(equalToConstant: 150).isActive = true
        dateLabel.heightAnchor.constraint(equalToConstant: 30).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
