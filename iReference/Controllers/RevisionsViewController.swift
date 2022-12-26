//
//  RevisionsViewController.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/17/22.
//

import UIKit

class RevisionsViewController: Base {

    var resModel: Model?
    var indexRevisions: IndexPath?

    lazy var welcomeLabel: UILabel = {
        let view: UILabel = .init()
        view.text = "Revisions"
        view.textColor = .white
        view.font = UIFont.init(name: "Futura", size: 30)
        return view
    }()
    lazy var icon: UIImageView = {
        let view: UIImageView = .init(frame: .zero)
        view.image = UIImage.init(systemName: "rectangle.portrait.fill")
        view.tintColor = .white
        return view
    }()
    lazy var tableView: UITableView = {
        let view: UITableView = .init(frame: .zero)
        view.dataSource = self
        view.delegate = self
        view.register(RevisionTableCell.self, forCellReuseIdentifier: "identifierRev")
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.isScrollEnabled = false
        return view
    }()
    var revisionsModel: [MinorObject?] = [] 

   
    override func viewDidLoad() {
        super.viewDidLoad()
        
       
        setUpTableViewConstraints()
        setUpWelcomeLabelConstraints()
      
    }
    
    public func setUpTableViewConstraints() -> Void {
        view.addSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tLead = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        let tTrail = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        
        
        let cgfloat = CGFloat(revisionsModel.count)
        let tHeight = tableView.heightAnchor.constraint(equalToConstant: cgfloat * 60)
        let tTop = tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height/4)
        
        _ = [tLead,tTop,tTrail,tHeight].map {$0.isActive = true}
    }
    public func setUpWelcomeLabelConstraints() -> Void {
        
        view.addSubview(welcomeLabel)
        view.addSubview(icon)
        
        icon.translatesAutoresizingMaskIntoConstraints = false
        icon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 35).isActive = true
        icon.heightAnchor.constraint(equalToConstant: 35).isActive = true

        icon.trailingAnchor.constraint(equalTo: welcomeLabel.leadingAnchor, constant: -8).isActive = true
        icon.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -20).isActive = true
        
        welcomeLabel.translatesAutoresizingMaskIntoConstraints = false
        welcomeLabel.bottomAnchor.constraint(equalTo: tableView.topAnchor, constant: -20).isActive = true
        welcomeLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 60).isActive = true
        welcomeLabel.widthAnchor.constraint(equalToConstant: view.frame.size.width).isActive = true
    }

}

extension RevisionsViewController: UITableViewDelegate,UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       // return revisionsModel.count
        return revisionsModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifierRev") as! RevisionTableCell
        let model = revisionsModel[indexPath.row]
        let url: String? = revisionsModel[indexPath.row]?.url
        
        guard url != nil else {
            cell.iconImage.image = UIImage(systemName: "number.circle.fill")
            cell.iconImage.tintColor = .lightGray
            cell.label.text = model?.version
//            cell.dateLabel.text = DateNZ.convertTime(from: model!.date)
            return cell
        }
        cell.iconImage.image = UIImage(systemName: "number.circle.fill")
        cell.iconImage.tintColor = .systemPurple
        cell.label.text = model?.version
//        cell.dateLabel.text = DateNZ.convertTime(from: model!.date)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let url: String? = revisionsModel[indexPath.row]?.url
        let versionNumber: String = revisionsModel[indexPath.row]!.version
        
        guard url != nil else {
            let alert: UIAlertController = .init(title: "Not Found",message: "Apple has not released a Release Note for iOS \(versionNumber) yet!" ,preferredStyle: .alert)
            let alertAction = UIAlertAction.init(title: "Okay", style: .cancel)
            alert.addAction(alertAction)
            self.present(alert, animated: true)
            print("no url is provided for \(indexPath.row) revision!")
            return
        }
        if let linkURL = URL(string: url!) {
            UIApplication.shared.open(linkURL)
        }
        
        
    }
    
}
