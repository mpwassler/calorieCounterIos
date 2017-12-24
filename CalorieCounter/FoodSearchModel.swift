//
//  FoodSearchModel.swift
//  
//
//  Created by Mitchel on 4/9/16.
//
//

import Foundation
import Alamofire

class SearchResult {
    
    let name: String
    let group: String
    let ndbno: String
    
    init( name: String, group: String, ndbno: String ) {
        self.name = name
        self.group = group
        self.ndbno = ndbno
        
    }
}

class FoodSearchModel {
    
    var results = [SearchResult]()
    
    func search( _ term: String, onSearchComplete: @escaping (_ data: Array<SearchResult>) -> Void ) {
        Alamofire.request(.GET, "https://api.nal.usda.gov/ndb/search/", parameters: [
            "format":"json",
            "q":term,
            "sort":"n",
            "max": "25",
            "offset":"0",
            "api_key":"PapHi3WqcMOQsZAVQPJZcaIRDASRJF95IloD1nA4"
        ]).responseJSON { response in
            switch response.result {
                case .success(let JSON):
                    let response = JSON as! NSDictionary
                    let list = response.object(forKey: "list")?.object(forKey: "item") as? NSArray
                    self.results.removeAll()
                    if let dataList = list{
                        for item in dataList {
                            let obj = item as! NSDictionary
                            let result = SearchResult(
                                name: obj.object(forKey: "name") as! String,
                                group: obj.object(forKey: "group") as! String,
                                ndbno: obj.object(forKey: "ndbno") as! String
                            )
                            self.results.append(result)
                        }
                        onSearchComplete(data: self.results)
                    }
                    
                    print(self.results.count)
                case .failure(let error):
                    print("Request failed with error: \(error)")
            }
        }
    }
    
    func getItemData(_ ndbno: String, onSearchComplete: (_ data: MealModel) -> Void) {
        Alamofire.request(.GET, "https://api.nal.usda.gov/ndb/reports/", parameters: [
            "ndbno" : ndbno,
            "type" : "f",
            "format" : "json",
            "api_key":"PapHi3WqcMOQsZAVQPJZcaIRDASRJF95IloD1nA4"
        ]).responseJSON { response in
                switch response.result {
                case .success(let JSON):
                    print("\(JSON)")
                case .failure(let error):
                    print("Request failed with error: \(error)")
                }
            }
    }

}
