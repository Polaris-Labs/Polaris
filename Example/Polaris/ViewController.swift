//
//  ViewController.swift
//  Polaris
//
//  Created by Sidus-WeiRuJian on 07/07/2023.
//  Copyright (c) 2023 Sidus-WeiRuJian. All rights reserved.
//

import UIKit
import Polaris
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        PolarisConfig.default.verbose = false
        
        PolarisConfig.default.pluings = [
            NetworkLoggerPlugin()
        ]
        
        Polaris.default.test()
        
//        Polaris.default.provider.request(.target(Api.lyrical)) { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let json = try JSONSerialization.jsonObject(with: response.data)
//                    print(json)
//                } catch {
//                    print(error)
//                }
//            case let .failure(error):
//                print(error)
//            }
//        }
//
//        Api.lyrical.request { result in
//            switch result {
//            case let .success(response):
//                do {
//                    let json = try JSONSerialization.jsonObject(with: response.data)
//                    print(json)
//                } catch {
//                    print(error)
//                }
//            case let .failure(error):
//                print(error.message)
//            }
//        }
//
        Api.lyrical.request(LyricalModel.self) { result in
            switch result {
            case let .success(model):
                print(model.data.sentence)
                print("Msg: \(model.msg)")
            case let .failure(error):
                print(error.message)
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}


struct Lyrical: Codable {
    var id: Int
    var author: String
    var author_pinyin: String
    var catalog: String
    var catalog_pinyin: String
    var ctime: Int
    var name: String
    var sentence: String
    var src_url: String
    var theme: String
    var theme_pinyin: String
}

struct LyricalModel: Codable {
     var code: Int
    @Default<String.Value> var msg: String
//    @Default<String> var uuid: String
    var data: Lyrical
}
