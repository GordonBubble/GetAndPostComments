//
//  CommentsNetworkService.swift
//  GetAndPostComments
//
//  Created by Mac on 28.04.2021.
//

import Foundation

class CommentsNetworkService {
    
    private init() {}
    
   static func getComments(completion: @escaping (GetCommentsResponse) -> Void) {
        
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts/1/comments") else { return }
        
        NetworkService.shared.getData(url: url) { (json) in
            
            do {
                 let response = try GetCommentsResponse(json: json)
                completion(response)
            } catch {
                print(error)
            }
        }
    }
}
