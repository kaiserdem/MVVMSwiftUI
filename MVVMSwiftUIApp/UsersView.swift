//
//  ContentView.swift
//  MVVMSwiftUIApp
//
//  Created by Kaiserdem on 14.06.2021.
//

import SwiftUI

struct UsersView: View {
    
    @StateObject var viewModel: ViewModel
    
    init(viewModel: ViewModel = .init()) {
        _viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        List(viewModel.users) { user in
            Text(user.name)
        }
        .onAppear(perform: viewModel.getData)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        let user = User(name: "Olya", id: 1)
        let viewModel = UsersView.ViewModel()
        viewModel.users = [user]
        return UsersView(viewModel: viewModel)
    }
}

extension UsersView {
    class ViewModel: ObservableObject {
        
        @Published var users = [User]()
        
        let dataService: DataService
        
        init(dataService: DataService = AppDataService()) {
            self.dataService = dataService
        }
        
        func getData() {
            dataService.getUser { [weak self] users in
                self?.users = users
            }
        }
    }
}

struct User: Codable, Identifiable {
    let name: String
    let id: Int
}
