//
//  EntryListViewController.swift
//  MemoryJournal
//
//  Created by DetroitLabs on 9/10/18.
//  Copyright © 2018 DetroitLabs. All rights reserved.
//

/*
 Build an app for a user to keep a Memory Journal
 Your app’s main page should feature a list of existing journal entries by title
 When you click on a title, you should be taken to the journal entry
 Journal entries should have a title, content, and a date
 The user should be able to view, add, edit, and delete journal entries
 Your app should utilize the delegate pattern to pass data
 */

import UIKit

class EntryListViewController: UITableViewController, AddEntryViewControllerDelegate, EntryDetailViewControllerDelegate {
    
    // MARK: Properties
    
    var journalEntriesToShow = JournalEntryList().journalEntriesToShow
    var selectedEntryIndex = 0
    
    // MARK: Methods

    override func viewDidLoad() {
        super.viewDidLoad()
        useLargeTitles()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    func swipeToDelete(indexPath: IndexPath) {
        journalEntriesToShow.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: UITableViewRowAnimation.fade)
    }
    
    // MARK: Table View Overrides
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntriesToShow.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "JournalEntryOverview", for: indexPath)
        cell.textLabel?.text = journalEntriesToShow[indexPath.row].entryTitle
        return cell
    }
    
    override func tableView(_ tableView: UITableView, willSelectRowAt indexPath: IndexPath) -> IndexPath? {
        selectedEntryIndex = indexPath.row
        return indexPath
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == UITableViewCellEditingStyle.delete {
            swipeToDelete(indexPath: indexPath)
        }
    }
    
    // MARK: AddEntryViewControllerDelegate Protocol
    
    func addEntryViewControllerDidCancel(_ controller: AddEntryViewController) {
        navigationController?.popViewController(animated: true)
    }
    
    func addEntryViewController(_ controller: AddEntryViewController, didFinishAdding item: JournalEntry) {
        let newRowIndex = journalEntriesToShow.count
        journalEntriesToShow.append(item)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        tableView.insertRows(at: [indexPath], with: .automatic)
        
        navigationController?.popViewController(animated: true)
    }
    
    // MARK: EntryDetailViewControllerDelegate Protocol
    
    func entryDetailViewController(_ controller: EntryDetailViewController, didFinishEditing item: JournalEntry) {
        guard let index = self.journalEntriesToShow.index(of: item) else { return }
        let indexPath = IndexPath(row: index, section: 0)
        
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        cell.textLabel?.text = item.entryTitle
        navigationController?.popViewController(animated: true)
    }

    
    // MARK: Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.showDetail.rawValue {
            guard let entryDetailViewController = segue.destination as? EntryDetailViewController else { return }
            entryDetailViewController.entry = journalEntriesToShow[selectedEntryIndex]
            entryDetailViewController.delegate = self
        }
    }

}
