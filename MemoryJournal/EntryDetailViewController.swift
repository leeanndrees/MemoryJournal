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
    @IBOutlet weak var editButton: UIButton!
    
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
    
    // MARK: @IBActions
    @IBAction func editButton(_ sender: UIButton) {
        toggleFieldVisibility()
        toggleLabelVisibility()
        showExistingTextInFields()
        toggleButtonText()
        entryTitleField.becomeFirstResponder()
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

// MARK: Private Implementation
extension EntryDetailViewController {
    private func showEntryData() {
        guard let entryToShow = entry else { return }
        entryTitle.text = entryToShow.entryTitle
        entryDate.text = entryToShow.entryDate
        entryContent.text = entryToShow.entryContent
    }
    
    private func toggleLabelVisibility() {
        entryTitle.isHidden = !entryTitle.isHidden
        entryDate.isHidden = !entryDate.isHidden
        entryContent.isHidden = !entryContent.isHidden
    }
    
    private func toggleFieldVisibility() {
        entryTitleField.isHidden = !entryTitleField.isHidden
        entryDateField.isHidden = !entryDateField.isHidden
        entryContentArea.isHidden = !entryContentArea.isHidden
    }
    
    private func toggleButtonText() {
        if editButton.titleLabel?.text == ButtonTitle.edit.rawValue {
            editButton.setTitle(ButtonTitle.cancel.rawValue, for: .normal)
        }
        else if editButton.titleLabel?.text == ButtonTitle.cancel.rawValue {
            editButton.setTitle(ButtonTitle.edit.rawValue, for: .normal)
        }
    }
    
    private func showExistingTextInFields() {
        guard let entryToShow = entry else { return }
        entryContentArea.text = entryToShow.entryContent
        entryTitleField.text = entryToShow.entryTitle
        entryDateField.text = entryToShow.entryDate
    }
}

