//
//  AddPlayGroundVC.swift
//  Taqseem
//
//  Created by Husseinomda16 on 3/5/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

protocol shareLocationDelegate {
    func shareLocationDelegate(lat: String, Long: String)
}
class AddPlayGroundVC: UIViewController  , UIPickerViewDelegate , UIPickerViewDataSource{
    
    var AlertController: UIAlertController!
    let Imagepicker = UIImagePickerController()
    
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
    @IBOutlet weak var txtPhoneNum: UITextField!
    @IBOutlet weak var txtPrice: UITextField!
    @IBOutlet weak var txtEnglishName: UITextField!
    @IBOutlet weak var txtArabicName: UITextField!
    @IBOutlet weak var map: UIView!
     @IBOutlet weak var MapImageView: customImageView!
    var LatPosition = "0.0"
    var LngPosition = "0.0"
    @IBOutlet weak var btnFri: UIButton!
    @IBOutlet weak var btnThu: UIButton!
    @IBOutlet weak var btnWed: UIButton!
    @IBOutlet weak var btnTus: UIButton!
    @IBOutlet weak var btnMon: UIButton!
    @IBOutlet weak var btnSun: UIButton!
    @IBOutlet weak var btnSat: UIButton!
    
    var isbtnFri = false
    var isbtnThu = false
    var isbtnWed = false
    var isbtnTus = false
    var isbtnMon = false
    var isbtnSun = false
    var isbtnSat = false

    @IBOutlet weak var imageProfile: customImageView!{
        didSet{
            imageProfile.layer.cornerRadius = imageProfile.frame.width/2
            imageProfile.clipsToBounds = true
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        LoadMapImage(lat: LatPosition, Long: LngPosition)
         SetupUploadImage()
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
        if  btnFri.backgroundColor == UIColor.clear {
        btnFri.backgroundColor = UIColor.hexColor(string:"#009C9E")
            isbtnFri = true
        }else{
            btnFri.backgroundColor = UIColor.clear
                isbtnFri = false
        }
    }
    @IBAction func btnThu(_ sender: Any) {
        if  btnThu.backgroundColor == UIColor.clear {
            btnThu.backgroundColor = UIColor.hexColor(string:"#009C9E")
            isbtnThu = true
        }else{
            btnThu.backgroundColor = UIColor.clear
            isbtnThu = false
        }
    }
    @IBAction func btnWed(_ sender: Any) {
        if  btnWed.backgroundColor == UIColor.clear {
            btnWed.backgroundColor = UIColor.hexColor(string:"#009C9E")
            isbtnWed = true
        }else{
            btnWed.backgroundColor = UIColor.clear
            isbtnWed = false
        }
    }
    @IBAction func btnTus(_ sender: Any) {
        if  btnTus.backgroundColor == UIColor.clear {
            btnTus.backgroundColor = UIColor.hexColor(string:"#009C9E")
            isbtnTus = true
        }else{
            btnTus.backgroundColor = UIColor.clear
            isbtnTus = false
        }
    }
    @IBAction func btnMon(_ sender: Any) {
        if  btnMon.backgroundColor == UIColor.clear {
            btnMon.backgroundColor = UIColor.hexColor(string:"#009C9E")
            isbtnMon = true
        }else{
            btnMon.backgroundColor = UIColor.clear
            isbtnMon = false
        }
    }
    @IBAction func btnSun(_ sender: Any) {
        if  btnSun.backgroundColor == UIColor.clear {
            btnSun.backgroundColor = UIColor.hexColor(string:"#009C9E")
            isbtnSun = true
        }else{
            btnSun.backgroundColor = UIColor.clear
            isbtnSun = false
        }
    }
    @IBAction func btnSat(_ sender: Any) {
        
        if  btnSat.backgroundColor == UIColor.clear {
            btnSat.backgroundColor = UIColor.hexColor(string:"#009C9E")
            isbtnSat = true
        }else{
            btnSat.backgroundColor = UIColor.clear
            isbtnSat = false
        }
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


extension AddPlayGroundVC: shareLocationDelegate {
    func shareLocationDelegate(lat: String, Long: String){
        self.tabBarController?.tabBar.isHidden = false
        print(lat,Long)
        self.LatPosition = lat
        self.LngPosition = Long
        LoadMapImage(lat: lat, Long: Long)
        
    }
    
    func LoadMapImage(lat: String, Long: String)
    {
        
        let Lat = lat
        let Lng = Long
        let staticMapUrl: String = "http://maps.google.com/maps/api/staticmap?markers=color:red|\(Lat),\(Lng)&\("zoom=17&size=\(2 * Int(MapImageView.frame.size.width))x\(2 * Int(MapImageView.frame.size.height))")&sensor=true"
        
        let mapul = "https://maps.google.com/maps/api/staticmap?key=AIzaSyB-3KGui1I1wguVGxALFNa5cld4ijK8fS4&markers=color:red|\(Lat),\(Lng)&\("zoom=17&size=\(2 * Int(MapImageView.frame.size.width))x\(2 * Int(MapImageView.frame.size.height))")&sensor=true&fbclid=IwAR2rsCS0d9D-aow4D3AWs9-fv3EdiSDsFFUU80Gm6oQ7vCZwlXUaPjUOmU8"
        
        let urlI = URL(string: mapul.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)!)
        if let url = urlI {
            print("map: \(urlI!)")
            MapImageView.loadimageUsingUrlString(url: mapul)
        } else{
            print("map: \(urlI)")
            print("nil")
        }
        
    }
    
    // chose location
    @IBAction func openMapToShareLocation(_ sender: UIButton) {
    
        let storyBoard : UIStoryboard = UIStoryboard(name: "Owner", bundle: nil)
        let secondView = storyBoard.instantiateViewController(withIdentifier: "ChooseLocationToShareViewController") as! ChooseLocationToShareViewController
        secondView.shareLocationDelegate = self
        self.show(secondView, sender: true)
        //        show(secondView, sender: nil)
        
    }
    
}
extension AddPlayGroundVC:UIImagePickerControllerDelegate,UINavigationControllerDelegate {
    
    
    func SetupUploadImage()
    {
        AlertController = UIAlertController(title:"" , message:AppCommon.sharedInstance.localization("ChoseImage") , preferredStyle: UIAlertController.Style.actionSheet)
        
        let Cam = UIAlertAction(title: AppCommon.sharedInstance.localization("camera"), style: UIAlertAction.Style.default, handler: { (action) in
            self.openCame()
        })
        let Gerall = UIAlertAction(title: AppCommon.sharedInstance.localization("gallery"), style: UIAlertAction.Style.default, handler: { (action) in
            self.opengelar()
        })
        
        let Cancel = UIAlertAction(title: AppCommon.sharedInstance.localization("cancel"), style: UIAlertAction.Style.cancel, handler: { (action) in
            //
        })
        
        self.AlertController.addAction(Cam)
        self.AlertController.addAction(Gerall)
        self.AlertController.addAction(Cancel)
    }
    
    func openCame(){
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.camera) {
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.camera
            imagePicker.allowsEditing = false
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func opengelar(){
        
        
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary){
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.allowsEditing = true
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            self.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    @IBAction func UpdateImage(_ sender: UIButton) {
        Imagepicker.delegate = self
        Imagepicker.allowsEditing = false
        self.present(AlertController, animated: true, completion: nil)
        
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        guard let selectedImage = info[.originalImage] as? UIImage else {
            fatalError("Expected a dictionary containing an image, but was provided the following: \(info)")
        }
        
        imageProfile.image = selectedImage
        
        picker.dismiss(animated: true, completion: nil)
    }
    
    
}
