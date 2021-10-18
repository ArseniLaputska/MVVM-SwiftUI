//
//  UsersConfigurator.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 18.10.21.
//

import Foundation

final class UsersConfigurator {
  
  public static func configureUsersView(
    with viewModel: UsersViewModel = UsersViewModel()) -> UsersView {
    
    let usersView = UsersView(viewModel: viewModel)
    return usersView
  }
}
