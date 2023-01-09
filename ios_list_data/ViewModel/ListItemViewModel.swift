//
//  ListItemViewModel.swift
//  ios_list_data
//
//  Created by Nam on 13/12/2022.
//

import Foundation
import Alamofire

protocol ListItemDelegate: class {
    func didLoad()
    func failLoad()
}


class ListItemViewModel {
    
    var apiHandler = APIHandler.sharedIntance
    
    var listArticle = [Article]()
    
    weak  var delegate: ListItemDelegate?
    var errorMessage : String?
    
    func fetchData(keyWord: String, time: String?){
        print("fetchData ViewModel")
        
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        print(dateFormatter.string(from: date))
        
        apiHandler.fetchingAPIData(keyWord: keyWord,time:  time ?? dateFormatter.string(from: date),sort: nil, completion:  {
            (result) in
            switch result {
            case .failure(let error):
                self.errorMessage = String(error.localizedDescription)
                print("error message: \(error.localizedDescription)")
                self.delegate?.failLoad()
            case .success(let dataItem):
                self.listArticle = dataItem.articles ?? []
                self.delegate?.didLoad()
            }
        }  );
        
    }
    
}
