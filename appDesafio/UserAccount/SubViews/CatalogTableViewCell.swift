//
//  CatalogTableViewCell.swift
//  appDesafio
//
//  Created by MacBook on 23/01/22.
//

import Foundation
import UIKit

class CatalogTableViewCell : UITableViewCell{
    
    var ownContent : UIView?
    var nameBook : UILabel?
    var synopsisBook : UILabel?
    var author : UILabel?
    var genre : UILabel?
    var addButton : UIButton?
    var imageBook : UIImageView?
    var arrowButton : UIImageView?
    var favorito : UIImageView?
    var share : UIImageView?
    
    var book : Book?
    
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var blue = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
    
    init(book : Book){
        super.init(style: .default, reuseIdentifier: nil)
        self.book = book
        self.backgroundColor = .clear
        
        initUI()
    }
    
    func initUI(){
        
        ownContent = UIView(frame: CGRect(x: 0, y: 5, width: width - 20, height: height/7 + 10))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 10
        self.addSubview(ownContent!)
        
        imageBook = UIImageView(frame: CGRect(x: 20, y: 0, width: width / 6, height: width / 3))
        imageBook?.image = UIImage(named: book?.image ?? "")
        imageBook?.contentMode = .scaleAspectFit
        imageBook?.layer.masksToBounds = true
        ownContent?.addSubview(imageBook!)
        
        nameBook = UILabel(frame: CGRect(x: 105, y: 25, width: width/2, height: 20))
        nameBook?.text = book?.name
        nameBook?.textAlignment = .left
        nameBook?.font = .boldSystemFont(ofSize: 22)
        nameBook?.textColor = blue
        ownContent?.addSubview(nameBook!)
        
        author = UILabel(frame: CGRect(x: 105, y: 25, width: width/2, height: 70))
        author?.text = book?.author
        author?.numberOfLines = 0
        author?.textAlignment = .left
        author?.adjustsFontSizeToFitWidth = true
        author?.font = .boldSystemFont(ofSize: 17)
        ownContent?.addSubview(author!)
        
        genre = UILabel(frame: CGRect(x: 105, y: 50, width: width/2, height: 70))
        genre?.text = book?.genre
        genre?.numberOfLines = 0
        genre?.textAlignment = .left
        genre?.adjustsFontSizeToFitWidth = true
        genre?.font = .boldSystemFont(ofSize: 14)
        ownContent?.addSubview(genre!)
        
        arrowButton = UIImageView(frame: CGRect(x: width/8 * 6, y: 50, width: 50, height: 50))
        arrowButton?.image = UIImage(named: "chevron")
        arrowButton?.contentMode = .scaleAspectFit
        arrowButton?.layer.masksToBounds = true
        ownContent?.addSubview(arrowButton!)
        
        favorito = UIImageView(frame: CGRect(x: 105, y: 100, width: 30, height: 30))
        favorito?.image = UIImage(named: "favorito")
        favorito?.contentMode = .scaleAspectFit
        favorito?.layer.masksToBounds = true
        ownContent?.addSubview(favorito!)
        
        share = UIImageView(frame: CGRect(x: 155, y: 100, width: 25, height: 25))
        share?.image = UIImage(named: "share")
        share?.contentMode = .scaleAspectFit
        share?.layer.masksToBounds = true
        ownContent?.addSubview(share!)
       
        
        
//        addButton = UIButton(frame: CGRect(x: 5, y: (height/4 - 10) - 40, width: 90, height: 35))
//        addButton?.backgroundColor = .white
//        addButton?.setTitle("Agregar", for: .normal)
//        addButton?.setTitleColor(.orange, for: .normal)
//        addButton?.layer.borderColor = UIColor.orange.cgColor
//        addButton?.layer.borderWidth = 1
//        addButton?.layer.cornerRadius = 10
//        ownContent?.addSubview(addButton!)
        
        
        
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
