//
//  ViewController.swift
//  AutoLayout_calculator
//
//  Created by lee on 2018. 1. 11..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var performingMath: Bool = false
    var operation = 0


    @IBOutlet weak var screenLabel: UILabel!
    @IBOutlet weak var minusButton: UIButton!
    @IBOutlet weak var divisionButton: UIButton!
    @IBOutlet weak var multiplyButton: UIButton!
    @IBOutlet weak var plusButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func resetButtonImage() {
        plusButton.setImage(UIImage(named: "number(+)"), for: .normal)
        minusButton.setImage(UIImage(named: "number(-)"), for: .normal)
        multiplyButton.setImage(UIImage(named: "number(×)"), for: .normal)
        divisionButton.setImage(UIImage(named: "number(÷) "), for: .normal)
    }
    
   
    @IBAction func appleButton(_ sender: Any) {
        let popupVC: PopUpViewController = UIStoryboard(name: "Popup", bundle: nil).instantiateViewController(withIdentifier: "popupVC") as! PopUpViewController
        
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false) { }
        
        
    }
    @IBAction func numberButton(_ sender: UIButton) {
        screenLabel.text = screenLabel.text! + String(sender.tag - 1)
        numberOnScreen = Double(screenLabel.text!)!
    }
    
    @IBAction func functionButton(_ sender: UIButton) {
        
        if screenLabel.text != "" && sender.tag != 11 && sender.tag != 12 {
            previousNumber = Double(screenLabel.text!)!
            screenLabel.text = ""
            
            if sender.tag == 13 {//plus
                resetButtonImage()
                plusButton.setImage(UIImage(named: "number(+)_on"), for: .normal)
            } else if sender.tag == 14 {//minus
                resetButtonImage()
                minusButton.setImage(UIImage(named: "number(-)_on"), for: .normal)
            } else if sender.tag == 15 {//multiply
                resetButtonImage()
                multiplyButton.setImage(UIImage(named: "number(×)_on"), for: .normal)
            } else if sender.tag == 16 {//divide
                resetButtonImage()
                divisionButton.setImage(UIImage(named: "number(÷)_on"), for: .normal)
            }
            
            operation = sender.tag
        } else if sender.tag == 12 { // =(button)
            resetButtonImage()
            var doubleValue: Double = 0
            
            if operation == 13 {
                doubleValue = previousNumber + numberOnScreen
            } else if operation == 14 {
                 doubleValue = previousNumber - numberOnScreen
            } else if operation == 15 {
                 doubleValue = previousNumber * numberOnScreen
            } else if operation == 16 {
                 doubleValue = previousNumber / numberOnScreen
            } else {
            }

            
            if floor(doubleValue) == doubleValue {
                print(String(Int(doubleValue)))
                screenLabel.text = String(Int(doubleValue))
            } else {
                screenLabel.text = String(doubleValue)
            }
            
        } else if sender.tag == 11 { // C(button)
            resetButtonImage()
            screenLabel.text = ""
            previousNumber = 0
            
        }
        
        
    }
    
   
}
