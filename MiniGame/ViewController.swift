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
    moveViewViaPanAction(firtsViews: firstView, secondViews: secondView)
  }
  
  @IBAction func secondPanAction(_ gesture: UIPanGestureRecognizer) {
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
    moveViewViaPanAction(firtsViews: secondView, secondViews: thirdView)
  }
  
  @IBAction func thirdPanAction(_ gesture: UIPanGestureRecognizer) {
    
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
    moveViewViaPanAction(firtsViews: thirdView, secondViews: fourthView)
    
  }
  
  func moveViewViaPanAction(firtsViews: CustomView!, secondViews: CustomView!) {
    let firstViewFrame = firtsViews.frame
    let secondViewFrame = secondViews.frame
    
    for value in Int(secondViews.frame.minY)...Int(secondViews.frame.maxY) {
      if Int(firstViewFrame.origin.y) == value {
        secondViews.changeView = true
        firtsViews.isHidden = true
        print("View changed")
      }
    }
    print("View panned")
  }
  
}
