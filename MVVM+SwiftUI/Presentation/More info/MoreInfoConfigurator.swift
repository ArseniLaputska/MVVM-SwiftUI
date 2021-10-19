//
//  MoreInfoConfigurator.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 19.10.21.
//

import Foundation

final class MoreInfoConfigurator {
  
  static func configureMoreInfoView(with user: User) -> MoreInfoView {
    let viewModel = MoreInfoViewModel(user: user)
    return MoreInfoView(viewModel: viewModel)
  }
}
