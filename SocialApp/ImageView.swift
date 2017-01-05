//
//  ImageView.swift
//  SocialApp
//
//  Created by Billy Morris on 1/4/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import UIKit

class ImageView: UIImageView {
    
    override func layoutSubviews() {
        layer.cornerRadius = self.frame.width / 2
       
        
    }
    
}
