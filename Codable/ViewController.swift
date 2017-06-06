//
//  ViewController.swift
//  Codable
//
//  Created by Alex Gibson on 6/6/17.
//  Copyright © 2017 Apptillery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var journalEntries = [JournalEntry]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        startCodableTest()
        tableView.delegate = self
        tableView.dataSource = self
        //no need to make it automatic dimesions i don't think
    }
    
    @IBAction func addDidPress(_ sender: Any) {
        let entry = JournalEntry(entryText: "This is just a random bit of text to test our the creation of new text.")
        journalEntries.append(entry)
        save()
        insert()
    }
    
    func save(){
        //save it
        
    }
    
    func insert(){
        tableView.beginUpdates()
        tableView.insertRows(at: [IndexPath(row: journalEntries.count-1, section: 0)], with: .fade)
        tableView.endUpdates()
    }
    
    func delete(indexPath:IndexPath){
        journalEntries.remove(at: indexPath.row)
        save()
        tableView.beginUpdates()
        tableView.deleteRows(at: [indexPath], with: .fade)
        tableView.endUpdates()
    }

    func startCodableTest(){
        if let jE = UserDefaults.standard.value(forKey: "JournalEntries") as? Data{
           //we will load it up soon
        }
    }
}



extension ViewController : UITableViewDataSource,UITableViewDelegate{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return journalEntries.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "journalCell", for: indexPath) as? JournalEntryTableViewCell{
            cell.configureWithEntry(entry: journalEntries[indexPath.row])
            return cell
        }
        return UITableViewCell()
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            //get our object
            delete(indexPath: indexPath)
        }
    }
}

