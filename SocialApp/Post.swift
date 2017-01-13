//
//  Post.swift
//  SocialApp
//
//  Created by Billy Morris on 1/10/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import Foundation

class Post {

    private var _caption: String!
    private var _likes: Int!
    private var _url: String!
    private var _postKey: String!
    
    var caption: String {
        return _caption
    }
    var likes: Int {
        return _likes
    }
    var url: String {
        return _url
    }
    var postkey: String {
        return _postKey
    }
    
    init(caption: String, url: String, likes: Int) {
        self._caption = caption
        self._url = url
        self._likes = likes
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        self._postKey = postKey
        
        if let caption = postData["caption"] as? String {
            self._caption = caption
        }
        if let url = postData["imageUrl"] as? String {
            self._url = url
        }
        if let likes = postData["likes"] as? Int {
            self._likes = likes
        }
    }
    
    
    
    
    
    
    
    
}
