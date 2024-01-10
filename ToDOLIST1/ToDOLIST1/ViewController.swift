//
//  ViewController.swift
//  ToDOLIST1
//
//  Created by Ivan Christopher BANFOU on 04/01/2024.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, UISearchBarDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "My Todo List"
        
        tableview.delegate = self
        tableview.dataSource = self
        barre.delegate = self
        self.personnal = self.personnal.sorted(by: {$0.date < $1.date}) //effectue un tri des éléments de notre tableau
        
        tasksearch = personnal
        // Do any additional setup after loading the view.
    }

    @IBOutlet weak var barre: UISearchBar!
    
    @IBOutlet weak var tableview: UITableView!
    var personnal = [Todo]()
    var tasksearch = [Todo]()
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasksearch.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! TableViewCell
        cell.name.text = tasksearch[indexPath.row].name
        cell.Date.text = TaskViewController.dateFormatter.string(from: tasksearch[indexPath.row].date)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let configuration = UISwipeActionsConfiguration(actions: [UIContextualAction(style: .destructive, title: "Supprimer?", handler: {(action, view, completionHandler) in
            let row = indexPath.row
            self.tasksearch.remove(at: row)
            self.personnal.remove(at: row)
            completionHandler(true)
            tableView.reloadData()
    
        })
        ])
        
        //updateTasks()
        return configuration
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    @IBAction func Add(_ unwindSegue: UIStoryboardSegue) {
        //let sourceViewController = unwindSegue.source
        // Use data from the view controller which initiated the unwind segue
        
        if let vc = unwindSegue.source as? NewTaskViewController {
            if let todo = vc.newTask {
                
                personnal.append(todo)
               
            }
        }
        self.personnal = self.personnal.sorted(by: {$0.date < $1.date})
        tasksearch = personnal
        tableview.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? TaskViewController{
            let row = tableview.indexPathForSelectedRow!.row
            vc.data = tasksearch[row]
            vc.title = "Description de la tache"
        }
    }
    func searchBar(_ barre: UISearchBar, textDidChange searchText: String) {
        tasksearch = []
        if searchText == ""{
            tasksearch = personnal
        } else {
            for todo in personnal {
                if todo.name.range(of: searchText, options: .caseInsensitive) != nil {
                    tasksearch.append(todo)
                }
            }
        }
        tableview.reloadData()
    }
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        searchBar.resignFirstResponder() 
    }
}

