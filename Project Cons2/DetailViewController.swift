//
//  DetailViewController.swift
//  Project Cons2
//
//  Created by Валерия Беленко on 14/10/2024.
//

import UIKit

class DetailViewController: UIViewController {
    @IBOutlet var imageView: UIImageView!
    
    
    var selectedFlag: String?
    var selectedFlagNumber: Int?
    var totalFlags: Int?
    
   
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        title = "\(selectedFlag!.replacingOccurrences(of: ".png", with: "").capitalized)"
        navigationItem.largeTitleDisplayMode = .never
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .action, target: self, action: #selector(shareTapped))
        
        
        if let flagToLoad = selectedFlag {
            imageView.image = UIImage(named: flagToLoad)
            
            
        }
        //imageView.backgroundColor = UIColor.lightGray
        
        
        
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.hidesBarsOnTap = true
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.hidesBarsOnTap = false
        
        
    }
    
    @objc func shareTapped() {
        guard let image = imageView.image?.jpegData(compressionQuality: 0.8)
        else {
            print("No image found")
            return
        }
        let nameOfFlag = "\(selectedFlag!.replacingOccurrences(of: ".png", with: "").capitalized)"
        
        let vc = UIActivityViewController(activityItems: [nameOfFlag, image], applicationActivities: [])
        vc.popoverPresentationController?.barButtonItem = navigationItem.rightBarButtonItem
        present(vc, animated: true)
    }
        
    
   
}

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //imageView.layer.borderWidth = 1
    //imageView.layer.borderColor = UIColor.lightGray.cgColor



