//
//  ViewController.swift
//  StoryboardApp Chapter 14
//
//  Created by Wallace Wang on 11/2/21.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBSegueAction func openSwiftUIView(_ coder: NSCoder) -> UIViewController? {
        return UIHostingController(coder: coder, rootView: SwiftUIView(name: "Nancy"))
    }
    
}

