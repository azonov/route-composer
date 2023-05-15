//
//  OperationsListContextTask.swift
//  RouteComposer_Example
//
//  Created by Andrey Zonov on 25.02.2023.
//  Copyright © 2023 Evgeny Kazaev. All rights reserved.
//

import Foundation
import RouteComposer
import UIKit

struct OperationsListContextTask<VC: UIViewController, C>: ContextTask {

    func perform(on viewController: VC, with context: C) throws {
        guard let viewController = viewController as? OperationsListViewController,
              let context = context as? OperationsListFactory.Context
        else {
            throw RoutingError.generic(.init("\(self)"))
        }
        viewController.feed = context
    }
}
