//
//  TopView.swift
//  SocialApp
//
//  Created by Billy Morris on 1/3/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit

class TopView: UIView {
    override func awakeFromNib() {
        super.awakeFromNib()
        
        layer.shadowColor = UIColor(red: SHADOW_GRAY, green: SHADOW_GRAY, blue: SHADOW_GRAY, alpha: 0.6).cgColor
        layer.shadowOpacity = 0.8
        layer.shadowRadius = 5.0
        layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        
    }


}
