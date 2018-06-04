//
//  PlanViewController.swift
//  
//
//  Created by 金乃德 on 2018/6/4.
//

import UIKit

class PlanViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return selectionOfDays.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return String(selectionOfWords[row])
        case 1:
            return String(selectionOfDays[row])
        default:
            return nil
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        numberOfWords.dataSource = self
        numberOfWords.delegate = self
        // Do any additional setup after loading the view.
    }
    
    var selectionOfWords = [10, 20, 30, 40, 50]
    var selectionOfDays = [100, 200, 300, 400, 500]
    
    @IBOutlet weak var numberOfWords: UIPickerView!
    @IBAction func save(_ sender: UIButton) {
        let defaults = UserDefaults.standard
        defaults.set(selectionOfWords[numberOfWords.selectedRow(inComponent: 0)], forKey: "numberOfWords")
        defaults.set(selectionOfDays[numberOfWords.selectedRow(inComponent: 1)], forKey: "numberOFDays")
        let defaultAction = UIAlertAction(title: "好的", style: .default) { _ in
        }
        let alert = UIAlertController(title: "保存完毕",
                                      message: nil,
                                      preferredStyle: .alert)
        alert.addAction(defaultAction)
        self.present(alert, animated: true, completion: nil)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
