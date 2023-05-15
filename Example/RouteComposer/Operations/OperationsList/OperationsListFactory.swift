//
//  OperationsListFactory.swift
//  RouteComposer_Example
//
//  Created by Andrey Zonov on 25.02.2023.
//  Copyright © 2023 Evgeny Kazaev. All rights reserved.
//

import Foundation
import RouteComposer
import UIKit

struct OperationsListFactory: Factory {
    
    func build(with context: OperationsFeed) throws -> some UIViewController {
        OperationsListViewController(feed: context)
    }
}
