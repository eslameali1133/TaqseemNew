//
//  AddPlayGroundVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/5/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class AddPlayGroundVC: UIViewController  , UIPickerViewDelegate , UIPickerViewDataSource{
    var dateis = " "
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var datePicker = UIDatePicker()
    var TeamCapacity = [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12]
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblFrom: UILabel!
    @IBOutlet weak var lblTo: UILabel!
    @IBOutlet weak var txtFees: UITextField!
    @IBOutlet weak var txtHours: UITextField!
    @IBOutlet weak var btnFri: UIButton!
    @IBOutlet weak var btnThu: UIButton!
    @IBOutlet weak var btnWed: UIButton!
    @IBOutlet weak var btnTus: UIButton!
    @IBOutlet weak var btnMon: UIButton!
    @IBOutlet weak var btnSun: UIButton!
    @IBOutlet weak var btnSat: UIButton!
    @IBOutlet weak var txtPhoneNum: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtEnglishName: UITextField!
    @IBOutlet weak var txtArabicName: UITextField!
    @IBOutlet weak var map: UIView!
    @IBOutlet weak var imgLogo: AMCircleImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func btnTo(_ sender: Any) {
        dateis = "To"
        showDatePicker()
        onDoneButtonTapped()
        datePicker.addTarget(self, action: #selector(AddPlayGroundVC.datePickerValueChanged), for: UIControl.Event.valueChanged)
        
    }
    @IBAction func btnFrom(_ sender: Any) {
        dateis = "From"
        showDatePicker()
        onDoneButtonTapped()
        datePicker.addTarget(self, action: #selector(AddPlayGroundVC.datePickerValueChanged), for: UIControl.Event.valueChanged)
        
    }
    @IBAction func btnCapacity(_ sender: Any) {
        configurePicker()
    }
    @IBAction func btnFri(_ sender: Any) {
    }
    @IBAction func btnThu(_ sender: Any) {
    }
    @IBAction func btnWed(_ sender: Any) {
    }
    @IBAction func btnTus(_ sender: Any) {
    }
    @IBAction func btnMon(_ sender: Any) {
    }
    @IBAction func btnSun(_ sender: Any) {
    }
    @IBAction func btnSat(_ sender: Any) {
    }
    @IBAction func btnAddPlayGround(_ sender: Any) {
    }
    
    func configurePicker (){
        picker  = UIPickerView()
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
        
        // DPicker.addTarget(self, action: #selector(AddPlayGroundVC.ChangeDate(sender:)), for: UIControl.Event.valueChanged)
        
    }
    
    @objc func datePickerValueChanged (datePicker: UIDatePicker) {
        
        let dateformatter = DateFormatter()
        
        dateformatter.dateStyle = DateFormatter.Style.none
        dateformatter.timeStyle = DateFormatter.Style.medium
        
        let dateValue = dateformatter.string(from: datePicker.date)
        if dateis == "From" {
            lblFrom.text = dateValue
        }else{
            lblTo.text = dateValue
        }
        
    }
    
    func showDatePicker(){
        
        datePicker.datePickerMode = .time
        let toolbar = UIToolbar();
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem.init(title: "Done", style: .plain, target: self, action: #selector(donedatePicker));
        self.view.addSubview(toolbar)
        
        let tempInput = UITextField( frame:CGRect.zero )
        tempInput.inputView = self.datePicker       // Your picker
        self.view.addSubview( tempInput )
        tempInput.becomeFirstResponder()
        
    }
    @objc func donedatePicker(){
        self.view.endEditing(true)
    }
    @objc func onDoneButtonTapped() {
        toolBar.removeFromSuperview()
        picker.removeFromSuperview()
    }
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        
        return TeamCapacity.count
        
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if row == 0{
            return "Select The PlayGround Capacity "
        }
        return String(TeamCapacity[row])
        
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblCapacity.text = String(TeamCapacity[row])
    }
    
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}
