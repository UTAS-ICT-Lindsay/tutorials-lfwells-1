//
//  CharacterSelectViewController.swift
//  week8livelecture
//
//  Created by Lindsay Wells on 20/4/2026.
//

import UIKit

class CharacterSelectViewController: UIViewController {

    var whoeverIsInChargeOfHandlingCharacterSelect : CharacterSelectedDelegate!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func characterButtonTapped(_ sender: UIButton)
    {
        let character = (sender.titleLabel!.text!)
        //(navigationController?.viewControllers[count -1] as! ViewController).characterButtonTapped(sender)
        
        whoeverIsInChargeOfHandlingCharacterSelect!.characterSelected(character)
        
        //this should have worked
        //self.dismiss(animated: true)
        
        self.navigationController?.popViewController(animated: true)
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
