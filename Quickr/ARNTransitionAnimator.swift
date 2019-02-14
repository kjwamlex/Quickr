//
//  ARNTransitionAnimator.swift
//  ARNTransitionAnimator
//
//  Created by xxxAIRINxxx on 2015/02/26.
//  Copyright (c) 2015 xxxAIRINxxx. All rights reserved.
//

import UIKit
import UIKit.UIGestureRecognizerSubclass

public enum ARNTransitionAnimatorDirection: Int {
    case top
    case bottom
    case left
    case right
}

public enum ARNTransitionAnimatorOperation: Int {
    case none
    case push
    case pop
    case present
    case dismiss
}

open class ARNTransitionAnimator: UIPercentDrivenInteractiveTransition {
    
    // animation setting
    
    open var usingSpringWithDamping : CGFloat = 1.0
    open var transitionDuration : TimeInterval = 0.5
    open var initialSpringVelocity : CGFloat = 0.1
    
    // interactive gesture
    
    open weak var gestureTargetView : UIView? {
        willSet {
            self.unregisterPanGesture()
        }
        didSet {
            self.registerPanGesture()
        }
    }
    open var panCompletionThreshold : CGFloat = 100.0
    open var direction : ARNTransitionAnimatorDirection = .bottom
    open var contentScrollView : UIScrollView? {
        didSet {
            if let _contentScrollView = self.contentScrollView {
                self.tmpBounces = _contentScrollView.bounces
            }
        }
    }
    open var interactiveType : ARNTransitionAnimatorOperation = .none {
        didSet {
            if self.interactiveType == .none {
                self.unregisterPanGesture()
            } else {
                self.registerPanGesture()
            }
        }
    }
    
    // handlers
    
    open var presentationBeforeHandler : ((_ containerView: UIView, _ transitionContext: UIViewControllerContextTransitioning) ->())?
    open var presentationAnimationHandler : ((_ containerView: UIView, _ percentComplete: CGFloat) ->())?
    open var presentationCancelAnimationHandler : ((_ containerView: UIView) ->())?
    open var presentationCompletionHandler : ((_ containerView: UIView, _ completeTransition: Bool) ->())?
    
    open var dismissalBeforeHandler : ((_ containerView: UIView, _ transitionContext: UIViewControllerContextTransitioning) ->())?
    open var dismissalAnimationHandler : ((_ containerView: UIView, _ percentComplete: CGFloat) ->())?
    open var dismissalCancelAnimationHandler : ((_ containerView: UIView) ->())?
    open var dismissalCompletionHandler : ((_ containerView: UIView, _ completeTransition: Bool) ->())?
    
    // private
    
    fileprivate weak var fromVC : UIViewController!
    fileprivate weak var toVC : UIViewController!
    
    fileprivate(set) var operationType : ARNTransitionAnimatorOperation
    fileprivate(set) var isPresenting : Bool = true
    fileprivate(set)  var isTransitioning : Bool = false
    
    fileprivate var gesture : UIPanGestureRecognizer?
    fileprivate var transitionContext : UIViewControllerContextTransitioning?
    fileprivate var panLocationStart : CGFloat = 0.0
    fileprivate var tmpBounces: Bool = true
    
    deinit {
        self.unregisterPanGesture()
    }
    
    // MARK: Constructor
    
    public init(operationType: ARNTransitionAnimatorOperation, fromVC: UIViewController, toVC: UIViewController) {
        self.operationType = operationType
        self.fromVC = fromVC
        self.toVC = toVC
        
        switch (self.operationType) {
        case .push, .present:
            self.isPresenting = true
        case .pop, .dismiss:
            self.isPresenting = false
        case .none:
            break
        }
    }
    
    // MARK: Private Methods
    
    fileprivate func registerPanGesture() {
        self.unregisterPanGesture()
        
        self.gesture = UIPanGestureRecognizer(target: self, action: #selector(ARNTransitionAnimator.handlePan(_:)))
        self.gesture!.delegate = self
        self.gesture!.maximumNumberOfTouches = 1
        
        if let _gestureTargetView = self.gestureTargetView {
            _gestureTargetView.addGestureRecognizer(self.gesture!)
        } else {
            switch (self.interactiveType) {
            case .push, .present:
                self.fromVC.view.addGestureRecognizer(self.gesture!)
            case .pop, .dismiss:
                self.toVC.view.addGestureRecognizer(self.gesture!)
            case .none:
                break
            }
        }
    }
    
    fileprivate func unregisterPanGesture() {
        if let _gesture = self.gesture {
            if let _view = _gesture.view {
                _view.removeGestureRecognizer(_gesture)
            }
            _gesture.delegate = nil
        }
        self.gesture = nil
    }
    
    fileprivate func fireBeforeHandler(_ containerView: UIView, transitionContext: UIViewControllerContextTransitioning) {
        if self.isPresenting {
            self.presentationBeforeHandler?(containerView, transitionContext)
        } else {
            self.dismissalBeforeHandler?(containerView, transitionContext)
        }
    }
    
    fileprivate func fireAnimationHandler(_ containerView: UIView, percentComplete: CGFloat) {
        if self.isPresenting {
            self.presentationAnimationHandler?(containerView, percentComplete)
        } else {
            self.dismissalAnimationHandler?(containerView, percentComplete)
        }
    }

    fileprivate func fireCancelAnimationHandler(_ containerView: UIView) {
        if self.isPresenting {
            self.presentationCancelAnimationHandler?(containerView)
        } else {
            self.dismissalCancelAnimationHandler?(containerView)
        }
    }
    
    fileprivate func fireCompletionHandler(_ containerView: UIView, completeTransition: Bool) {
        if self.isPresenting {
            self.presentationCompletionHandler?(containerView, completeTransition)
        } else {
            self.dismissalCompletionHandler?(containerView, completeTransition)
        }
    }
    
    fileprivate func animateWithDuration(_ duration: TimeInterval, containerView: UIView, completeTransition: Bool, completion: (() -> Void)?) {
        UIView.animate(
            withDuration: duration,
            delay: 0,
            usingSpringWithDamping: self.usingSpringWithDamping,
            initialSpringVelocity: self.initialSpringVelocity,
            options: .curveEaseOut,
            animations: {
                if completeTransition {
                    self.fireAnimationHandler(containerView, percentComplete: 1.0)
                } else {
                    self.fireCancelAnimationHandler(containerView)
                }
            }, completion: { finished in
                self.fireCompletionHandler(containerView, completeTransition: completeTransition)
                completion?()
        })
    }
    
    // MARK: Gesture
    
    func handlePan(_ recognizer: UIPanGestureRecognizer) {
        var window : UIWindow? = nil
        
        switch (self.interactiveType) {
        case .push, .present:
            window = self.fromVC.view.window
        case .pop, .dismiss:
            window = self.toVC.view.window
        case .none:
            return
        }
        
        var location = recognizer.location(in: window)
        location = location.applying(recognizer.view!.transform.inverted())
        var velocity = recognizer .velocity(in: window)
        velocity = velocity.applying(recognizer.view!.transform.inverted())
        
        if recognizer.state == .began {
            switch (self.direction) {
            case .top, .bottom:
                self.panLocationStart = location.y
            case .left, .right:
                self.panLocationStart = location.x
            }
            
            if let _contentScrollView = self.contentScrollView {
                if _contentScrollView.contentOffset.y <= 0.0 {
                    self.startGestureTransition()
                    _contentScrollView.bounces = false
                }
            } else {
                self.startGestureTransition()
            }
        } else if recognizer.state == .changed {
            var bounds = CGRect.zero
            switch (self.interactiveType) {
            case .push, .present:
                bounds = self.fromVC.view.bounds
            case .pop, .dismiss:
                bounds = self.toVC.view.bounds
            case .none:
                break
            }
            
            var animationRatio: CGFloat = 0.0
            switch self.direction {
            case .top:
                animationRatio = (self.panLocationStart - location.y) / bounds.height
            case .bottom:
                animationRatio = (location.y - self.panLocationStart) / bounds.height
            case .left:
                animationRatio = (self.panLocationStart - location.x) / bounds.width
            case .right:
                animationRatio = (location.x - self.panLocationStart) / bounds.width
            }
            
            if let _contentScrollView = self.contentScrollView {
                if self.isTransitioning == false && _contentScrollView.contentOffset.y <= 0 {
                    self.startGestureTransition()
                    self.contentScrollView!.bounces = false
                } else {
                    self.update(animationRatio)
                }
            } else {
                self.update(animationRatio)
            }
        } else if recognizer.state == .ended {
            var velocityForSelectedDirection: CGFloat = 0.0
            switch (self.direction) {
            case .top, .bottom:
                velocityForSelectedDirection = velocity.y
            case .left, .right:
                velocityForSelectedDirection = velocity.x
            }
            
            if velocityForSelectedDirection > self.panCompletionThreshold && (self.direction == .right || self.direction == .bottom) {
                self.finish()
            } else if velocityForSelectedDirection < -self.panCompletionThreshold && (self.direction == .left || self.direction == .top) {
                self.finish()
            } else {
                self.cancel()
            }
            self.resetGestureTransitionSetting()
        } else {
            self.resetGestureTransitionSetting()
            self.cancel()
        }
    }
    
    func startGestureTransition() {
        if self.isTransitioning == false {
            self.isTransitioning = true
            switch (self.interactiveType) {
            case .push:
                self.fromVC.navigationController?.pushViewController(self.toVC, animated: true)
            case .present:
                self.fromVC.present(self.toVC, animated: true, completion: nil)
            case .pop:
                self.toVC.navigationController?.popViewController(animated: true)
            case .dismiss:
                self.toVC.dismiss(animated: true, completion: nil)
            case .none:
                break
            }
        }
    }
    
    func resetGestureTransitionSetting() {
        self.isTransitioning = false
        if let _contentScrollView = self.contentScrollView {
            _contentScrollView.bounces = self.tmpBounces
        }
    }
}

// MARK: UIViewControllerAnimatedTransitioning

extension ARNTransitionAnimator: UIViewControllerAnimatedTransitioning {
    
    public func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return self.transitionDuration
    }
    
    public func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        self.transitionContext = transitionContext
        self.fireBeforeHandler(containerView, transitionContext: transitionContext)
        
        self.animateWithDuration(
            self.transitionDuration(using: transitionContext),
            containerView: containerView,
            completeTransition: true) {
                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    public func animationEnded(_ transitionCompleted: Bool) {
        self.transitionContext = nil
    }
}

// MARK: UIViewControllerTransitioningDelegate

extension ARNTransitionAnimator: UIViewControllerTransitioningDelegate {
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = true
        return self
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        self.isPresenting = false
        return self
    }
    
    public func interactionControllerForPresentation(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if self.gesture != nil && (self.interactiveType == .push || self.interactiveType == .present) {
            self.isPresenting = true
            return self
        }
        return nil
    }
    
    public func interactionControllerForDismissal(using animator: UIViewControllerAnimatedTransitioning) -> UIViewControllerInteractiveTransitioning? {
        if self.gesture != nil && (self.interactiveType == .pop || self.interactiveType == .dismiss) {
            self.isPresenting = false
            return self
        }
        return nil
    }
}

// MARK: UIViewControllerInteractiveTransitioning
/*
extension ARNTransitionAnimator: UIViewControllerInteractiveTransitioning {
    
    public override func startInteractiveTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        
        // FIXME : UINavigationController not called animator UIViewControllerTransitioningDelegate
        switch (self.interactiveType) {
        case .Push, .Present:
            self.isPresenting = true
        case .Pop, .Dismiss:
            self.isPresenting = false
        case .None:
            break
        }
        
        self.transitionContext = transitionContext
        self.fireBeforeHandler(containerView!, transitionContext: transitionContext)
    }
}

*/


extension ARNTransitionAnimator{
    
    open override func startInteractiveTransition(_ transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView
        
        // FIXME : UINavigationController not called animator UIViewControllerTransitioningDelegate
        switch (self.interactiveType) {
        case .push, .present:
            self.isPresenting = true
        case .pop, .dismiss:
            self.isPresenting = false
        case .none:
            break
        }
        
        self.transitionContext = transitionContext
        self.fireBeforeHandler(containerView, transitionContext: transitionContext)
    }
    
}

// MARK: UIPercentDrivenInteractiveTransition

extension ARNTransitionAnimator {
    
    open override func update(_ percentComplete: CGFloat) {
        super.update(percentComplete)
        if let transitionContext = self.transitionContext {
            let containerView = transitionContext.containerView
            self.fireAnimationHandler(containerView, percentComplete: percentComplete)
        }
    }
    
    open override func finish() {
        super.finish()
        if let transitionContext = self.transitionContext {
            let containerView = transitionContext.containerView
            self.animateWithDuration(
                self.transitionDuration(using: transitionContext),
                containerView: containerView,
                completeTransition: true) {
                    transitionContext.completeTransition(true)
            }
        }
    }
    
    open override func cancel() {
        super.cancel()
        if let transitionContext = self.transitionContext {
            let containerView = transitionContext.containerView
            self.animateWithDuration(
                self.transitionDuration(using: transitionContext),
                containerView: containerView,
                completeTransition: false) {
                    transitionContext.completeTransition(false)
            }
        }
    }
}

// MARK: UIGestureRecognizerDelegate

extension ARNTransitionAnimator: UIGestureRecognizerDelegate {
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldRecognizeSimultaneouslyWith otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return self.contentScrollView != nil ? true : false
    }
    
    public func gestureRecognizer(_ gestureRecognizer: UIGestureRecognizer, shouldBeRequiredToFailBy
        otherGestureRecognizer: UIGestureRecognizer) -> Bool {
        return false
    }
}
