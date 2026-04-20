//
//  SecondScreenViewController.swift
//  week8livelecture
//
//  Created by Lindsay Wells on 20/4/2026.
//

import UIKit

class SecondScreenViewController: UIViewController {

    @IBOutlet weak var nameLabel: UILabel!
    var nameFromPreviousView: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("hello from screen 2")
        nameLabel.text = nameFromPreviousView
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
