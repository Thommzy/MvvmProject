//
//  PostModel.swift
//  MvvmTutorial
//
//  Created by Tim on 26/02/2021.
//

import Foundation

struct Posts: Codable {
    let userId: Int?
    let id: Int?
    let title: String?
    let body: String?
}
