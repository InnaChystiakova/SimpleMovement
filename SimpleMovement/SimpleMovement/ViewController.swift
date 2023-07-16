//
//  ViewController.swift
//  SimpleMovement
//
//  Created by Инна Чистякова on 16.07.2023.
//

import UIKit

class ViewController: UIViewController {
    
    // MARK: Constants

    let side: CGFloat = 100
    let radius: CGFloat = 12

    // MARL: Properties

    let movementView = UIView(frame: .zero)

    var animator: UIDynamicAnimator!
    var snap: UISnapBehavior!

    // MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()

        movementView.center.x = view.center.x
        movementView.center.y = view.center.y
        movementView.frame.size = CGSize(width: side, height: side)
        movementView.backgroundColor = .systemMint
        movementView.layer.cornerRadius = radius
        view.addSubview(movementView)
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(movement(sender:)))
        view.addGestureRecognizer(tapGesture)

        animator = UIDynamicAnimator(referenceView: view)
    }

    @objc func movement(sender: UITapGestureRecognizer) {
        let tapPoint = sender.location(in: view)

        if (snap != nil) {
            animator.removeBehavior(snap)
        }

        snap = UISnapBehavior(item: movementView, snapTo: tapPoint)
        animator.addBehavior(snap)
    }
}

