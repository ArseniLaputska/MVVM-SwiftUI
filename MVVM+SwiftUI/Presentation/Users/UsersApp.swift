//
//  UsersApp.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 18.10.21.
//

import SwiftUI

@main
struct UsersApp: App {
  
  var body: some Scene {
    WindowGroup {
      UsersConfigurator.configureUsersView()
    }
  }
}
