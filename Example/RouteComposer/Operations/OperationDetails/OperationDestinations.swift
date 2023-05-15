//
//  OperationDestinations.swift
//  RouteComposer_Example
//
//  Created by Andrey Zonov on 25.02.2023.
//  Copyright © 2023 Evgeny Kazaev. All rights reserved.
//

import Foundation
import RouteComposer
import UIKit

extension DestinationStep {
    
    static var operationDetails: DestinationStep<
        OperationDetailsFactory.ViewController, OperationDetailsFactory.Context> {
            StepAssembly(
                finder: NilFinder(),
                factory: OperationDetailsFactory()
            )
            .using(GeneralAction.presentModally(presentationStyle: .pageSheet))
            .from(GeneralStep.current())
            .assemble()
        }
    
    static var operationList: DestinationStep<
        OperationsListFactory.ViewController, OperationsListFactory.Context> {
            StepAssembly(
                finder: NilFinder(),
                factory: OperationsListFactory()
            )
            .using(GeneralAction.presentModally(presentationStyle: .pageSheet))
            .from(GeneralStep.current())
            .assemble()
        }
    
    private static var operations: DestinationStep<
        OperationsListFactory.ViewController, Any?> {
            StepAssembly(
                finder: NilFinder(),
                factory: ClassFactory()
            )
            .adding(OperationsListContextTask<OperationsListFactory.ViewController, Any?>())
            .using(GeneralAction.presentModally(presentationStyle: .pageSheet))
            .from(GeneralStep.current())
            .assemble()
        }
    
    static var operationDetailsOverOperationList: DestinationStep<
        OperationDetailsFactory.ViewController, Any?> {
            StepAssembly(
                finder: NilFinder(),
                factory: ClassFactory()
            )
            .adding(OperationDetailsContextTask<OperationDetailsFactory.ViewController, Any?>())
            .using(GeneralAction.presentModally(presentationStyle: .pageSheet))
            .from(operations)
            .assemble()
        }
    
    static var operationListInNavigation: DestinationStep<OperationsListFactory.ViewController, OperationsListFactory.Context> {
        StepAssembly(
            finder: NilFinder(),
            factory: OperationsListFactory()
        )
        .adding(OperationsListContextTask<OperationsListFactory.ViewController, OperationsListFactory.Context>())
        .using(ExampleNavigationController.push())
        .from(NavigationControllerStep())
        .using(GeneralAction.presentModally(presentationStyle: .pageSheet))
        .from(GeneralStep.current())
        .assemble()
    }
}
