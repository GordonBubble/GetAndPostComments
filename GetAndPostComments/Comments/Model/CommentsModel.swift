//
//  CommentsModel.swift
//  GetAndPostComments
//
//  Created by Mac on 28.04.2021.
//

import Foundation

struct CommentsModel {
    
    var email: String?
    var body: String
    
    init?(dict: [String: AnyObject]) {
        
        guard let email = dict["email"] as? String,
              let body = dict["body"] as? String else { return nil }
        
        self.email = email
        self.body = body
    }
}
