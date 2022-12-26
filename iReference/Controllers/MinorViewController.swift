//
//  MinorViewController.swift
//  iReference
//
//  Created by AmirHossein EramAbadi on 12/12/22.
//

import UIKit

class MinorViewController: Base {
    
    
    var minorResult: [MinorObject] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    var revisionResult : [[MinorObject?]] = []
    var isSearching: Bool = false
    var searchArray = [String]()
    var allMinorVersions = [String]()
    var allMinorDates = [Int]()
    var tHeight: NSLayoutConstraint?
    
    
    lazy var tableView: UITableView = {
        let view: UITableView = .init(frame: .zero)
        view.delegate = self
        view.dataSource = self
        view.register(TableViewCell.self, forCellReuseIdentifier: "identifier")
        view.backgroundColor = .white
        view.layer.cornerRadius = 15
        view.isScrollEnabled = false
        return view
    }()
    
    lazy var welcomeLabel: UILabel = {
        let view: UILabel = .init()
        view.text = "Minor Releases"
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
    lazy var searchThrough: UISearchBar = {
        let view: UISearchBar = .init(frame: .zero)
        view.searchTextField.borderStyle = .roundedRect
        view.searchTextField.backgroundColor = .white.withAlphaComponent(0.3)
        view.setBackgroundImage(UIImage(), for: .any, barMetrics: .default)

        view.tintColor = .black
        view.delegate = self
        return view
    }()

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpTableViewConstraints()
        setUpWelcomeLabelConstraints()
        setUpSearchBar()
        
    }
    public func setUpSearchBar() -> Void {
        
        view.addSubview(searchThrough)
        searchThrough.translatesAutoresizingMaskIntoConstraints = false
        searchThrough.topAnchor.constraint(equalTo: view.topAnchor, constant: 90).isActive = true
        searchThrough.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 15).isActive = true
        searchThrough.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -15).isActive = true
    }
    public func setUpTableViewConstraints() -> Void {
        view.addSubview(tableView)
        
        tableView.translatesAutoresizingMaskIntoConstraints = false
        let tLead = tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25)
        let tTrail = tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25)
        let cgfloat = CGFloat(minorResult.count)
        let cgfloatTrue = CGFloat(searchArray.count)
        if isSearching {
            tHeight = tableView.heightAnchor.constraint(equalToConstant: cgfloatTrue * 60)
        }
        tHeight = tableView.heightAnchor.constraint(equalToConstant: cgfloat * 60)
        let tTop = tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: view.frame.size.height/4)
        
        _ = [tLead,tTop,tTrail,tHeight!].map {$0.isActive = true}
        
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
extension MinorViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if isSearching {
            return searchArray.count
        } else {
            return minorResult.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var finalCell: UITableViewCell?
        let cell = tableView.dequeueReusableCell(withIdentifier: "identifier") as! TableViewCell
        let model = minorResult[indexPath.row]
        let modelRevison: [MinorObject?] = revisionResult[indexPath.row]
        let modelDate = minorResult[indexPath.row].date
        
        for i in minorResult {
            allMinorVersions.append(i.version)
            allMinorDates.append(i.date)
        }
        
        let url: String? = minorResult[indexPath.row].url
    
        if isSearching {
            if modelRevison.contains(where: {$0 == nil}) {
                guard url != nil else {
                    cell.iconImage.image = UIImage(systemName: "number.circle.fill")
                    cell.iconImage.tintColor = .lightGray
                    cell.label.text = searchArray[indexPath.row]
                    cell.dateLabel.text = DateNZ.convertTimeStamp(from: allMinorDates[indexPath.row])
                    return cell
                }
                cell.iconImage.image = UIImage(systemName: "number.circle.fill")
                cell.iconImage.tintColor = .systemPurple
                cell.label.text = searchArray[indexPath.row]
                cell.dateLabel.text = DateNZ.convertTimeStamp(from: allMinorDates[indexPath.row])
            } else {
                cell.iconImage.image = UIImage.init(systemName: "square.stack.3d.down.right.fill")
                cell.label.text = searchArray[indexPath.row]
                cell.dateLabel.text = DateNZ.convertTimeStamp(from: allMinorDates[indexPath.row])
                finalCell = cell
            }
        } else {
            if modelRevison.contains(where: {$0 == nil}) {
                guard url != nil else {
                    cell.iconImage.image = UIImage(systemName: "number.circle.fill")
                    cell.iconImage.tintColor = .lightGray
                    cell.label.text = model.version
                    cell.dateLabel.text = DateNZ.convertTimeStamp(from: allMinorDates[indexPath.row])
                    return cell
                }
                cell.iconImage.image = UIImage(systemName: "number.circle.fill")
                cell.iconImage.tintColor = .systemPurple
                cell.label.text = model.version
                cell.dateLabel.text = DateNZ.convertTimeStamp(from: allMinorDates[indexPath.row])
            } else {
                cell.iconImage.image = UIImage.init(systemName: "square.stack.3d.down.right.fill")
                cell.label.text = model.version
                cell.dateLabel.text = DateNZ.convertTimeStamp(from: allMinorDates[indexPath.row])
                finalCell = cell
            }
        }
        finalCell = cell
        return finalCell!
            
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let model: [MinorObject?] = revisionResult[indexPath.row]
        let vc = RevisionsViewController()
        vc.revisionsModel = revisionResult[indexPath.row]
        let url: String? = minorResult[indexPath.row].url
        let versionNumber = minorResult[indexPath.row].version
        
        
        if isSearching {
            if model.contains(where: {$0 == nil}) {
                guard let url else {
                    let alert: UIAlertController = .init(title: "Not Found",message: "Apple has not released a Release Note for iOS \(versionNumber) yet!" ,preferredStyle: .alert)
                    let alertAction = UIAlertAction.init(title: "Okay", style: .cancel)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                    print("no url is provided for \(indexPath.row) revision!")
                    return
                }
                if let urlLink = URL(string: url) {
                    UIApplication.shared.open(urlLink)
                }
            } else {
                vc.indexRevisions = indexPath
                
                self.navigationController?.pushViewController(vc, animated: false)
            }
        } else {
            if model.contains(where: {$0 == nil}) {
                guard let url else {
                    let alert: UIAlertController = .init(title: "Not Found",message: "Apple has not released a Release Note for iOS \(versionNumber) yet!" ,preferredStyle: .alert)
                    let alertAction = UIAlertAction.init(title: "Okay", style: .cancel)
                    alert.addAction(alertAction)
                    self.present(alert, animated: true)
                    print("no url is provided for \(indexPath.row) revision!")
                    return
                }
                if let urlLink = URL(string: url) {
                    UIApplication.shared.open(urlLink)
                }
            } else {
                vc.indexRevisions = indexPath
                self.navigationController?.pushViewController(vc, animated: false)
            }
        }
    }
}
extension MinorViewController: UISearchBarDelegate, UISearchControllerDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchArray = allMinorVersions.filter {$0.prefix(searchText.count) == searchText}
        isSearching = true
        tableView.reloadData()
    }
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
            isSearching = false
            searchBar.text = ""
            tableView.reloadData()
        }
}
