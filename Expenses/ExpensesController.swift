//
//  ExpensesController.swift
//  Expenses
//
//  Created by Adam Thoma-Perry on 4/27/18.
//  Copyright © 2018 Thoma-Perry, Adam. All rights reserved.
//
import CoreData
import UIKit

class ExpensesController: UITableViewController {
    
    @IBOutlet var expensesTableView: UITableView!
    
    var expenses: [Expense] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<Expense> = Expense.fetchRequest()
        
        do {
            expenses = try managedContext.fetch(fetchRequest)
            expensesTableView.reloadData()
        } catch {
            print("Could not fetch")
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.expensesTableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return expenses.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = expensesTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let expense = expenses[indexPath.row]
        
        cell.textLabel?.text = expense.title
        cell.detailTextLabel?.text = expense.subtitle
        
        return cell
    }

}

//extension ExpensesController: UITableViewDataSource, UITableViewDelegate {
//
//}
