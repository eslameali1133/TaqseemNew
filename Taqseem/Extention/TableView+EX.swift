//
//  TableView+EX.swift
//  Taqseem
//
//  Created by apple on 2/17/19.
//  Copyright © 2019 OnTime. All rights reserved.
//

import Foundation
import UIKit
extension UITableView{
    func changeView() {
        self.tableFooterView = UIView()
        self.separatorInset = .zero
        self.contentInset = .zero
    }
}
