//
//  ItemTableViewCell.swift
//  ios_list_data
//
//  Created by Nam on 09/12/2022.
//

import UIKit
import Kingfisher


class ItemTableViewCell: UITableViewCell {
    
    @IBOutlet weak var lableViewItem: UILabel!
    @IBOutlet weak var imageViewItem: UIImageView!
    @IBOutlet weak var createAtItem: UILabel!
    
    let dateFormatter = DateFormatter()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imageViewItem.layer.cornerRadius = 20
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func bindData(article: Article) {
        if let title = article.title {
            lableViewItem.text = title
        }
        
        if let urlImage = article.urlToImage {
            if let url = (URL(string: urlImage)){
                imageViewItem.kf.indicatorType = .activity
                imageViewItem.kf.setImage(with: url, placeholder: nil, options: [.transition(.fade(1.0))], progressBlock: nil)
            }
        }
        
        if let createAt = article.publishedAt {
            createAtItem.text = createAt
        }
    }
}
