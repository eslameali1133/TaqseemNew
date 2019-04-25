//
//  AddMatchVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 2/19/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit
import SwiftyJSON
protocol shareLocationDelegateFilter {
    func shareLocationDelegate(lat: String, Long: String)
}

class AddMatchVC: UIViewController , UIPickerViewDataSource , UIPickerViewDelegate {
    
    let date = Date()
    let calendar = Calendar.current
    
    var items = [PlaygroundModelClass]()
    var MatchDetails : MatchDetailsModelClass!
    var http = HttpHelper()
    var PickerFlag = ""
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    var Duration = [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10]
    var TeamCapacity = [0 , 1 , 2 , 3 , 4 , 5 , 6 , 7 , 8 , 9 , 10 , 11 , 12 , 13 , 14]
    var Fees = [0 , 1,2,3,4,5,6,7,8,9,10]
    var PTime = ""
    @IBOutlet weak var lblDuration: UILabel!
    @IBOutlet weak var txtNotes: UITextView!
    @IBOutlet weak var lblTime: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblFees: UILabel!
        @IBOutlet weak var lblLocation: UILabel!
    var LatPosition = "0.0"
    var LngPosition = "0.0"
    //Uidate picker
    let datePicker = UIDatePicker()
    override func viewDidLoad() {
        
        super.viewDidLoad()
        http.delegate = self
        DefaultValues()
        // Do any additional setup after loading the view.
    }
    @IBAction func DismissView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    @IBAction func btnDuration(_ sender: Any) {
        PickerFlag = "Duration"
        onDoneButtonTapped()
        configurePicker()
    }
    @IBAction func btnCapacity(_ sender: Any) {
        PickerFlag = "Capacity"
        onDoneButtonTapped()
        configurePicker()
    }
    @IBAction func btnFees(_ sender: Any) {
        PickerFlag = "Fees"
        onDoneButtonTapped()
        configurePicker()
    }
    @IBAction func btnTime(_ sender: Any) {
        PickerFlag = "Time"
        onDoneButtonTapped()
        showDatePicker(isDate: false)
        datePicker.addTarget(self, action: #selector(AddPlayGroundVC.datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    @IBAction func btnDate(_ sender: Any) {
        PickerFlag = "Date"
        onDoneButtonTapped()
        showDatePicker(isDate: true)
        datePicker.addTarget(self, action: #selector(AddPlayGroundVC.datePickerValueChanged), for: UIControl.Event.valueChanged)
    }
    
    
    @IBAction func btnAddMatch(_ sender: Any) {
        comedromneartoplay = ""
        MatchDetails = MatchDetailsModelClass(
            Time: lblTime.text!,
            PTime: PTime,
            Date: lblDate.text!,
            Duration: lblDuration.text!,
            Capacity:lblCapacity.text!,
            Salary: lblFees.text!,
            Notes: ""
        )
        
        Filter()
    }
  
    func DefaultValues(){
        let Year = calendar.component(.year, from: date)
        var Month = String(calendar.component(.month, from: date))
        if Month.count == 1{
            Month = "0\(Month)"
        }
        var Day = String(calendar.component(.day, from: date))
        if Day.count == 1{
            Day = "0\(Day)"
        }
        var hour = String(calendar.component(.hour, from: date))
        if hour.count == 1{
            hour = "0\(hour)"
        }
        var minutes = String(calendar.component(.minute, from: date))
        if minutes.count == 1{
            minutes = "0\(minutes)"
        }
        let defaultDate = "\(Year)-\(Month)-\(Day)"
        let defaultTime = "\(hour):\(minutes):00"
        print(defaultDate,defaultTime)
        lblDate.text = defaultDate
        lblTime.text = defaultTime
        lblCapacity.text = "1"
        lblDuration.text = "1"
        
    }
    
    func Filter(){
        items.removeAll()
        let AccessToken = UserDefaults.standard.string(forKey: "access_token")!
        let token_type = UserDefaults.standard.string(forKey: "token_type")!
        
        
        let params = [
            "date":"2019-03-24" ,
            "time" : "18:00:00",
            "duration" : "2",
            "capacity" : "11",
            "price" : "10",
            "lat" : "",
            "lng" : "",
            "city_id" : "",
            "type" : ""
            
            ] as [String: Any]
        
        let headers = [
            "Accept-Type": "application/json" ,
            "Content-Type": "application/json" ,
            "Authorization" : "\(token_type) \(AccessToken)",
            "lang" : "en"
        ]
        
        AppCommon.sharedInstance.ShowLoader(self.view,color: UIColor.hexColorWithAlpha(string: "#000000", alpha: 0.35))
        print("\(APIConstants.Filter)?date=\(lblDate.text!)&time=\(lblTime.text!)&duration=\(lblDuration.text!)&capacity=\(lblCapacity.text!)&price=\(lblFees.text!)&lat=0.0&lng=0.0&city_id=&type=")
        
        http.Get(url: "\(APIConstants.Filter)?date=\(lblDate.text!)&time=\(lblTime.text!)&duration=\(lblDuration.text!)&capacity=\(lblCapacity.text!)&price=&lat=\(LatPosition)&lng=\(LngPosition)&city_id=&type=", parameters:[:], Tag: 1, headers: headers)
     
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
//        let formatter = DateFormatter()
//        formatter.dateFormat = "dd/MM/yyyy"
//        lblDate.text = formatter.string(from: datePicker.date)
        //dismiss date picker dialog
        self.view.endEditing(true)
    }
    @objc func datePickerValueChanged (datePicker: UIDatePicker) {
        
        let dateformatter = DateFormatter()
        if PickerFlag == "Time" {
            dateformatter.dateStyle = DateFormatter.Style.none
            dateformatter.timeStyle = DateFormatter.Style.long
            let dateValue = dateformatter.string(from: datePicker.date)
            let datee = dateformatter.date(from: dateValue)
            dateformatter.dateFormat = "a"
            let hpm = dateformatter.string(from: datee!)
            if hpm == "PM" {
                dateformatter.dateFormat = "HH"
                let hou = dateformatter.string(from: datee!)
                dateformatter.dateFormat = "mm"
                let Min = dateformatter.string(from: datee!)
                dateformatter.dateFormat = "ss"
              //  let Sec = dateformatter.string(from: datee!)
                let Time24 = "\(hou):\(Min):00"
                PTime = "\(hou):\(Min)"
                lblTime.text = Time24
            }else {
            
                dateformatter.dateFormat = "HH:mm:00"
            let Time24 = dateformatter.string(from : datee!)
                dateformatter.dateFormat = "HH:mm"
                PTime = dateformatter.string(from : datee!)
            lblTime.text = Time24
            }
        }else {
            
            dateformatter.dateStyle = DateFormatter.Style.medium
            dateformatter.timeStyle = DateFormatter.Style.none
            let dateValue = dateformatter.string(from: datePicker.date)
            let datee = dateformatter.date(from: dateValue)
            dateformatter.dateFormat = "YYYY-MM-dd"
            let Date24 = dateformatter.string(from: datee!)
            
            lblDate.text = Date24
            
            
        }
        
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
        self.view.endEditing(true)
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
                return "Select The Duration ( Per Hours ) "
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
extension AddMatchVC: HttpHelperDelegate {
    func receivedResponse(dictResponse: Any, Tag: Int) {
        print(dictResponse)
        AppCommon.sharedInstance.dismissLoader(self.view)
        let json = JSON(dictResponse)
        print(json)
        if Tag == 1 {
            
            let status =  json["status"]
            let message = json["message"]
            
            if status.stringValue == "1" {
                   items.removeAll()
                let result =  json["data"].arrayValue
                for json in result{
                    
                   // print(json["days"].arrayValue)
                //    var str:[String] = []
//                    if json["days"].array!.count > 0
//                    {
//                        for i in json["days"].array!{
//                            str.append(i.stringValue)
//                        }
//                    }
//                    print(str.joined(separator: ","))
                    
                    
                    let obj = PlaygroundModelClass(
                        owner_id: json["owner_id"].stringValue,
                        updated_at: json["updated_at"].stringValue,
                        name: json["name"].stringValue,
                        lng: json["lng"].stringValue,
                        hour_to: json["hour_to"].stringValue,
                        phone: json["phone"].stringValue,
                        image: json["image"].stringValue,
                        note: json["note"].stringValue,
                        lat: json["lat"].stringValue,
                        capacity: json["capacity"].stringValue,
                        address: json["address"].stringValue,
                        name_en: json["name_en"].stringValue,
                        city_id: json["city_id"].stringValue,
                        id: json["id"].stringValue,
                        name_ar: json["name_ar"].stringValue,
                        created_at: json["created_at"].stringValue,
                        hour_from: json["hour_from"].stringValue,
                        cancel_fee: json["cancel_fee"].stringValue,
                        price: json["price"].stringValue,
                        cancelation_time: json["cancelation_time"].stringValue,
                        days: "",
                        matches: ""
                        
                    )
                    items.append(obj)
                }
               
                let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                let cont = storyBoard.instantiateViewController(withIdentifier: "ChoosePlaygroundVC")as! ChoosePlaygroundVC
                cont.MatchDetais = MatchDetails
                cont.items = items
                self.present(cont, animated: true, completion: nil)
                
            } else {
                Loader.showError(message: message.stringValue)
            }
        }
        
    }
    func receivedErrorWithStatusCode(statusCode: Int) {
        print(statusCode)
        AppCommon.sharedInstance.alert(title: "Error", message: "\(statusCode)", controller: self, actionTitle: AppCommon.sharedInstance.localization("ok"), actionStyle: .default)
        
        AppCommon.sharedInstance.dismissLoader(self.view)
    }
    func retryResponse(numberOfrequest: Int) {
        
    }
}

extension AddMatchVC: shareLocationDelegateFilter {
    func shareLocationDelegate(lat: String, Long: String){
      
        print(lat,Long)
        self.LatPosition = lat
        self.LngPosition = Long
        lblLocation.text = "Lat: \(LatPosition) - Lng: \(LngPosition)"
        
}
    // chose location
    @IBAction func openMapToShareLocation(_ sender: UIButton) {
        let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle: nil)
        let secondView = storyBoard.instantiateViewController(withIdentifier: "ChooseLocationToShareViewController") as! ChooseLocationToShareViewController
        secondView.shareLocationDelegateFilt = self
        secondView.isfilter = true
        self.show(secondView, sender: true)
        //        show(secondView, sender: nil)
        
    }
}
