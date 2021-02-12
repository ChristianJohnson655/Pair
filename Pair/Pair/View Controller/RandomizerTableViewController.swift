//
//  RandomizerTableViewController.swift
//  Pair
//
//  Created by Christian Johnson on 2/12/21.
//

import UIKit

class RandomizerTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    } // end of viewDidLoad
    
    // MARK: - Properties
    
    // MARK: - Actions
    @IBAction func addButtonTapped(_ sender: Any) {
        presentAlertController(for: nil)
        
    } // end of addButtonTapped Function
    
    
    
    @IBAction func randomizeButtonTapped(_ sender: Any) {
        
    } // end of randomizeButtonTapped Function
    
    
    // MARK: - Helper Methods
    func updateData() {
        
    }
    
    
    
    func presentAlertController(for person: Person?) {
        let alert = UIAlertController(title: "Add Person", message: nil, preferredStyle: .alert)
        
        let addButton = UIAlertAction(title: "Add", style: .default) { (action) in
            guard let personName = alert.textFields?[0].text, !personName.isEmpty else { return }
            if let person = person {
                PairController.shared.updatePerson(person: person, name: personName)
                self.tableView.reloadData()
            } else {
                PairController.shared.createNewPerson(newName: personName)
                self.tableView.reloadData()
            } // end of else statement
        } // end of UIAlertAction(title: "Add", style: .default)
        let cancelButton = UIAlertAction(title: "Cancel", style: .destructive)
        alert.addTextField { (_) in }
        alert.addAction(addButton)
        alert.addAction(cancelButton)
        self.present(alert, animated: true)
    } // end of presentAlertController
    
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Group"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 4
    } // end of numberOfSections
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return PairController.shared.persons.count
    } // end of numberOfRowsInSection
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "nameCell", for: indexPath)
        
        let person = PairController.shared.persons[indexPath.row]
        
        cell.textLabel?.text = person.name
        
        return cell
    }
    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
    
    
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        
        return true
    }
    
    
    
    // MARK: - Navigation
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
    }
    
    
}
