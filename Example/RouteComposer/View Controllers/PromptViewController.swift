//
// RouteComposer
// PromptViewController.swift
// https://github.com/ekazaev/route-composer
//
// Created by Eugene Kazaev in 2018-2022.
// Distributed under the MIT license.
//
// Become a sponsor:
// https://github.com/sponsors/ekazaev
//

import Foundation
import RouteComposer
import UIKit

class PromptViewController: UIViewController, ExampleAnalyticsSupport {

    let screenType = ExampleScreenTypes.welcome

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func operationDetails() {
        try? router.navigate(to: .operationDetails, with: .init(operationId: "001"))
    }
    
    @IBAction func operationsList() {
        try? router.navigate(to: .operationList, with: .init(highlightedOperationId: "001", operationsCount: 20))
    }
    
    @IBAction func operationDetailsOverOperationsList() {
        try? router.navigate(to: .operationDetailsOverOperationList,
                             with: OperationsFeed(highlightedOperationId: "001", operationsCount: 20))
    }
    
    @IBAction func operationListInNavController() {
        try? router.navigate(to: .operationListInNavigation,
                             with: OperationsFeed(highlightedOperationId: "001", operationsCount: 20))
    }
}
