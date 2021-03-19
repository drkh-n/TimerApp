//
//  ViewController.swift
//  Timer
//
//  Created by Darkhan on 19.03.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextField!
    @IBAction func buttonView(_ sender: Any) {
        let secondView = (storyboard?.instantiateViewController(identifier: "SecondVC")) as! SecondViewController
        let time = Int(textView.text!) ?? 0
        secondView.maxTime = time
        self.navigationController?.pushViewController(secondView, animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

