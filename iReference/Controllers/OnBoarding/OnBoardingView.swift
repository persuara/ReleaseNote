//
//  OnBoardingView.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/22/22.
//

import UIKit

class OnBoardingView: Base {
    
    var topAnchorNS: NSLayoutConstraint?
    var centerXNS: NSLayoutConstraint?
    var  modelOnBoard: ModelOnBoard?
    lazy var netwrok = Network()

    lazy var overView: UIView = {
        let view: UIView = .init(frame: .zero)
        view.layer.cornerRadius = 65
        view.backgroundColor = .white.withAlphaComponent(0.3)
        return view
    }()
    lazy var collectionView: UICollectionView = {
        let layout: UICollectionViewFlowLayout = .init()
        layout.scrollDirection = .horizontal
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 10
        layout.itemSize = CGSize.init(width: view.frame.size.width, height: view.frame.size.height - 70)
        let view: UICollectionView = .init(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        view.register(onBoardingCell.self , forCellWithReuseIdentifier: "cell")
        view.backgroundColor = .clear
        view.layer.cornerRadius = 15
        view.isPagingEnabled = true
        return view
    }()
    
   lazy var bulletPoint: UIPageControl = {
    let view: UIPageControl = .init(frame: .zero)
       view.tintColor = .black
       view.numberOfPages = modelOnBoard?.data.count ?? 10
    return view
}()

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(overView)
        netwrok.fetchOnBoardingJson(&modelOnBoard)
        
        view.addSubview(collectionView)
        overView.addSubview(bulletPoint)
        
        overView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        bulletPoint.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            overView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            overView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            overView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 40),
            overView.topAnchor.constraint(equalTo: view.topAnchor, constant: 400),
            
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -70),
            
            bulletPoint.bottomAnchor.constraint(equalTo: overView.bottomAnchor, constant: -70),
            bulletPoint.centerXAnchor.constraint(equalTo: overView.centerXAnchor),
            bulletPoint.heightAnchor.constraint(equalToConstant: 20),
            bulletPoint.widthAnchor.constraint(equalToConstant: 50)
            
            
//            bigTitle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
//            bigTitle.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -75),
//            bigTitle.widthAnchor.constraint(equalToConstant: 200),
//            bigTitle.heightAnchor.constraint(equalToConstant: 25),
//
//
//         
        ])
//        topAnchorNS = iconImg.bottomAnchor.constraint(equalTo: overView.topAnchor, constant: -60)
//        centerXNS = iconImg.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -100)
//        _ = [topAnchorNS, centerXNS].map {$0?.isActive = true }
    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
//        UIView.animate(withDuration: 1, delay: 0.3, options: .layoutSubviews ,animations: {
//            self.centerXNS?.constant = 0
//            self.topAnchorNS?.constant = -90
//            self.view.layoutIfNeeded()
//        }, completion: nil)
        
    }
}
extension OnBoardingView: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        modelOnBoard?.data.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! onBoardingCell
        let modelImage = modelOnBoard?.data[indexPath.item].image
        let modelTitle = modelOnBoard?.data[indexPath.item].title
        let modelDescription = modelOnBoard?.data[indexPath.item].description
        cell.iconImg.image = UIImage.init(systemName: modelImage ?? "applepencil")
        cell.title.text = modelTitle
        cell.descriptionTitle.text = modelDescription
        return cell
    }
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        bulletPoint.currentPage = Int(collectionView.contentOffset.x) / Int(collectionView.frame.width)
    }

    
    
}
