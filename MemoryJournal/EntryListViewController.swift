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

class EntryListViewController: UITableViewController {
    
    // MARK: Outlets
    
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == SegueIdentifier.showDetail.rawValue {
            guard let entryDetailViewController = segue.destination as? EntryDetailViewController else { return }
            entryDetailViewController.entry = journalEntriesToShow[selectedEntryIndex]
            //entryDetailViewController.delegate = self
        }
    }
    
    func useLargeTitles() {
        navigationController?.navigationBar.prefersLargeTitles = true
    }

}

