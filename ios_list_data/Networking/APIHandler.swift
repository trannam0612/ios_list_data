//
//  APIRepository.swift
//  ios_list_data
//
//  Created by Nam  Trần on 09/01/2023.
//

import Foundation
import Alamofire

struct APIHandler{
    static let sharedIntance = APIHandler()
    func request<T: Decodable>(_ method: HTTPMethod
                               , _ URLString: String
                               , parameters: Parameters? = [:]
                               , headers: [String : String]? = [:],
                               completion:@escaping (T?) -> Void
                               , failure: @escaping (Error?) -> Void
                               ,model: T.Type
    ) {
        let url = "https://newsapi.org/v2" + URLString
        
        AF.request(url, method: method, parameters: parameters, encoding: URLEncoding.default, headers: ["Content-Type": "application/x-www-form-urlencoded"]).validate().responseString(completionHandler: {res in
            print("responString",res)
        })
        .responseDecodable(of: model.self) { response in
            switch response.result {
            case .success:
                print("it's success")
                completion(response.value)
            case .failure(let error):
                failure(error)
                print("\n\n===========Error===========")
                print("Error Code: \(error._code)")
                print("Error Messsage: \(error.localizedDescription)")
                if let data = response.data, let str = String(data: data, encoding: String.Encoding.utf8){
                    print("Server Error: " + str)
                    
                }
                debugPrint(error as Any)
                print("===========================\n\n")
            }
        }
    }
}
