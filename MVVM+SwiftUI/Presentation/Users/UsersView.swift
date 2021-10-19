//
//  UsersView.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 18.10.21.
//

import SwiftUI

struct UsersView: View {
  
  // 1
  @ObservedObject var viewModel: UsersViewModel
  
  var body: some View {
    // 2
    NavigationView {
      // 3
      List(viewModel.users.data) { user in
        
        // 4
        NavigationLink(
          destination: UsersRouter.destinationForTappedUser(
            user: user)
        ) {
          Text(user.firstName)
        }
        
      }.navigationTitle("Users")
    }.onAppear(perform: {
      // 5
      viewModel.onAppear()
    })
  }
}

struct UsersView_Previews: PreviewProvider {
  static var previews: some View {
    UsersView(viewModel: UsersViewModel())
  }
}
