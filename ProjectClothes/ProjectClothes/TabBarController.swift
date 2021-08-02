//
//  TabBarController.swift
//  ProjectClothes
//
//  Created by Heitor Feijó Kunrath on 29/07/21.
//

import UIKit


class TabBarController: UITabBarController, UITabBarControllerDelegate, UIViewControllerTransitioningDelegate{
    let addCho = AddChoice()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.delegate = self
        //        self.tabBarController?.delegate = self
        // Do any additional setup after loading the view.
    }
    
  
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
       
        if viewController.isKind(of: AddNavigationController.self) {

//
//            let storyboard = UIStoryboard(name: "addStoryboard", bundle: nil)
//            let newVC = storyboard.instantiateViewController(identifier: "TesteViewController") as! TesteViewController
//
            let t2 = CustomModalViewController()
            t2.modalPresentationStyle = .overCurrentContext
            
            tabBarController.present(t2, animated: false)
            
            
            
            //            self.performSegue(withIdentifier: "addStoryboard", sender: tabBarController)
            return false
        }
        
        return true
    }
    
    
//    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
//            return HalfSizePresentationController(presentedViewController: presented, presenting: presentingViewController)
//        }
    
    
    
    
}

//class HalfSizePresentationController: UIPresentationController {
//    override var frameOfPresentedViewInContainerView: CGRect {
//        guard let bounds = containerView?.bounds else { return .zero }
//        return CGRect(x: 0, y: bounds.height / 2, width: bounds.width, height: bounds.height / 2)
//    }
//}
//
//
//
//class DismissAnimator : NSObject {
//   let transitionDuration = 0.6
//}

//extension DismissAnimator : UIViewControllerAnimatedTransitioning {
//    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
//       transitionDuration
//    }
//
//    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
//        guard
//            let fromVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.from),
//            let toVC = transitionContext.viewController(forKey: UITransitionContextViewControllerKey.to)
//
//            else {
//                return
//        }
//        let containerView = transitionContext.containerView
//        if transitionContext.transitionWasCancelled {
//          containerView.insertSubview(toVC.view, belowSubview: fromVC.view)
//        }
//        let screenBounds = UIScreen.main.bounds
//        let bottomLeftCorner = CGPoint(x: 0, y: screenBounds.height)
//        let finalFrame = CGRect(origin: bottomLeftCorner, size: screenBounds.size)
//
//        UIView.animateWithDuration(
//            transitionDuration(transitionContext),
//            animations: {
//                fromVC.view.frame = finalFrame
//            },
//            completion: { _ in
//                transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
//            }
//        )
//    }
//}

