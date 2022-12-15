//
//  APIHandler.swift
//  ios_list_data
//
//  Created by Nam on 13/12/2022.
//

import Foundation
import Alamofire

class APIHandler{
    static let sharedIntance = APIHandler()
    
    
    func fetchingAPIData() -> [Article]{
        print("fetchingAPIData")
        let decoder : JSONDecoder = {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            return decoder
        }()
        
        var listArticle:[Article] = [];
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2022-11-15&sortBy=publishedAt&apiKey=f11b6f9931e64e4586401e59a976989c"
        AF
            .request(url)
            .validate(statusCode: 200..<300)
            .responseString(completionHandler:  {
                str in print("str:",str)
            })
            .responseDecodable(of: ListItemModel.self, decoder: decoder){
                
                
                (response) in
                switch response.result {
                case .success(let data):
                    
                    
                    do {
                         let dataResponse =  data.articles!
                        listArticle = dataResponse
                        print("listArticle: \(listArticle)")
                    } catch {
                        print("error catch: \(error.localizedDescription)")
                    }
                case .failure(let error):
                    print("error failure: \(error.localizedDescription)")
                    
                    listArticle = []
                }
            }
        
        print("listArticle123: \(listArticle)")
        return listArticle
        
    }
    
    
}


