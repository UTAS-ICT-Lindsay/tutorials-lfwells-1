//
//  ViewController.swift
//  week8livelecture
//
//  Created by Lindsay Wells on 20/4/2026.
//

import UIKit

class ViewController: UIViewController, CharacterSelectedDelegate
{
   

    @IBOutlet weak var nameField: UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        print("hello world")
    }


    @IBAction func nameWasEntered(_ sender: UITextField, forEvent event: UIEvent)
    {
        print(sender.text ?? "value if null")
        
        self.performSegue(withIdentifier:"goToScreenTwo", sender: sender)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "goToScreenTwo")
        {
            //(segue.destination as! SecondScreenViewController).nameFromPreviousView = "asdfdsfs"
            if let secondScreen = segue.destination as? SecondScreenViewController
            {
                secondScreen.nameFromPreviousView = nameField?.text! ?? "there was no text box"
            }
        }
        else if (segue.identifier == "goToCharacterSelectScreen")
        {
            if let characterSelectScreen = segue.destination as? CharacterSelectViewController
            {
                characterSelectScreen.whoeverIsInChargeOfHandlingCharacterSelect = self
            }
        }
    }
    
    @IBAction func unwindToHomePage(sender: UIStoryboardSegue)
    {
        
    }
    
    func characterSelected(_ character: String) {
        print("the character selected was \(character)")
        nameField!.text = character
    }
}

