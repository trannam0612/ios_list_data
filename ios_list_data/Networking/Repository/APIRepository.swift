//
//  APIHandler.swift
//  ios_list_data
//
//  Created by Nam on 13/12/2022.
//

import Foundation
import Alamofire

class APIRepository{
    static let sharedIntance = APIRepository()
    
    func fetchData(completion:@escaping(Result<ListItemModel, Error>)-> Void, keyword:String?, dateTime:String){
        print("fetchData")
        let parameters: Parameters = ["q": keyword ?? "tesla"
                                      ,"from":dateTime
                                      ,"sortBy": publishAt
                                      , "apiKey":API_KEY]
        
        let path = "/everything"
        APIHandler.sharedIntance.request(.get
                                         , path
                                         , parameters: parameters
                                         , completion: completion
        )
    }
}


