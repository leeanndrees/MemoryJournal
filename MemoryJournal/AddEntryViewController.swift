//
//  AddEntryViewController.swift
//  MemoryJournal
//
//  Created by DetroitLabs on 9/10/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

protocol AddEntryViewControllerDelegate: class {
    func addEntryViewControllerDidCancel(_ controller: AddEntryViewController)
    func addEntryViewController(_ controller: AddEntryViewController, didFinishAdding item: JournalEntry)
}

class AddEntryViewController: UITableViewController {
    
    weak var delegate: AddEntryViewControllerDelegate?
    
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    @IBAction func save() {
        let entry = JournalEntry(entryTitle: titleTextField.text!, entryContent: contentTextField.text!, entryDate: dateTextField.text!)
        delegate?.addEntryViewController(self, didFinishAdding: entry)
    }
    
    @IBAction func cancel() {
        delegate?.addEntryViewControllerDidCancel(self)
    }

}
