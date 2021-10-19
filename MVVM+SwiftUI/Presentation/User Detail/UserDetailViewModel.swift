//
//  UserDetailViewModel.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 19.10.21.
//

import UIKit
import Combine

class UserDetailViewModel: ObservableObject {
  // 1
  @Published public var avatar: UIImage = UIImage()
  
  // 2
  public let user: User
  
  // 3
  private var userPictureService: UserPictureServiceProtocol
  private var cancellables = Set<AnyCancellable>()
  
  init(user: User, userPictureService: UserPictureServiceProtocol = UserPictureService()) {
    
    self.user = user
    self.userPictureService = userPictureService
  }
  
  // 4
  public func onAppear() {
    getAvatarData()
  }
  
  // 5
  private func getAvatarData() {
    guard let pictureUrlString = user.picture else {
      print("URL doesn't exist.")
      return
    }
    
    userPictureService.getUserAvatarData(urlString: pictureUrlString)
      .receive(on: DispatchQueue.main)
      .sink { completion in
        switch completion {
        case .failure(let error):
          print(error)
        case .finished:
          break
        }
      } receiveValue: { [weak self] data in
        guard let image = UIImage(data: data) else { return }
        self?.avatar = image
      }
      .store(in: &cancellables)
  }
}
