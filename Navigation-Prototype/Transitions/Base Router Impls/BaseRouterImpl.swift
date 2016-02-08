import Foundation

/// Обычный роутер, работающий только одним обработчиком переходов
class BaseRouterImpl {
    private weak var transitionsHandlerPrivate: TransitionsHandler?
    private let transitionIdPrivate: TransitionId
    private weak var presentingTransitionsHandlerPrivate: TransitionsHandler?
    private let transitionsCoordinatorPrivate: TransitionsCoordinator
    private let transitionIdGeneratorPrivate: TransitionIdGenerator
    
    init(
        transitionsHandler: TransitionsHandler,
        transitionId: TransitionId,
        presentingTransitionsHandler: TransitionsHandler?,
        transitionsCoordinator: TransitionsCoordinator,
        transitionIdGenerator: TransitionIdGenerator)
    {
        self.transitionIdPrivate = transitionId
        self.transitionsHandlerPrivate = transitionsHandler
        self.presentingTransitionsHandlerPrivate = presentingTransitionsHandler
        self.transitionsCoordinatorPrivate = transitionsCoordinator
        self.transitionIdGeneratorPrivate = transitionIdGenerator
    }
}

// MARK: - RouterIdentifiable
extension BaseRouterImpl: RouterIdentifiable {
    var transitionId: TransitionId {
        return transitionIdPrivate
    }
}

// MARK: - RouterPresentable
extension BaseRouterImpl: RouterPresentable {
    weak var presentingTransitionsHandler: TransitionsHandler? {
        return presentingTransitionsHandlerPrivate
    }
}

// MARK: - MasterRouterTransitionable
extension BaseRouterImpl: MasterRouterTransitionable {
    var masterTransitionsHandler: TransitionsHandler? {
        return transitionsHandlerPrivate
    }
}

// MARK: - RouterTransitionable
extension BaseRouterImpl: RouterTransitionable {
    var transitionsHandler: TransitionsHandler? {
        return transitionsHandlerPrivate
    }
}

// MARK: - TransitionsCoordinatorStorer
extension BaseRouterImpl: TransitionsCoordinatorStorer {
    var transitionsCoordinator: TransitionsCoordinator {
        return transitionsCoordinatorPrivate
    }
}

// MARK: - TransitionsGeneratorStorer
extension BaseRouterImpl: TransitionsGeneratorStorer {
    var transitionIdGenerator: TransitionIdGenerator {
        return transitionIdGeneratorPrivate
    }
}

// MARK: - MasterRouter
extension BaseRouterImpl: MasterRouter {}

// MARK: - Router
extension BaseRouterImpl: Router {}

// MARK: - RouterFocusable
extension BaseRouterImpl: RouterFocusable {}

// MARK: - RouterDismisable
extension BaseRouterImpl: RouterDismisable  {}