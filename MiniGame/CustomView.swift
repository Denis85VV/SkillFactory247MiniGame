//
//  CustomView.swift
//  MiniGame
//
//  Created by Denis on 01.02.2021.
//

import Foundation
import UIKit

@IBDesignable class CustomView: UIView {
  
  var workingView: UIView!
  var xibName: String = "CustomView"
  
  let darkBlue = UIColor(red: 0, green: 0, blue: 1, alpha: 1)
  let lightBlue = UIColor(red: 0.1, green: 0.5, blue: 1, alpha: 1)
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    setCustomView()
    backgroundColor = .clear
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    setCustomView()
    backgroundColor = .clear
  }
  
  func getFromXib() -> UIView {
    let bundle = Bundle(for: type(of: self))
    let xib = UINib(nibName: xibName, bundle: bundle)
    let view = xib.instantiate(withOwner: self, options: nil).first as! UIView
    return view
  }
  
  func setCustomView() {
    workingView = getFromXib()
    workingView.frame = bounds
    workingView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    workingView.layer.cornerRadius = workingView.frame.height / 2
    workingView.backgroundColor = .some(lightBlue)
    sendSubviewToBack(workingView)
    
    addSubview(workingView)
  }
  
  @IBInspectable var changeView: Bool = false {
    didSet {
      if changeView {
        workingView.backgroundColor = .some(darkBlue)
        workingView.frame = CGRect(x: 0, y: 0, width: self.frame.height * 1.2, height: self.frame.height * 1.2)
        workingView.layer.cornerRadius = workingView.frame.height / 2
        bringSubviewToFront(workingView)
        backgroundColor = .clear
      }
    }
  }
  
}
