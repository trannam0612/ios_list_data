//
//  ListItemViewModel.swift
//  ios_list_data
//
//  Created by Nam on 13/12/2022.
//

import Foundation
import Alamofire


class ListItemViewModel {
    
    var apiHandler = APIHandler.sharedIntance
    
    var listArticle :[Article] = []
    
    
    func fetchData(){
        print("fetchData")
        apiHandler.fetchingAPIData{
            
            (result) in
            switch result {
            case .failure(let error):
                self.listArticle = []
                print("error: \(error)")
                
            case .success(let dataItem):
                print("success1: \(dataItem)")
                self.listArticle = dataItem
                print("listArticle1: \(self.listArticle.count)")
            }
        };
        print("listArticle123: \(self.listArticle.count)")
        
    }
    
}
