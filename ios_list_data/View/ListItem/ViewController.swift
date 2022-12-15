//
//  ViewController.swift
//  ios_list_data
//
//  Created by Nam on 09/12/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    
    var listItemViewModel = ListItemViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        listItemViewModel.fetchData()
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listItemViewModel.listArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        
        let item = listItemViewModel.listArticle[indexPath.row]
        
        cell.lableViewItem.text = item.title
        return cell
    }
}

extension ViewController:  UITableViewDelegate{
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if let vc = self.storyboard?.instantiateViewController(withIdentifier: "detailViewController")as? DetailViewController{
            
            
            self.navigationController?.pushViewController(vc, animated: true)
        }
    }
}

