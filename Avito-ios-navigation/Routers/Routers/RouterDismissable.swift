import UIKit

/// Методы, чтобы вернуться на экран модуля, показавшего экран текущего модуля
public protocol RouterDismissable: class {
    func dismissCurrentModule()
    func dismissCurrentModule(completion completion: (() -> Void)?)
}

// MARK: - RouterDismissable Default Impl
public extension RouterDismissable where Self: RouterPresentable, Self: RouterIdentifiable {
    func dismissCurrentModule(completion completion: (() -> Void)?) {
        dismissCurrentModuleImpl(completion: completion)
    }
    
    func dismissCurrentModule() {
        dismissCurrentModuleImpl(completion: nil)
    }
    
    private func dismissCurrentModuleImpl(completion completion: (() -> Void)?) {
            CATransaction.begin()
            CATransaction.setCompletionBlock(completion) // дожидаемся анимации сокрытия текущего модуля
            presentingTransitionsHandler?.undoTransitionWith(transitionId: transitionId)
            CATransaction.commit()
    }
}