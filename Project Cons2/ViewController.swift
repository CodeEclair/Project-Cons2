//
//  ViewController.swift
//  Project Cons2
//
//  Created by Валерия Беленко on 14/10/2024.
//

import UIKit

class ViewController: UITableViewController {
    
    var flags = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        title = "Flags Viewer 1.0"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        let fm = FileManager.default
        let path = Bundle.main.resourcePath!
        let items = try! fm.contentsOfDirectory(atPath: path)
        
        for item in items {
            if item.hasSuffix(".png") {
                // this is a picture to load!
                flags.append(item)
            }
        }
        
        print(flags)
        
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return flags.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Flag", for: indexPath)
        let flagName = flags[indexPath.row].replacingOccurrences(of: ".png", with: "")
        
        if flagName == "uk" || flagName == "us" {
               cell.textLabel?.text = "Flag of \(flagName.uppercased())"
           } else {
               cell.textLabel?.text = "Flag of \(flagName.capitalized)"
           }
        
        //cell.textLabel?.text = "Flag of \(flags[indexPath.row].replacingOccurrences(of: ".png", with: "").capitalized)"
        return cell
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(withIdentifier: "Detail") as? DetailViewController {
            vc.selectedFlag = flags[indexPath.row]
            vc.selectedFlagNumber = indexPath.row + 1
            vc.totalFlags = flags.count
            navigationController?.pushViewController(vc, animated: true)
            
        }
        
    }
    
}
