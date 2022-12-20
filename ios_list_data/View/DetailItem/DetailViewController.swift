//
//  DetailViewController.swift
//  ios_list_data
//
//  Created by Nam on 09/12/2022.
//

import UIKit
import Kingfisher

class DetailViewController: UIViewController {
    @IBOutlet weak var imageViewItem: UIImageView!
    
    @IBOutlet weak var titleItem: UILabel!
    var titleArticles = ""
    var descriptionArticles = ""
    var imageUrl = ""
    override func viewDidLoad() {
        
        print("viewDidLoad", titleArticles)
        super.viewDidLoad()
        
//        titleItem?.text = "titleArticles"
        
    }
    

    

}
