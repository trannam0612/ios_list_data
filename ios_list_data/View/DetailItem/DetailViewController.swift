//
//  DetailViewController.swift
//  ios_list_data
//
//  Created by Nam on 09/12/2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleItem: UILabel!
    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet weak var descriptionItem: UILabel!
    
    var article:Article = Article()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleItem.text = article.title
        descriptionItem.text = article.description
        
        if let url = (URL(string: article.urlToImage ?? "")){
            imageItem.kf.indicatorType = .activity
            imageItem.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(1.0))], progressBlock: nil)
        }
        
    }
    
    
    
    
}
