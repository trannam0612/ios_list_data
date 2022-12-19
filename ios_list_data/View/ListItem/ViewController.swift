//
//  ViewController.swift
//  ios_list_data
//
//  Created by Nam on 09/12/2022.
//

import UIKit

class ViewController: UIViewController,ListItemDelegate {
        func didLoad() {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    

    @IBOutlet weak var tableView: UITableView!
    
    
    var listItemViewModel = ListItemViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        listItemViewModel.delegate = self
        listItemViewModel.fetchData()
        
    }
    override func viewDidAppear(_ animated: Bool) {
        
        DispatchQueue.main.async {
                   self.tableView.reloadData()
               }
    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("count:", listItemViewModel.listArticle.count)
        return listItemViewModel.listArticle.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTableViewCell", for: indexPath) as? ItemTableViewCell else { return UITableViewCell() }
        
        let item = listItemViewModel.listArticle[indexPath.row]
        cell.bindData(article: item)
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

