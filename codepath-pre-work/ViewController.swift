//
//  ViewController.swift
//  codepath-pre-work
//
//  Created by Daiana Besterekova on 19/01/2024.
//

import UIKit


class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    

    @IBOutlet weak var FirstNameTextField: UITextField!
    @IBOutlet weak var SecondNameTextField: UITextField!
    @IBOutlet weak var SchoolNameTextField: UITextField!
    @IBOutlet weak var morePetsSwitch: UISwitch!
    @IBOutlet weak var morePetsStepper: UIStepper!
    @IBOutlet weak var yearSegmentedControl: UISegmentedControl!
    @IBOutlet weak var numberLabel: UILabel!
    @IBOutlet weak var Picker: UIPickerView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        Picker.dataSource = self
        Picker.delegate = self
        view.backgroundColor = .systemGray5
        

    }
    
    // Array to hold your own values
    let pickerData = ["Natural Sci", "Computational Sci", "Social Sci", "Business", "Arts & Humanities"]

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // You have a single column in the picker view
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count // Number of rows equals the number of elements in your data array
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            print(pickerData[row])
            let selectedMajor = pickerData[row]
            return pickerData[row] // Return the value from your data array for the specified row
        }

    
    @IBAction func stepperDidChange(_ sender: UIStepper) {
        numberLabel.text = "\(Int(sender.value))"
        }
    
    
    @IBAction func introduceSelfDidTapped(_ sender: UIButton) {
    
            // Lets us choose the title we have selected from the segmented control
            // In our example that is whether it is first, second, third or forth
        
            let selectedMajor = pickerData[Picker.selectedRow(inComponent: 0)]

            let year = yearSegmentedControl.titleForSegment(at: yearSegmentedControl.selectedSegmentIndex)
            
            // Creating a constant of type string that holds an introduction. The introduction receives the values from the outlet connections.
        
        let introduction = "My name is \(FirstNameTextField.text!) \(SecondNameTextField.text!) and I attend \(SchoolNameTextField.text!). I am currently in my \(year!) year and major in \(selectedMajor). I own \(numberLabel.text!) dogs. It is \(morePetsSwitch.isOn) that I want more pets."
            
            // Creates the alert where we pass in our message, which our introduction.
            let alertController = UIAlertController(title: "My Introduction", message: introduction, preferredStyle: .alert)
            
            // A way to dismiss the box once it pops up
            let action = UIAlertAction(title: "Nice to meet you!", style: .default, handler: nil)
            
            // Passing this action to the alert controller so it can be dismissed
            alertController.addAction(action)
            
            present(alertController, animated: true, completion: nil)
            
        }

}
