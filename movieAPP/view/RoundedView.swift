//
//  RoundedView.swift
//  movieAPP
//
//  Created by AMN on 3/30/22.
//

import UIKit

class RoundedView: UIView {

    override func awakeFromNib() {
        super.awakeFromNib()
        self.layer.borderColor = #colorLiteral(red: 0.9049928784, green: 0.9163855314, blue: 0.9161852002, alpha: 1)
        self.layer.borderWidth = 1.0
        self.layer.cornerRadius = 20.0
        self.layer.shadowRadius = 10.0
        self.layer.shadowColor = #colorLiteral(red: 0.9049928784, green: 0.9163855314, blue: 0.9161852002, alpha: 1)
    }
   
}
