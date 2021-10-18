//
//  UsersRouter.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 18.10.21.
//

import SwiftUI

final class UsersRouter {
    
    public static func destinationForTappedUser(user: User) -> some View {
        return UserDetailConfigurator.configureUserDetailView(with: user)
    }
}
