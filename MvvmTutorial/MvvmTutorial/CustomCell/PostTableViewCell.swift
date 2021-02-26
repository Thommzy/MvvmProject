//
//  PostTableViewCell.swift
//  MvvmTutorial
//
//  Created by Tim on 26/02/2021.
//

import UIKit

class PostTableViewCell: UITableViewCell {
    var mainView: UIView = UIView()
    var mainLabel: UILabel = UILabel()
    
    var post: Posts? {
        didSet {
            mainLabel.text = post?.title
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        setupMainView()
        setupMainLabel()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupMainView() {
        contentView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.heightAnchor.constraint(equalTo: contentView.heightAnchor, multiplier: 0.9).isActive = true
        mainView.widthAnchor.constraint(equalTo: contentView.widthAnchor, multiplier: 1.0).isActive = true
    }
    
    func setupMainLabel() {
        mainView.addSubview(mainLabel)
        mainLabel.translatesAutoresizingMaskIntoConstraints = false
        mainLabel.frame = CGRect(x: -20, y: 0, width: mainView.frame.size.width, height: mainView.frame.size.height)
        mainLabel.text = "lksljkhg"
    }
}
