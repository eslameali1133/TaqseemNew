//
//  ADDMatchVC.swift
//  Taqseem
//
//  Created by apple on 3/5/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class OwnerADDMatchVC: UIViewController,UIPickerViewDataSource,UIPickerViewDelegate {
    @IBOutlet weak var lblTo: UILabel!
    @IBOutlet weak var lblFrom: UILabel!
    @IBOutlet weak var lblDuration: UILabel!
    var PickerFlag = ""
    var PickerFlag1 = ""
    var DateIs = ""
     var Duration = ["Playground 1", "Playground 2" , "Playground 3"]
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
      @IBOutlet weak var lblDate: UILabel!
     let datePicker = UIDatePicker()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnDate(_ sender: Any) {
        PickerFlag1 = "Date"
        showDatePicker(isDate: true)
        datePicker.addTarget(self, action: #selector(OwnerADDMatchVC.datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    @IBAction func btnFrom(_ sender: Any) {
        DateIs = "From"
        showDatePicker(isDate: false)
        datePicker.addTarget(self, action: #selector(OwnerADDMatchVC.datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    @IBAction func btnTo(_ sender: Any) {
        DateIs = "To"
        showDatePicker(isDate: false)
        datePicker.addTarget(self, action: #selector(OwnerADDMatchVC.datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    @IBAction func btnDuration(_ sender: Any) {
        PickerFlag = "Duration"
        configurePicker()
    }
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    func showDatePicker(isDate: Bool){
        //Formate Date //Formate Date
        if isDate == true{
            datePicker.datePickerMode = .date
            
        }else{
            datePicker.datePickerMode = .time
        }
        
        //ToolBar
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: #selector(onDoneButtonTapped));
        self.view.addSubview(toolbar)
        
        let tempInput = UITextField( frame:CGRect.zero )
        tempInput.inputView = self.datePicker       // Your picker
        self.view.addSubview( tempInput )
        tempInput.becomeFirstResponder()
    }
    @objc func datePickerValueChanged (datePicker: UIDatePicker) {
        
        let dateformatter = DateFormatter()
        if PickerFlag1 == "Date" {
            dateformatter.dateStyle = DateFormatter.Style.medium
            dateformatter.timeStyle = DateFormatter.Style.none
            let dateValue = dateformatter.string(from: datePicker.date)
            lblDate.text = dateValue
        } else {
            dateformatter.dateStyle = DateFormatter.Style.none
            dateformatter.timeStyle = DateFormatter.Style.medium
            let dateValue = dateformatter.string(from: datePicker.date)
            if DateIs == "From" {
            lblFrom.text = dateValue
            }else{
                 lblTo.text = dateValue
            }
        }
        }
    @objc func donedatePicker(){
        //For date formate
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        lblDate.text = formatter.string(from: datePicker.date)
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    func configurePicker (){
        picker = UIPickerView.init()
        picker.delegate = self
        picker.backgroundColor = UIColor.white
        picker.setValue(UIColor.black, forKey: "textColor")
        picker.autoresizingMask = .flexibleWidth
        picker.contentMode = .center
        picker.frame = CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 255)
        self.view.addSubview(picker)
        
        toolBar = UIToolbar.init(frame: CGRect.init(x: 0.0, y: UIScreen.main.bounds.size.height - 300, width: UIScreen.main.bounds.size.width, height: 50))
        toolBar.barStyle = .default
        toolBar.items = [UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: #selector(onDoneButtonTapped))]
        self.view.addSubview(toolBar)
    }
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    lblDuration.text = String(Duration[row])
    
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        
        
            if row == 0{
                return "Select playground "
            }
            return String(Duration[row])

       
       
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
     

            return Duration.count

        
    }
    


}
