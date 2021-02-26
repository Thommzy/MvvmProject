//
//  PostViewModel.swift
//  MvvmTutorial
//
//  Created by Tim on 26/02/2021.
//

import Foundation

protocol GetPost {
    func getAllPost(posts: [Posts?])
}

class PostViewModel {
    var delegate : GetPost?
    private var dataService: DataService?
    
    init(dataService: DataService) {
        self.dataService = dataService
    }
    
    func getPost() {
        self.dataService?.requestPost(completion: { (result, error) in
            self.delegate?.getAllPost(posts: result)
        })
    }
    
}
