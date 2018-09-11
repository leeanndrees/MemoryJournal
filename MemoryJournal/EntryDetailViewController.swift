//
//  EntryDetailViewController.swift
//  MemoryJournal
//
//  Created by DetroitLabs on 9/10/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

import UIKit

class EntryDetailViewController: UIViewController {
    @IBOutlet weak var entryTitle: UILabel!
    @IBOutlet weak var entryDate: UILabel!
    @IBOutlet weak var entryContent: UILabel!
    
    @IBOutlet weak var entryTitleField: UITextField!
    @IBOutlet weak var entryDateField: UITextField!
    @IBOutlet weak var entryContentField: UITextField!
    
    var entry: JournalEntry?
    //weak var delegate: EntryDetailViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showEntryData()
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

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
   // }

}
