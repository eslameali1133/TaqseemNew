//
//  AddMatchVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/19/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class AddMatchVC: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {
    var PickerFlag = ""
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var Duration = [0 , 15 , 30 , 45 , 60 , 75 , 90 , 105 , 120]
    var TeamCapacity = [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12]
    var Fees = [0 , 1,2,3,4,5,6,7,8,9,10]
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblFees: UILabel!
    //Uidate picker
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnDuration(_ sender: Any) {
        PickerFlag = "Duration"
        configurePicker()
    }
    @IBAction func btnCapacity(_ sender: Any) {
        PickerFlag = "Capacity"
        configurePicker()
    }
    @IBAction func btnFees(_ sender: Any) {
        PickerFlag = "Fees"
        configurePicker()
    }
    @IBAction func btnTime(_ sender: Any) {
        showDatePicker(isDate: false)
    }
    @IBAction func btnDate(_ sender: Any) {
    showDatePicker(isDate: true)
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
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if PickerFlag == "Duration"{
        return Duration.count
    }
        else if PickerFlag == "Capacity"{
            return TeamCapacity.count
        } else {
            return Fees.count
        }
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if PickerFlag == "Duration" {
        if row == 0{
            return "Select The Match Duration "
        }
        return String(Duration[row])
            
        } else if PickerFlag == "Capacity" {
            if row == 0{
                return "Select The Team Capacity "
            }
            return String(TeamCapacity[row])
        } else {
            if row == 0{
                return "Select The Fees"
            }
            return String(Fees[row])
        }
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if PickerFlag == "Duration" {
        lblDuration.text = String(Duration[row])
    }else if PickerFlag == "Capacity" {
            lblCapacity.text = String(TeamCapacity[row])
        } else {
            lblFees.text = String(Fees[row])
        }
    }
}


