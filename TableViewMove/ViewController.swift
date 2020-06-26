//
//  ViewController.swift
//  TableViewMove
//
//  Created by Ernesto Redonet on 6/26/20.
//  Copyright © 2020 Ernesto Redonet. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet var table : UITableView!;
    
    var models = [
        "first",
        "second",
        "third",
        "four"
    ]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        table.delegate = self
        table.dataSource = self
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = table.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = models[indexPath.row]
        cell.textLabel?.font = UIFont(name: "Arial", size: 22)
        return cell
    }
    
    func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        true
    }
    
    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        models.swapAt(sourceIndexPath.row, destinationIndexPath.row)
    }
    
    @IBAction func didTapSort(){
        if table.isEditing {
            table.isEditing = false
        }
        else{
            table.isEditing = true
        }
    }
    
}

