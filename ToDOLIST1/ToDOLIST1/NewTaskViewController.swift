//
//  NewTaskViewController.swift
//  ToDOLIST1
//
//  Created by Ivan Christopher BANFOU on 04/01/2024.
//


import UIKit

class NewTaskViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var nom: UITextField!
    
    @IBOutlet weak var descr: UITextField!
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    var update: (() -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        nom.delegate = self
        descr.delegate = self
        datePicker.setDate(Date(), animated: true) // set the datePicker to be the date by default
        
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        
        textField.resignFirstResponder()
    }
    
    var newTask : Todo?
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        newTask = Todo(title: nom.text!, desc: descr.text!, date : datePicker.date)
    }
    
}
