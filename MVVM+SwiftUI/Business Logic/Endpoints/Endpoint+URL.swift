//
//  Endpoint+URL.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 15.10.21.
//

import Foundation

extension Endpoint {
  
  var url: URL {
    var components = URLComponents()
    components.scheme = "https"
    components.host = "dummyapi.io"
    components.path = "/data/v1" + path
    components.queryItems = queryItems
    
    guard let url = components.url else {
      preconditionFailure("Invalid URL components: \(components)")
    }
    
    return url
  }
  
  var headers: [String: Any] {
    return [
      "app-id": "61699a7c882290360c9c67ce"
    ]
  }
  
}
