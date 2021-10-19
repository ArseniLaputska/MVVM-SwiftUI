//
//  UserDetailView.swift
//  MVVM+SwiftUI
//
//  Created by Arseni Laputska on 19.10.21.
//

import SwiftUI
import Combine

struct UserDetailView: View {
  // 1
  @ObservedObject var viewModel: UserDetailViewModel
  
  let screenWidth = UIScreen.main.bounds.width
  
  // 2
  @State private var showingModalSheet = false
  
  var body: some View {
    // 3
    VStack {
      // 4
      Image(uiImage: viewModel.avatar)
        .resizable()
        .aspectRatio(contentMode: .fit)
        .frame(width: screenWidth * 0.2,
               height: screenWidth * 0.2,
               alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        .clipShape(Circle())
        .shadow(radius: 10)
        .overlay(Circle().stroke(Color.blue, lineWidth: 3))
        .padding()
      
      // 5
      HStack {
        Text(viewModel.user.firstName)
        Text(viewModel.user.lastName)
      }
      
      // 6
      Button(action: {
        // 7
        showingModalSheet.toggle()
      }) {
        
        Text("Get more info")
          .padding()
          .frame(width: screenWidth * 0.6)
          .foregroundColor(Color.white)
          .background(Color.white)
          .cornerRadius(16)
      }
      .sheet(isPresented: $showingModalSheet, content: {
        // 8
        UserDetailRouter.destinationForMoreInfoAction(user: viewModel.user)
      })
      .padding(.top, 20)
      Spacer()
    }
    .navigationTitle(viewModel.user.firstName)
    .onAppear(perform: {
      // 9
      self.viewModel.onAppear()
    })
  }
}

struct UserDetailView_Previews: PreviewProvider {
  static var previews: some View {
    UserDetailView(viewModel: UserDetailViewModel(user: User.fake()))
  }
}
