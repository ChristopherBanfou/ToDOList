//
//  Todo.swift
//  ToDOLIST1
//
//  Created by Ivan Christopher BANFOU on 04/01/2024.
//

import Foundation

class Todo{
    var name: String
    var desc: String
    var date: Date
    
    init(title: String, desc: String , date: Date) {
        self.name = title
        self.desc = desc
        self.date = date
        
    }
}
