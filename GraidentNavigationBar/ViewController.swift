//
//  ViewController.swift
//  GraidentNavigationBar
//
//  Created by Shiju Varghese on 15/07/18.
//  Copyright © 2018 Shiju. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
   
    self.title = "Gradient Navigation Bar"
    
    if let navFrame = self.navigationController?.navigationBar.frame {
      
      //Create a new frame with the default offset of the status bar
      let newframe = CGRect(origin: .zero, size: CGSize(width: navFrame.width, height: (navFrame.height + UIApplication.shared.statusBarFrame.height) ))
      
      let image = gradientWithFrametoImage(frame: newframe, colors: [UIColor.red.cgColor, UIColor.blue.cgColor])!
      
      self.navigationController?.navigationBar.barTintColor = UIColor(patternImage: image)
      
    }
  }

  
  func gradientWithFrametoImage(frame: CGRect, colors: [CGColor]) -> UIImage? {
    let gradient: CAGradientLayer  = CAGradientLayer(layer: self.view.layer)
    gradient.frame = frame
    gradient.colors = colors
    UIGraphicsBeginImageContext(frame.size)
    gradient.render(in: UIGraphicsGetCurrentContext()!)
    let image = UIGraphicsGetImageFromCurrentImageContext()
    UIGraphicsEndImageContext()
    return image
  }

}

