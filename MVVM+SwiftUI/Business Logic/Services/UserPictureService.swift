//
//  UserPictureService.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 15.10.21.
//

import Foundation
import Combine

public enum UserPictureError: Error {
  case dataInvalid
}

protocol UserPictureServiceProtocol: AnyObject {
  var networker: NetworkerProtocol { get }
  
  func getUserAvatarData(urlString: String) -> AnyPublisher<Data, Error>
}

final class UserPictureService: UserPictureServiceProtocol {
  let networker: NetworkerProtocol
  
  init(networker: NetworkerProtocol = Networker()) {
    self.networker = networker
  }
  
  func getUserAvatarData(urlString: String) -> AnyPublisher<Data, Error> {
    guard let url = URL(string: urlString) else {
      return Fail<Data, Error>(error: NetworkError.invalidURL).eraseToAnyPublisher()
    }
    
    return networker.getData(url: url, headers: [:])
      .mapError { _ in UserPictureError.dataInvalid }
      .eraseToAnyPublisher()
  }
}
