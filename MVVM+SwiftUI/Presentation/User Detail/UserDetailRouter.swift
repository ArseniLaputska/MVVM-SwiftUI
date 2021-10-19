//
//  UserDetailRouter.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 19.10.21.
//

import SwiftUI

final class UserDetailRouter {
  
  public static func destinationForMoreInfoAction(user: User) -> some View {
    return MoreInfoConfigurator.configureMoreInfoView(with: user)
  }
}
