//
//  Post.swift
//  SocialApp
//
//  Created by Billy Morris on 1/10/17.
//  Copyright © 2017 Billy Morris. All rights reserved.
//

import Foundation
import Firebase

class Post {

    private var _caption: String!
    private var _likes: Int!
    private var _url: String!
    private var _postKey: String!
    private var _postRef: FIRDatabaseReference!
    
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
        _postRef = DataService.ds.REF_POSTS.child(_postKey)
    }
    
    func adjustLikes(addLike: Bool) {
        if addLike {
            _likes = _likes + 1
        } else {
            _likes = _likes - 1
        }
        _postRef.child("likes").setValue(_likes)
    }
}

















