//
//  PopUpViewController.swift
//  AutoLayout_calculator
//
//  Created by lee on 2018. 1. 13..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class PopUpViewController: UIViewController {

    @IBOutlet weak var popupHeight: NSLayoutConstraint!
    @IBOutlet weak var popupImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        
    }
    
    override func viewDidLayoutSubviews() {
        let ratio = (popupImageView.image?.size.width)! / popupImageView.frame.size.width
        let calcHeight = (popupImageView.image?.size.height)! / ratio
        
        popupHeight.constant = calcHeight
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
