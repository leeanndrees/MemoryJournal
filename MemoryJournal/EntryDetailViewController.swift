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
    @IBOutlet weak var entryTitle: UILabel!
    @IBOutlet weak var entryDate: UILabel!
    @IBOutlet weak var entryContent: UILabel!
    
    @IBOutlet weak var entryTitleField: UITextField!
    @IBOutlet weak var entryDateField: UITextField!
    @IBOutlet weak var entryContentField: UITextField!
    
    var entry: JournalEntry?
    weak var delegate: EntryDetailViewControllerDelegate?
    
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
        entryContentField.isHidden = !entryContentField.isHidden
    }
    
    func showExistingTextInFields() {
        guard let entryToShow = entry else { return }
        entryContentField.text = entryToShow.entryContent
        entryTitleField.text = entryToShow.entryTitle
        entryDateField.text = entryToShow.entryDate
    }
    
    
    @IBAction func editButton(_ sender: UIButton) {
        toggleFieldVisibility()
        toggleLabelVisibility()
        showExistingTextInFields()
    }
    
    @IBAction func save(_ sender: UIBarButtonItem) {
        guard let entryToUpdate = entry else { return }
        
        guard let updatedTitle = entryTitleField.text else { return }
        entryToUpdate.entryTitle = updatedTitle
        
        guard let updatedDate = entryDateField.text else { return }
        entryToUpdate.entryDate = updatedDate
        
        guard let updatedContent = entryContentField.text else { return }
        entryToUpdate.entryContent = updatedContent
        
        delegate?.entryDetailViewController(self, didFinishEditing: entryToUpdate)
    }
    
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
   // }

}
