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
    
    func fetchData()  {
        print("fetchData")
        listArticle =   apiHandler.fetchingAPIData()
        print("listArticle",listArticle)
    }
    
}
