//
//  UserDetailConfigurator.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 19.10.21.
//

import Foundation

final class UserDetailConfigurator {
  
  public static func configureUserDetailView(with user: User) -> UserDetailView {
    let userDetailView = UserDetailView(viewModel: UserDetailViewModel(user: user))
    return userDetailView
  }
  
}
