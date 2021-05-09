//
//  ViewController.swift
//  GetAndPostComments
//
//  Created by Mac on 28.04.2021.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var collectionView: UICollectionView!
    
    var comments = [CommentsModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.delegate = self
        collectionView.dataSource = self
        
        
        CommentsNetworkService.getComments { (response) in
            self.comments = response.comments
            self.collectionView.reloadData()
        }
    }
    
    @IBAction func addComment(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "Add New Name", message: "", preferredStyle: .alert)

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter text"
        }

        let saveAction = UIAlertAction(title: "Save", style: .default, handler: { [weak self] alert -> Void in
            guard let self = self else { return }
            let firstTextField = alertController.textFields![0] as UITextField
            let secondTextField = alertController.textFields![1] as UITextField
            
            PostComment.postComment(email: firstTextField.text ?? "empty", text: secondTextField.text ?? "empty")
            self.collectionView.reloadData()
        })

        let cancelAction = UIAlertAction(title: "Cancel", style: .default, handler: nil )

        alertController.addTextField { (textField : UITextField!) -> Void in
            textField.placeholder = "Enter email"
        }

        alertController.addAction(saveAction)
        alertController.addAction(cancelAction)

        self.present(alertController, animated: true, completion: nil)
        
        
    }
    

}

extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        comments.count
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CommentsCollectionViewCell
        let comment = comments[indexPath.item]
        cell.configure(comment)
        
        cell.layer.cornerRadius = 10
        cell.clipsToBounds = true
        
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 3)

    }
    
}
