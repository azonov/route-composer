//
//  OperationDetailsViewController.swift
//  RouteComposer_Example
//
//  Created by Andrey Zonov on 25.02.2023.
//  Copyright © 2023 Evgeny Kazaev. All rights reserved.
//

import UIKit

class OperationDetailsViewController: UIViewController {
    
    var operationId: Operation.OperationID!
    
    init(operationId: Operation.OperationID) {
        self.operationId = operationId
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
        setupView(text: operationId)
        view.backgroundColor = .white
    }
    
    private func setupView(text: String) {
        let label = UILabel()
        label.text = text
        label.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(label)
        view.centerXAnchor.constraint(equalTo: label.centerXAnchor).isActive = true
        view.centerYAnchor.constraint(equalTo: label.centerYAnchor).isActive = true
    }
}
