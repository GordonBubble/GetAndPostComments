//
//  GetCommentsResponse.swift
//  GetAndPostComments
//
//  Created by Mac on 28.04.2021.
//

import Foundation

struct GetCommentsResponse {
    
    let comments: [CommentsModel]
    init(json: Any) throws {
        
        guard let array = json as? [[String: AnyObject]] else { throw NetworkError.failure }
        
        var comments = [CommentsModel]()
        
        for dict in array {
            guard let comment = CommentsModel(dict: dict) else { throw NetworkError.failure }
            comments.append(comment)
        }
        self.comments = comments
    }
}
