//
//  ChoosebackgroundCell.swift
//  Taqseem
//
//  Created by apple on 2/24/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import UIKit

class ChoosebackgroundCell: UITableViewCell {
    var MatchDetails : MatchDetailsModelClass!
    var items : PlaygroundModelClass!
    @IBOutlet weak var imgGround: customImageView!{
        didSet{
            
        }
    }
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblCapacity: UILabel!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var viewcontent: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        viewcontent.dropShadow()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    @IBAction func btnChoose(_ sender: Any) {
        if comedromneartoplay == true
                {
                    print(items._capacity)
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                    let cont = storyBoard.instantiateViewController(withIdentifier: "MyMatchVC")as! MyMatchVC
                    
                    
                    let currentController = self.getCurrentViewController()
                    currentController?.present(cont, animated: true, completion: nil)
        
                }else{
        
                    let storyBoard : UIStoryboard = UIStoryboard(name: "Match", bundle:nil)
                    let cont = storyBoard.instantiateViewController(withIdentifier: "playGroundDetailsVC")as! playGroundDetailsVC
            
                    cont.item = items
            cont.MatchDetails = MatchDetails
            
            let currentController = self.getCurrentViewController()
            currentController?.present(cont, animated: true, completion: nil)
        
                }
            }
    
    func getCurrentViewController() -> UIViewController? {
        
        if let rootController = UIApplication.shared.keyWindow?.rootViewController {
            var currentController: UIViewController! = rootController
            while( currentController.presentedViewController != nil ) {
                currentController = currentController.presentedViewController
            }
            return currentController
        }
        return nil
        
    }
    
    
    }

