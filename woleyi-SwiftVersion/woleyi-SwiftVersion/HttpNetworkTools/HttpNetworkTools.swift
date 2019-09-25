//
//  HttpNetworkTools.swift
//  woleyi-SwiftVersion
//
//  Created by ENERGY on 2019/9/24.
//  Copyright © 2019 ENERGY. All rights reserved.
//

import UIKit
import Alamofire

let BASE_URL = "http://up.yushangai.top/api/v202/"//线上"
enum MethodType {
    case GET
    case POST
}

class HttpNetworkTools{
    class func requestData(type : MethodType, parameter : [String : NSString]? = nil, urlString : String,  finishCallBack : @escaping (_ result : AnyObject) -> ()){
        var netType = HTTPMethod.get
        if type == .GET {
            netType = HTTPMethod.get
        }else{
            netType = HTTPMethod.post
        }
        Alamofire.request("\(BASE_URL)\(urlString)", method: netType, parameters: parameter, encoding: URLEncoding.default, headers: nil).responseJSON { (response) in
            guard let resultData = response.result.value else{
                print(response.result.error)
                return
            }
            finishCallBack(resultData as AnyObject)
        }
    }
}
