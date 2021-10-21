//
//  UsersViewModel.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 18.10.21.
//

import Foundation
import Combine

class UsersViewModel: ObservableObject {
  
  // 1
  @Published public var users: Users
  
  // 2
  private var usersService: UsersServiceProtocol
  private var cancellable = Set<AnyCancellable>()
  
  // 3
  init(users: Users = Users(data: []), usersService: UsersServiceProtocol = UsersService()) {
    self.users = users
    self.usersService = usersService
  }
  
  public func onAppear() {
    self.getUsers(count: 40)
  }
  
  private func getUsers(count: Int) {
    usersService.getUsers(count: count)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error):
          print(error)
        case .finished: break
        }
      } receiveValue: { [weak self] users in
        self?.users = users
      }
      .store(in: &cancellable)
  }
}
