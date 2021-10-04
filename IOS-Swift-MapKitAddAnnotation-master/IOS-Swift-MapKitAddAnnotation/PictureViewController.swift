//
//  PictureViewController.swift
//  IOS-Swift-MapKitAddAnnotation
//
//  Created by Yacht Intelligence MAC 2 on 9/15/21.
//  Copyright © 2021 Pooya. All rights reserved.
//

import UIKit

class PictureViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView! // Image view

       lazy var longPress = UILongPressGestureRecognizer(target: self, action: #selector(didLongPressScreen)) // long press gesture

       // MARK: LifeCycle
       override func viewDidLoad() {
           super.viewDidLoad()
       }

       override func viewDidAppear(_ animated: Bool) {
           super.viewDidAppear(animated)
           setup()
       }

       // MARK: Functions
       private func setup() {
           imageView.image = UIImage(named: "photo")

           imageView.addGestureRecognizer(longPress) // Adding gesture recognizer
           imageView.isUserInteractionEnabled = true // ImageViews are not user interactive by default

       }

       // UILongPressGestureRecognizer Action
       @objc func didLongPressScreen(_ sender: UILongPressGestureRecognizer) {
           let location = sender.location(in: self.view) //Getting location

           DispatchQueue.main.async {
               let pointer = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 10))
            
            
               pointer.backgroundColor = .red
               pointer.center = location // Setting the center of the view to the x,y coordinates of the long press
               self.view.addSubview(pointer) // Adding the UIView to the view
           }
       }


}
