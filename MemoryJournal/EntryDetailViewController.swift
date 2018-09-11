//
//  EntryDetailViewController.swift
//  MemoryJournal
//
//  Created by DetroitLabs on 9/10/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

protocol EntryDetailViewControllerDelegate: class {
    func entryDetailViewController(_ controller: EntryDetailViewController, didFinishEditing item: JournalEntry)
}

class EntryDetailViewController: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var entryTitle: UILabel!
    @IBOutlet weak var entryDate: UILabel!
    @IBOutlet weak var entryContent: UILabel!
    
    @IBOutlet weak var entryTitleField: UITextField!
    @IBOutlet weak var entryDateField: UITextField!
    @IBOutlet weak var entryContentArea: UITextView!
    
    // MARK: Properties
    var entry: JournalEntry?
    weak var delegate: EntryDetailViewControllerDelegate?
    
    // MARK: Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        showEntryData()
        toggleFieldVisibility()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func showEntryData() {
        guard let entryToShow = entry else { return }
        entryTitle.text = entryToShow.entryTitle
        entryDate.text = entryToShow.entryDate
        entryContent.text = entryToShow.entryContent
    }
    
    func toggleLabelVisibility() {
        entryTitle.isHidden = !entryTitle.isHidden
        entryDate.isHidden = !entryDate.isHidden
        entryContent.isHidden = !entryContent.isHidden
    }
    
    func toggleFieldVisibility() {
        entryTitleField.isHidden = !entryTitleField.isHidden
        entryDateField.isHidden = !entryDateField.isHidden
        entryContentArea.isHidden = !entryContentArea.isHidden
    }
    
    func showExistingTextInFields() {
        guard let entryToShow = entry else { return }
        entryContentArea.text = entryToShow.entryContent
        entryTitleField.text = entryToShow.entryTitle
        entryDateField.text = entryToShow.entryDate
    }
    
    // MARK: @IBActions
    @IBAction func editButton(_ sender: UIButton) {
        toggleFieldVisibility()
        toggleLabelVisibility()
        showExistingTextInFields()
        self.navigationItem.title = "Edit Entry"
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let entryToUpdate = entry else { return }
        
        guard let updatedTitle = entryTitleField.text else { return }
        entryToUpdate.entryTitle = updatedTitle
        
        guard let updatedDate = entryDateField.text else { return }
        entryToUpdate.entryDate = updatedDate
        
        guard let updatedContent = entryContentArea.text else { return }
        entryToUpdate.entryContent = updatedContent
        
        delegate?.entryDetailViewController(self, didFinishEditing: entryToUpdate)
    }

}
