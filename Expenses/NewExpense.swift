//
//  NewExpense.swift
//  Expenses
//
//  Created by Adam Thoma-Perry on 4/27/18.
//  Copyright © 2018 Thoma-Perry, Adam. All rights reserved.
//

import UIKit
import CoreData

class NewExpense: UIViewController {
    
    @IBOutlet weak var titleText: UITextField!
    @IBOutlet weak var subtitleText: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleText.delegate = self
        subtitleText.delegate = self
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        titleText.resignFirstResponder()
    }
    
    @IBAction func saveExpense(_ sender: Any) {
        let expense = Expense(title: titleText.text ?? "", subtitle: subtitleText.text ?? "")
        
        do {
            try expense?.managedObjectContext?.save()
            self.navigationController?.popViewController(animated: true)
        } catch {
            print("Could not save expense")
        }
    }
    
}

extension NewExpense: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
