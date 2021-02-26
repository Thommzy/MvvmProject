//
//  ViewController.swift
//  MvvmTutorial
//
//  Created by Tim on 26/02/2021.
//

import UIKit

class ViewController: UIViewController{
    
    var tableView: UITableView = UITableView()
    var globalPost: [Posts?] = []
    let viewModel = PostViewModel(dataService: DataService.shared)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        setupPostViewModel()
        setupTableView()
    }
    
    func setupPostViewModel() {
        viewModel.getPost()
        viewModel.delegate = self
    }
    
    func setupTableView() {
        tableView.register(PostTableViewCell.self, forCellReuseIdentifier: Utils.cellId)
        view.addSubview(tableView)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: view.frame.size.height)
    }
}

extension ViewController: GetPost, UITableViewDelegate, UITableViewDataSource  {
    
    func getAllPost(posts: [Posts?]) {
        DispatchQueue.main.async {
            self.globalPost = posts
            self.tableView.reloadData()
        }
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return globalPost.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Utils.cellId, for: indexPath) as! PostTableViewCell
        let current = globalPost[indexPath.row]
        cell.post = current
        return cell
    }
}

