//
//  OperationsListViewController.swift
//  RouteComposer_Example
//
//  Created by Andrey Zonov on 25.02.2023.
//  Copyright © 2023 Evgeny Kazaev. All rights reserved.
//

import UIKit

class OperationsListViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var feed: OperationsFeed!
    
    init(feed: OperationsFeed) {
        self.feed = feed
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        view.backgroundColor = .white
        
    }
    
    private func setupView() {
        title = "Список операций"
        let table = UITableView()
        table.dataSource = self
        table.delegate = self
        table.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(table)
        view.leftAnchor.constraint(equalTo: table.leftAnchor).isActive = true
        view.rightAnchor.constraint(equalTo: table.rightAnchor).isActive = true
        view.topAnchor.constraint(equalTo: table.topAnchor).isActive = true
        view.bottomAnchor.constraint(equalTo: table.bottomAnchor).isActive = true
        
        navigationItem.rightBarButtonItem = .init(title: "Все операции", style: .plain, target: self, action: #selector(allTapped))
    }
    
    @objc func allTapped() {
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        feed.operationsCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .value1, reuseIdentifier: "\(self)")
        cell.textLabel?.text = indexPath.row == 0 ? feed.highlightedOperationId : "00\(indexPath.row + 1)"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        try? router.navigate(to: .operationDetails, with: .init(operationId: "\(indexPath.row)"))
    }
}
