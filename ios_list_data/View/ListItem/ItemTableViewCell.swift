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
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    func bindData(article: Article) {
        if let title = article.title {
            lableViewItem.text = title
        }
        if let urlImage = article.urlToImage {
            let url = URL(string: urlImage)
            imageViewItem.kf.setImage(with: url)
        }
    }
    
    

}
