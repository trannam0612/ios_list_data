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
    
    func fetchingAPIData(keyWord: String, time:String,sort: String?, completion:@escaping(Result<ListItemModel, Error>)-> Void){
        print("fetchingAPIData")
        let decoder : JSONDecoder = {
            let decoder = JSONDecoder()
            return decoder
        }()
        let url = "https://newsapi.org/v2/everything?q=\(keyWord)&from=\(time)&sortBy=\(sort ?? publishAt)&apiKey=\(API_KEY)"
        _ = AF
            .request(url)
            .validate(statusCode: 200..<300)
            .responseString(completionHandler:  {
                str in print("str:",str)
            })
            .responseDecodable(of: ListItemModel.self, decoder: decoder)
        {
            (response) in
            switch response.result {
            case .success(let data):
                do {
                        completion(.success(data))
                }catch{
                        completion(.failure(error))
                    print("String(describing: error)", String(describing: error))
                    print("error catch: \(error.localizedDescription)")
                }
            case .failure(let error):
                completion(.failure(error))
                print("String(describing: error)", String(describing: error))
                print("error failure: \(error.localizedDescription)")
                
            }
        }
        
        
    }
}


