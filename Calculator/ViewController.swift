//
//  ViewController.swift
//  Calculator
//
//  Created by Karen Hernandez on 2/19/21.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var displayLabel: UILabel!
    
    var flag: Bool = false;
    var sum: Int = 0;
    var flagSum: Bool = false; //To keep the sum keep going
    var flagContinue: Bool = false; //When = is pressed and we want to continue
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func processNumber(_ sender: UIButton){
        if let numberText = sender.titleLabel?.text {
            if (flag == true || displayLabel.text == "0" || flagContinue == true){
                displayLabel.text = numberText
                flag = false;
            } else if (flagContinue == true){
                displayLabel.text = numberText
                flag = false;
            }
            else {
                displayLabel.text = displayLabel.text! + numberText
            }
        }
    }
    
    @IBAction func processOperation(_ sender: UIButton){
        
        //ASSIGN VALUE TO WHATEVER IS IN THE LABEL
        let num = Int(displayLabel.text ?? "0")
        
        //If the + button has been pressed before, it enters the first if. For the display to be updated and display the accumulated sum.
        if (sender.titleLabel?.text == "+" && flagSum == true){
            sum = sum + (num ?? 0);
            flag = true;
            displayLabel.text = String(sum);
        }
        //This else is for the first SUM, and prevent the "AC" button from entering in the if before. 
        else if (sender.titleLabel?.text == "+"){
            sum = sum + (num ?? 0);
            flag = true;
            flagSum = true;
        }
        else if (sender.titleLabel?.text == "="){
            sum = sum + (num ?? 0);
            displayLabel.text = String(sum);
            flag = false;
            flagSum = false;
            flagContinue = true;
            sum = 0;
        } else if (sender.titleLabel?.text == "AC"){
            displayLabel.text?.removeAll();
            sum = 0;
            displayLabel.text = "0";
            flagSum = false;
            flag = false;
        }
        
    }

}


