//
//  User.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 15.10.21.
//

import Foundation

struct User: Codable, Identifiable {
  let id: String?
  let title: String?
  let firstName: String
  let lastName: String
  let email: String
  let dateOfBirth: String?
  let registerDate: String?
  let phone: String?
  let picture: String?
}

extension User {
  static func fake() -> User {
    return User(id: "1",
                title: "Test",
                firstName: "First Name",
                lastName: "Last Name",
                email: "test@yandex.ru",
                dateOfBirth: "2/3/1998",
                registerDate: "1/1/2021",
                phone: "79880",
                picture: nil)
  }
}
