//
//  DataService.swift
//  MVVMSwiftUIApp
//
//  Created by Kaiserdem on 14.06.2021.
//

import Foundation

protocol DataService {
    
    func getUser(completion: @escaping([User]) -> Void)
}

class AppDataService: DataService {
    func getUser(completion: @escaping([User]) -> Void ) {
        
        DispatchQueue.main.async {
            completion([
                User(name: "Olya", id: 1),
                User(name: "Fedya", id: 2)

            ])
        }
    }
}
