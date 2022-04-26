//
//  TableCell.swift
//  RutubIos
//
//  Created by Kalandarov Vakil on 21.04.2022.
//

import UIKit

class TableCell: UITableViewCell {
    
    private lazy var nameLabel = UILabel()
    private lazy var videoImage = UIImageView()
    
    func createCell(text: Results) {
        createImage(url: text.thumbnailURL)
        createLabel(text: text.title)
        contentView.addSubview(nameLabel)
    }
    
    private func createImage(url: String) {
        contentMode = .scaleAspectFit
        guard let imageURL = URL(string: url) else { return }
        guard let imageData = try? Data(contentsOf: imageURL) else { return }
        let image = UIImage(data: imageData)
        self.videoImage.image = image
        videoImage.layer.cornerRadius = 10
        videoImage.clipsToBounds = true
        contentView.addSubview(videoImage)
        createAnchorImage()
    }
    
    private func createLabel(text: String) {
        nameLabel.numberOfLines = 2
        nameLabel.text = text
        contentView.addSubview(nameLabel)
        createAnchorLabel()
    }
}

extension TableCell {
    
    private func createAnchorImage() {
        videoImage.translatesAutoresizingMaskIntoConstraints = false
        videoImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        videoImage.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 5).isActive = true
        videoImage.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -200).isActive = true
        videoImage.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    private func createAnchorLabel() {
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.topAnchor.constraint(equalTo: videoImage.topAnchor, constant: 10).isActive = true
        nameLabel.leftAnchor.constraint(equalTo: videoImage.rightAnchor, constant: 10).isActive = true
        nameLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -5).isActive = true
        nameLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -30).isActive = true
    }
}
