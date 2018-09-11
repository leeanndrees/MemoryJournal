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
    
    // MARK: Properties
    weak var delegate: AddEntryViewControllerDelegate?
    
    // MARK: Outlets
    @IBOutlet weak var titleTextField: UITextField!
    @IBOutlet weak var dateTextField: UITextField!
    @IBOutlet weak var contentTextField: UITextField!
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: TableView Overrides
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        return nil
    }
    
    // MARK: @IBActions
    @IBAction func save() {
        let entry = JournalEntry(entryTitle: titleTextField.text!, entryContent: contentTextField.text!, entryDate: dateTextField.text!)
        delegate?.addEntryViewController(self, didFinishAdding: entry)
    }
    
    @IBAction func cancel() {
        delegate?.addEntryViewControllerDidCancel(self)
    }

}
