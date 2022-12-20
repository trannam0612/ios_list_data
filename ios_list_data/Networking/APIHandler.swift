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
    
    func fetchingAPIData(completion:@escaping(Result<[Article], Error>)-> Void){
        print("fetchingAPIData")
        let decoder : JSONDecoder = {
            let decoder = JSONDecoder()
            return decoder
        }()
        
        let url = "https://newsapi.org/v2/everything?q=tesla&from=2022-11-20&sortBy=publishedAt&apiKey=f11b6f9931e64e4586401e59a976989c"
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
                    let dataResponse =  data.articles!
                    DispatchQueue.main.async {
                        completion(.success(dataResponse))
                    }
                }catch{
                    DispatchQueue.main.async {
                        completion(.failure(error))
                    }
                    print("String(describing: error)", String(describing: error))
                    print("error catch: \(error.localizedDescription)")
                }
            case .failure(let error):
                completion(.failure(error))
                print("String(describing: error)", String(describing: error))
                print("error failure: \(error.localizedDescription)")
                
            }
        }.resume()
        
        
    }
}


