//
//  UploadPhoto.swift
//  University_app
//
//  Created by Чингиз on 13.08.2018.
//  Copyright © 2018 Чингиз. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire

@available(iOS 10.0, *)
extension API {
    class func UploadSearchPhoto(photo: UIImage?,phone:String,lost_thing_name:String,description:String,place:String,completion: @escaping(_ error:Bool, _ success:Bool)-> Void)
    {
        UIImageJPEGRepresentation(photo ??  UIImage(named: "Robert")!, 1)
        let param = [
            "path" : "lost_and_found"
            ] as [String : String]
        let id = UserId.id

        let param1 = [
            "phone":phone,
            "path" : "lost_and_found",
            "lost_thing_name":lost_thing_name,
            "description":description,
            "place":place,
            "created_by" : String(id!)
            ] as [String : String]
        print(UserId.id!.dropFirst())
        print(param)
        print(param1)
        Alamofire.upload(
            multipartFormData: { MultipartFormData in
                let date = NSDate()
                let calendar = NSCalendar.current
                let year = calendar.component(.year, from: date as Date)
                let month = calendar.component(.month, from: date as Date)
                let hour = calendar.component(.hour, from: date as Date)
                let minutes = calendar.component(.minute, from: date as Date)
                let seconds = calendar.component(.second, from: date as Date)
                
                let name = "\(year)-\(month)-\(hour)-\(minutes)-\(seconds).jpeg"
                let filename = name
                let mimetype = "image/jpg"
                for (key, value) in param1 {
                    MultipartFormData.append(value.data(using: String.Encoding.utf8, allowLossyConversion: false)!, withName: key)
                }
                MultipartFormData.append(UIImageJPEGRepresentation(photo ?? UIImage(named: "Robert")!, 1)!,withName: "file", fileName: name, mimeType: "image/jpeg")
                print(filename)
                
                
        }, to: "https://89.40.60.206/test.php") { (result) in
            
            switch result {
            case .success(let upload, _, _):
                
                upload.responseJSON { response in
                    print(response.result.value)
                    
                }
                completion(false, true)
            case .failure(let encodingError): break
            completion(true,false)
            print(encodingError)
            }
            
            
}

    }
    class func UploadSearchAndFound(photo: UIImage,phone:String,lost_thing_name:String,description:String,place:String,completion: @escaping(_ error:Bool, _ success:Bool)-> Void)
    {
        UIImageJPEGRepresentation(photo, 1)
        let id = UserId.id
        let param = [
            "phone":phone,
            "path" : "lost_and_found",
            "lost_thing_name":lost_thing_name,
            "description":description,
            "place":place,
            "created_by" : String(id!)
            ] as [String : String]
        print(id)
        let myUrl = URL(string: "https://ukpu-systems.kz/terminal/lostandfound.php")
        let request = NSMutableURLRequest(url: myUrl!);
        request.httpMethod = "POST"
        
        let boundary = generateBoundaryString()
        
        request.setValue("multipart/form-data; boundary=\(boundary)", forHTTPHeaderField: "Content-Type")
        let imageData = UIImageJPEGRepresentation(photo, 1)
        if(imageData==nil)  { return; }
        request.httpBody = createBodyWithParameters(parameters: param, filePathKey: "upload", imageDataKey: imageData! as NSData, boundary: boundary) as Data
        let task = URLSession.shared.dataTask(with: request as URLRequest) {
            data, response, error in
            
            if error != nil {
                print("error=\(error)")
                return
            }else{
                print(response)
            }
            // You can print out response object
            print("******* response = \(response)")
            
            // Print out reponse body
            let responseString = NSString(data: data!, encoding: String.Encoding.utf8.rawValue)
            print("****** response data = \(responseString!)")
            
            do {
                let json = try JSONSerialization.jsonObject(with: data!, options: []) as? NSDictionary
                print(json)
                completion(true,false)
                
            }catch
            {
                completion(false,true)
                print(error)
            }
            
        }
        
        task.resume()
    }
    
}
