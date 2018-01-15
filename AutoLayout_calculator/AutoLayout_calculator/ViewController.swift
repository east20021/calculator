//
//  ViewController.swift
//  AutoLayout_calculator
//
//  Created by lee on 2018. 1. 11..
//  Copyright © 2018년 smith. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    enum Math: Int {
        case plus = 13
        case minus = 14
        case multiply = 15
        case divide = 16
    }
    
    var numberOnScreen: Double = 0
    var previousNumber: Double = 0
    var isPerformingMath: Bool = false
    var CheckResultValue: Bool = false
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
    
    func clear() {
        resetButtonImage()
        screenLabel.text = ""
        previousNumber = 0
        CheckResultValue = false
        isPerformingMath = false
    }
    
   
    @IBAction func appleButton(_ sender: Any) {
        let popupVC: PopUpViewController = UIStoryboard(name: "Popup", bundle: nil).instantiateViewController(withIdentifier: "popupVC") as! PopUpViewController
        
        popupVC.modalPresentationStyle = .overCurrentContext
        
        self.present(popupVC, animated: false) { }
        
        
    }
    @IBAction func numberButton(_ sender: UIButton) {
        
        if isPerformingMath == false && CheckResultValue == true {

            clear()
        }
        
        screenLabel.text = screenLabel.text! + String(sender.tag - 1)
        numberOnScreen = Double(screenLabel.text!)!
    }
    
    @IBAction func functionButton(_ sender: UIButton) {
        
        if screenLabel.text != "" && sender.tag != 11 && sender.tag != 12 {
            previousNumber = Double(screenLabel.text!)!
            screenLabel.text = ""
            isPerformingMath = true
            resetButtonImage()

            
            switch sender.tag {
            case Math.plus.rawValue:
                plusButton.setImage(UIImage(named: "number(+)_on"), for: .normal)
            case Math.minus.rawValue:
                 minusButton.setImage(UIImage(named: "number(-)_on"), for: .normal)
            case Math.multiply.rawValue:
                multiplyButton.setImage(UIImage(named: "number(×)_on"), for: .normal)
            case Math.divide.rawValue:
                divisionButton.setImage(UIImage(named: "number(÷)_on"), for: .normal)
            default:
                print("Math error")
            }
            
            
            
            
            operation = sender.tag
        } else if sender.tag == 12 { // =(button)
            resetButtonImage()
            var doubleValue: Double = 0
            isPerformingMath = false
            
            switch operation {
            case Math.plus.rawValue:
                doubleValue = previousNumber + numberOnScreen
            case Math.minus.rawValue:
                doubleValue = previousNumber - numberOnScreen
            case Math.multiply.rawValue:
                doubleValue = previousNumber * numberOnScreen
            case Math.divide.rawValue:
                doubleValue = previousNumber / numberOnScreen
            default:
                print("Math error")
            }
            
            if doubleValue != 0 {
                CheckResultValue = true
            }

            
            if floor(doubleValue) == doubleValue {
                screenLabel.text = String(Int(doubleValue))
            } else {
                screenLabel.text = String(doubleValue)
            }
            
            
        } else if sender.tag == 11 { // C(button)
            clear()
            
        }
        
        
    }
    
   
}
