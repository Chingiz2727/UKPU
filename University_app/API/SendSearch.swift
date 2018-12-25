//
//  SendSearch.swift
//  University_app
//
//  Created by Чингиз on 04.08.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON
@available(iOS 10.0, *)
class GetLost : NSObject {
    
    class func Get (name:String,completion:@escaping(_ Data:[SearchData])->Void) {
        let url = MainParams().url
        let login = APItoken.getapictoken()
        let passwd = APItoken.getPassword()
        let query = "select phone,lost_thing_name,description,place,id,file_name from lost_and_found where deleted='false'"
        let params = [
            "login" : login,
            "query" : query,
            "passwd" : passwd
            ] 
        print(params)
        Alamofire.request("http://89.40.60.206:8080/univercity-rs-server/service/login", method: .post, parameters: params, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            if let data = response.data {
                switch response.result {
                case.success(let val):
                    var date = [SearchData]()
                    let json = JSON(val)
                    guard let dataarr =  json["result"].arrayObject as? [String] else {return}
                    let info = dataarr
                    
                    let maininfo = info.chunked(by: 6)
                    for info in maininfo {
                        if let information = info as? [String]
                        {
                            let Phone : String = {
                                if let phone = information[0] as? String {
                                    return phone as! String
                                }
                                return "No"
                            }()
                            let Name : String = {
                                if let nameStr = information[1] as? String {
                                    let wI = NSMutableString( string: nameStr )
                                    CFStringTransform( wI, nil, "Any-Hex/Java" as NSString, true )
                                    
                                    return wI as! String
                                }
                                return "No"
                            }()
                            let Description : String = {
                                if let Description = information[2] as? String {
                                    return Description as! String
                                }
                                return "No"
                            }()
                            let place : String = {
                                if let place = information[3] as? String {
                                    return place as! String
                                }
                                return "No"
                            }()
                            let photo : String = {
                                if let photo = information[5] as? String {
                                    return photo as! String
                                }
                                return "No"
                            }()
                            date.append(SearchData(img: photo, title: Name, place: place, contacts: Phone,description:Description.removingPercentEncoding!))
                        }
                        
                    }
                    print(dataarr)
                    completion(date)
                case .failure(let error):
                    print(error)
                }
            }
        }
    }

}
