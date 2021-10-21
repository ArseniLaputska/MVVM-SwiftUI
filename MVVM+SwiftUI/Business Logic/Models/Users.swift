//
//  Users.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 15.10.21.
//

import Foundation

struct Users: Codable {
  let data: [User]
}

extension Users {
  static func fake() -> Users {
    return Users(data: [User.fake()])
  }
}
