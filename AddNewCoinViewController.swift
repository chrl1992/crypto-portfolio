//
//  AddNewCoinViewController.swift
//  kraken-portfolio
//
//  Created by Christian Larsen on 03/03/2018.
//  Copyright © 2018 Christian Larsen. All rights reserved.
//

import UIKit
class AddNewCoinViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource, UITextFieldDelegate{

    //variables
    let coins = ["Ethereum", "Bitcoin", "Bitcoin Cash", "Litecoin", "Ripple", "Zcash"]
    var coinPicker = UIPickerView()
    
    @IBOutlet weak var plusImage: UIImageView!
    @IBOutlet weak var AddBtn: UIButton!
    @IBOutlet weak var imageBg: UIImageView!
    @IBOutlet weak var coinPickerTextField: UITextField!
    @IBOutlet weak var amountLabel: UITextField!
    @IBOutlet weak var buyingPriceTextfield: UITextField!
    

    @IBAction func AddBtn(_ sender: UIButton) {
        
    }
   
    override func viewDidLoad() {
        super.viewDidLoad()

        
        imageBg.image = UIImage(named: "bg")
        AddBtn.layer.borderWidth = 1.0
        AddBtn.layer.cornerRadius = 20
        
        //to hide keyboard when pression outside keyboard
        self.coinPickerTextField.delegate = self
        self.amountLabel.delegate = self
        self.buyingPriceTextfield.delegate = self
        
        
        //pickerView settings
        coinPicker.delegate=self
        coinPicker.dataSource = self
        coinPicker.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        coinPickerTextField.inputView = coinPicker
        
        
        
        plusImage.loadGif(name: "rocket-taking-off")
        //plusImage.image = UIImage(named: "rocket-taking-off")
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    //Functions for pickerView
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return coins.count;
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        coinPickerTextField.text = coins[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return coins[row]
    }
    
    //To hide keyboard when pressing outside keyboard
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        amountLabel.resignFirstResponder()
        coinPickerTextField.resignFirstResponder()
        buyingPriceTextfield.resignFirstResponder()

    }
    
    
    
    
    
    
    
    
    
}
