//
//  CommentsTableViewCell.swift
//  GetAndPostComments
//
//  Created by Mac on 28.04.2021.
//

import UIKit

class CommentsCollectionViewCell: UICollectionViewCell {
    
        
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var bodyText: UITextView!
    
    func configure(_ comment: CommentsModel) {
        self.emailLabel.text = comment.email
        self.bodyText.text = comment.body
    }

}
