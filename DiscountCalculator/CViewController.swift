//
//  CViewController.swift
//  DiscountCalculator
//
//  Created by Chao Zhang on 3/10/17.
//  Copyright © 2017 Chao Zhang. All rights reserved.
//

import UIKit
var Price:Float = 0.0
var DollarOff:Float = 0.0
var Discount:Float = 0.0
var OtherDiscount:Float = 0.0
var Tax:Float = 0.0
var OraginalPrice:Float = 0.0
var DiscountPrice:Float = 0.0


class CViewController: UIViewController,UITextFieldDelegate
{
    
    
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var dollarOffLabel: UILabel!
    @IBOutlet weak var discountLabel: UILabel!
    @IBOutlet weak var otherLabel: UILabel!
    @IBOutlet weak var taxLabel: UILabel!
    @IBOutlet weak var originalPriceLabel: UILabel!
    @IBOutlet weak var discountPriceLabel: UILabel!
    @IBOutlet weak var priceTextField: UITextField!
    @IBOutlet weak var dollarsOffTextField: UITextField!
    @IBOutlet weak var discountTextField: UITextField!
    @IBOutlet weak var otherTextField: UITextField!
    @IBOutlet weak var taxTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
 
        let swipeLeft:
        UISwipeGestureRecognizer = UISwipeGestureRecognizer(target:self, action: #selector(handleSwipe))
        swipeLeft.direction = UISwipeGestureRecognizerDirection.left
        view.addGestureRecognizer(swipeLeft)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func CalUIButton(_ sender: UIButton) {
    
    
        if priceTextField.text == "" || dollarsOffTextField.text == "" || discountTextField.text == "" || otherTextField.text == "" || taxTextField.text == "" {
            originalPriceLabel.text = "0.0"
            discountPriceLabel.text = "0.0"}
        else{
                
            Price = Float(priceTextField.text!)!
            DollarOff = Float(dollarsOffTextField.text!)!
            Discount = Float(discountTextField.text!)!
            OtherDiscount = Float(otherTextField.text!)!
            Tax = Float(taxTextField.text!)!
            
            OraginalPrice = (Tax/100+1)*Price
            DiscountPrice = (Tax/100+1)*Price - DollarOff - Price*(Discount/100+OtherDiscount/100)
            originalPriceLabel.text = "Original Price $"+"\(OraginalPrice)"
            discountPriceLabel.text = "Discount Price $"+"\(DiscountPrice)"

            
            }
        }
    
    @IBAction func hiddenButton(_ sender: Any) {
        
        
        priceTextField.resignFirstResponder()
        dollarsOffTextField.resignFirstResponder()
        discountTextField.resignFirstResponder()
        otherTextField.resignFirstResponder()
        taxTextField.resignFirstResponder()

    }
    

    @IBAction func CalculateUIButton(_ sender: UIButton) {
    }
        // Dispose of any resources that can be recreated.
    
    
    func handleSwipe(_sender:UIGestureRecognizer){
        self.performSegue(withIdentifier: "aaa", sender:self)
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destVC = segue.destination as! RViewController
        
       destVC.OP = OraginalPrice
       destVC.YP = DiscountPrice
       destVC.YS = OraginalPrice - DiscountPrice
        
    }

}
