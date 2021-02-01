//
//  ViewController.swift
//  MiniGame
//
//  Created by Denis on 01.02.2021.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var firstView: CustomView!
  @IBOutlet weak var secondView: CustomView!
  @IBOutlet weak var thirdView: CustomView!
  @IBOutlet weak var fourthView: CustomView!
  @IBOutlet weak var fifthView: CustomView!
  @IBOutlet weak var sixthView: CustomView!
  @IBOutlet weak var seventhView: CustomView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func panAction(_ gesture: UIPanGestureRecognizer) {
    eatView(firtsViews: firstView, secondViews: secondView, gesture: gesture)
  }
  
  @IBAction func secondPanAction(_ gesture: UIPanGestureRecognizer) {
    eatView(firtsViews: secondView, secondViews: thirdView, gesture: gesture)
  }
  
  @IBAction func thirdPanAction(_ gesture: UIPanGestureRecognizer) {
    eatView(firtsViews: thirdView, secondViews: fourthView, gesture: gesture)
  }
  
  @IBAction func fourthPanAction(_ gesture: UIPanGestureRecognizer) {
    eatView(firtsViews: fourthView, secondViews: fifthView, gesture: gesture)
  }
  
  @IBAction func fifthPanAction(_ gesture: UIPanGestureRecognizer) {
    eatView(firtsViews: fifthView, secondViews: sixthView, gesture: gesture)
  }
  
  @IBAction func sixthPanAction(_ gesture: UIPanGestureRecognizer) {
    eatView(firtsViews: sixthView, secondViews: seventhView, gesture: gesture)
  }
  
  @IBAction func seventhPanAction(_ gesture: UIPanGestureRecognizer) {
    eatView(firtsViews: seventhView, secondViews: firstView, gesture: gesture)
  }
  
  func eatView(firtsViews: CustomView!, secondViews: CustomView!, gesture: UIPanGestureRecognizer) {
    let firstViewFrame = firtsViews.frame
    let secondViewFrame = secondViews.frame
    let hellperRange: CGFloat = 20
    
    let gestureTranslation = gesture.translation(in: view)
    
    guard let gestureView = gesture.view else {
      return
    }
    gestureView.center = CGPoint(
      x: gestureView.center.x + gestureTranslation.x,
      y: gestureView.center.y + gestureTranslation.y
    )
    gesture.setTranslation(.zero, in: view)
    guard gesture.state == .ended else {
      return
    }
    
    for yValue in Int(secondViewFrame.minY - hellperRange)...Int(secondViewFrame.maxY + hellperRange) {
      if Int(firstViewFrame.origin.y) == yValue {
        for xValue in Int(secondViewFrame.minX - hellperRange)...Int(secondViewFrame.maxX + hellperRange) {
          if Int(firstViewFrame.origin.x) == xValue {
            secondViews.changeView = true
            firtsViews.isHidden = true
            secondViews.superview?.bringSubviewToFront(secondViews)
            print("View changed")
          }
        }
      }
    }
    print("View panned")
  }
  
}
