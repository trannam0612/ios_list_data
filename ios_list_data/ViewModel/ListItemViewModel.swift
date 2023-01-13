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
    func failLoad(_ errorMessage:String)
}


class ListItemViewModel {
    
    var listArticle = [Article]()
    
    weak  var delegate: ListItemDelegate?
    
    
    func getCurrentTime() -> String{
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.string(from: date)
        
    }
    
    func fetchData(keyWord: String, time: String?){
        print("fetchData ViewModel")
        APIRepository.sharedIntance.fetchData(completion:  {
            (result) in
            switch result {
            case .failure(let error):
                print("error message: \(error.localizedDescription)")
                self.delegate?.failLoad(String(error.localizedDescription))
            case .success(let dataItem):
                self.listArticle = dataItem.articles ?? []
                self.delegate?.didLoad()
            }
        }  ,keyword: keyWord, dateTime: time ?? getCurrentTime()
        );
    }
    
}
