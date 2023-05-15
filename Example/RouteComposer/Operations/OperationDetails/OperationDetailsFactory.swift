//
//  OperationDetailsFactory.swift
//  RouteComposer_Example
//
//  Created by Andrey Zonov on 25.02.2023.
//  Copyright © 2023 Evgeny Kazaev. All rights reserved.
//

import Foundation
import RouteComposer
import UIKit

struct OperationDetailsFactory: Factory {
    
    struct Context {
        let operationId: Operation.OperationID
    }
    
    func build(with context: Context) throws -> some UIViewController {
        OperationDetailsViewController(operationId: context.operationId)
    }
}
