//
//  PickerLectureSampleViewController.swift
//  week9livelecture
//
//  Created by Lindsay Wells on 27/4/2026.
//

import UIKit

class PickerLectureSampleViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate
{
    var huntrix: [String] = ["Zoey", "Rumi", "Mira"]
    var sajaBoys: [String] = ["dumb", "abs", "dumber"]
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if component == 0 { return huntrix.count }
        else { return sajaBoys.count }
        //return huntrix.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if component == 0 { return huntrix[row] }
        else { return sajaBoys[row] }
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if component == 0 { print(huntrix[row]) }
        else { print(sajaBoys[row]) }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
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
