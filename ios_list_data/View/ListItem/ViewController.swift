//
//  ViewController.swift
//  ios_list_data
//
//  Created by Nam on 09/12/2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBOutlet weak var searchBar: UISearchBar!
    var listItemViewModel = ListItemViewModel()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
        listItemViewModel.delegate = self
        fetchData(keyWord: "Apple")
        searchBar.delegate = self
        self.searchBar.endEditing(true)
        self.hideKeyboardWhenTappedAround()
    }
    
    func showLoading(){
        print("showLoading")
        let alert = UIAlertController(title: nil, message: "Please wait...", preferredStyle: .alert)
        
        let loadingIndicator = UIActivityIndicatorView(frame: CGRect(x: 10, y: 5, width: 50, height: 50))
        loadingIndicator.hidesWhenStopped = true
        loadingIndicator.style = UIActivityIndicatorView.Style.medium
        loadingIndicator.startAnimating();
        
        alert.view.addSubview(loadingIndicator)
        present(alert, animated: true, completion: nil)
    }
    
    func showErrorAlert(errorMessage:String){
        print("showErrorAlert")
        let alert = UIAlertController(title: nil, message: errorMessage , preferredStyle: .alert)
        
        alert.addAction(UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: {_ in
            self.fetchData(keyWord: nil)
        }))
        
        present(alert, animated: true, completion: nil)
    }
    
    func dismissAlert(){
        print("dismissAlert")
        self.dismiss(animated: false,completion: nil)
    }
    
    
    func fetchData(keyWord: String?) {
        print("fetchData")
        self.showLoading()
        self.listItemViewModel.fetchData(keyWord:keyWord ?? "Apple", time: nil)
        
    }
    
    
}

extension ViewController: ListItemDelegate{
    func didLoad() {
        print("delegate didLoad")
        DispatchQueue.main.async {
            self.dismissAlert()
            self.tableView.reloadData()
        }
    }
    
    func failLoad(_ errorMessage: String) {
        print("delegate failLoad")
                self.dismissAlert()
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                    self.showErrorAlert(errorMessage: errorMessage)
                }
    }
    
//    func failLoad() { errorMessage in
//        print("delegate failLoad")
//        self.dismissAlert()
//        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
//            self.showErrorAlert(errorMessage: errorMessage ?? "")
//        }
//
//    }
}

extension ViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
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
        
        let item = listItemViewModel.listArticle[indexPath.row]
        let storyboard = UIStoryboard(name: "DetailItem", bundle: nil)
        
        if let resultController = storyboard.instantiateViewController(identifier: "detailViewController") as? DetailViewController {
            resultController.article = item
            
            self.navigationController?.pushViewController(resultController, animated: true)        }
    }
}


extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        fetchData(keyWord: searchText)
        print("searchText:\(searchText)")
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}
