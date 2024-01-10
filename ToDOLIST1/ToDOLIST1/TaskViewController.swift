//
//  TaskViewController.swift
//  ToDOLIST1
//
//  Created by Ivan Christopher BANFOU on 04/01/2024.
//

import UIKit

class TaskViewController: UIViewController {

    @IBOutlet weak var name: UILabel!
    
    @IBOutlet weak var desc: UILabel!
    
    @IBOutlet weak var date: UILabel!
    
    
    static let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter .dateStyle = .medium
        return dateFormatter
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let task = data {
            name.text = task.name
            desc.text = task.desc
            date.text = Self.dateFormatter.string(from: task.date)
                                                   
        }
        // Do any additional setup after loading the view.
    }
    
    var data: Todo?
    


}
