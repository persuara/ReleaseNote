//
//  MajorViewController.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/12/22.
//

import UIKit

class MajorViewController: Base {
    
    var jsonResult: Model?
    var network = Network()
    var leadingMenu: NSLayoutConstraint?
    var dateNz = DateNZ()
    
    
    
    lazy var buttonsCollectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.minimumInteritemSpacing = 5
        layout.minimumLineSpacing = 20
        layout.scrollDirection = .vertical
        layout.itemSize = CGSize(width: 100, height: 100)
        
        
        let view: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        view.isScrollEnabled = false
        view.layer.cornerRadius = 15
        view.backgroundColor = .white.withAlphaComponent(0.3)
        view.delegate = self
        view.dataSource = self
        view.register(CollectionViewCell.self, forCellWithReuseIdentifier: "identifierCell")
        return view
    }()
    
    lazy var menuWelcomeLabel: UILabel = {
        let view: UILabel = .init()
        view.text = "iOS Releases"
        view.textColor = .white
        view.textAlignment = .left
        view.font = UIFont.init(name: "Futura", size: 30)
        return view
    }()
    lazy var icon: UIImageView = {
        let view: UIImageView = .init(frame: .zero)
        view.image = UIImage.init(systemName: "rectangle.portrait.fill")
        view.tintColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setButtonCollectionViewConstraints()
        //        setupWelcomeAnimation()
        setUpWelcomeLabelConstraints()

        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        buttonsCollectionView.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10 , right: 20)
        
    }

    
    func setButtonCollectionViewConstraints() -> Void {
        
        network.fetchJson(&jsonResult)
        view.addSubview(buttonsCollectionView)
        buttonsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        let cTop = buttonsCollectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 200)
        let cLead = buttonsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        let cTrail = buttonsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20)
        let cBottom = buttonsCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -50)
        
        _ = [cTop,cLead,cTrail,cBottom].map {$0.isActive = true}
    }

    
    public func setUpWelcomeLabelConstraints() -> Void {
        
        view.addSubview(menuWelcomeLabel)
        view.addSubview(icon)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 35).isActive = true
        
        icon.trailingAnchor.constraint(equalTo: menuWelcomeLabel.leadingAnchor, constant: -8).isActive = true
        icon.bottomAnchor.constraint(equalTo: buttonsCollectionView.topAnchor, constant: -20).isActive = true
        
        menuWelcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        menuWelcomeLabel.bottomAnchor.constraint(equalTo: buttonsCollectionView.topAnchor, constant: -20).isActive = true
        
        leadingMenu =  menuWelcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60)
        _ = leadingMenu?.isActive = true
        menuWelcomeLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
    }
    
}
extension MajorViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonResult?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "identifierCell", for: indexPath) as? CollectionViewCell
        let model  = jsonResult?.data[indexPath.item].image
        cell?.setModel(model ?? "iOS2")
        return cell!
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        guard let jsonResult else { return }
        let vc = MinorViewController()
        vc.minorResult  = jsonResult.data[indexPath.row].minor
        vc.revisionResult = jsonResult.data[indexPath.row].revisions
        
        self.navigationController?.pushViewController(vc, animated: false)
        
    }
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.transform = CGAffineTransform(scaleX: 0.4, y: 0.4)
        UIView.animate(withDuration: 20.0, delay: 0.0, usingSpringWithDamping: 2, initialSpringVelocity: 1.5, options: .allowUserInteraction, animations: {
            cell.transform = .identity
          }, completion: nil)
    }
}
