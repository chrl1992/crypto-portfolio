//
//  ViewController.swift
//  kraken-portfolio
//
//  Created by Christian Larsen on 03/03/2018.
//  Copyright © 2018 Christian Larsen. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func addNewCoinBtn(_ sender: Any) {
        //performSegue skifter view til min 'tilføj coin' view
        performSegue(withIdentifier: "AddNewCoinSegue", sender: self)
    }
    @IBOutlet weak var IM: UIImageView!
    @IBOutlet weak var helloWorldLabel: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        IM.image = UIImage(named: "top")
        print()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    let a = Api().fetch()
}
