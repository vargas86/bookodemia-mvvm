//
//  DetailProductViewController.swift
//  appDesafio
//
//  Created by MacBook on 23/01/22.
//

import UIKit

class DetailProductViewController: UIViewController {
    
    var book : Book?
    
    init(book : Book){
        //Inicializar un viewcontroller
        super.init(nibName: nil, bundle: nil)
        self.book = book
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //var book : Book?
    var bookName : UILabel?
    var bookSynopsis : UITextView?
    var bookImage : UIImageView?
    var bookAuthor : UILabel?
    var bookAbout : UITextView?
    var bookGenre : UILabel?
    var bookIndexAuthor : UILabel?
    var bookIndexName : UILabel?
    
    var productContentView : UIView?
    var productCard : UIView?
    var descripcionView : UIView?
    var labelTitleDescription : UILabel?
        
    var userName : UILabel?
    var banner : UIImageView?
    var backButton : UIButton?
    var filter : UIImageView?
    
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    var backgroundColor = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    var brownColor = UIColor(displayP3Red: 64/255, green: 46/255, blue: 32/255, alpha: 1)
    var pinkBlueColor = UIColor(displayP3Red: 283/255, green: 162/255, blue: 129/255, alpha: 1)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        initUI()
        createProductView()
        createDescription()
   
    }
    
    func initUI(){

        userName = UILabel(frame: CGRect(x: 20, y: 60, width: width, height: 70))
        userName?.text = "Detalle del Libro"
        userName?.numberOfLines = 1
        userName?.textAlignment = .center
        userName?.font = .boldSystemFont(ofSize: 20)
        view.addSubview(userName!)
        
        filter = UIImageView(frame: CGRect(x: (width/8 * 2) - 10, y: 75, width: 20, height: 40))
        filter?.image = UIImage(named: "filter")
        filter?.contentMode = .scaleAspectFit
        view.addSubview(filter!)
        
        backButton = UIButton(frame: CGRect(x: 20, y: 75, width: 40, height: 40))
        backButton?.setImage(UIImage(named: "previous"), for: .normal)
        backButton?.addTarget(self, action: #selector(backAction), for: .touchUpInside)
        view.addSubview(backButton!)
    }
    
    func createProductView(){
        productContentView = UIView(frame: CGRect(x: 20, y: height/5, width: width - 40, height: height/4))
//        productContentView?.backgroundColor = .blue
        view.addSubview(productContentView!)
        
        productCard = UIView(frame: CGRect(x: 0, y: height/8, width: width - 40, height: height/8))
        productCard?.backgroundColor = .white
        productCard?.layer.cornerRadius = 20
        
        productContentView?.addSubview(productCard!)
        
        //Imagen
//        bookImage = UIImageView(frame: CGRect(x: 20, y: 0, width: 200, height: 200))
//        bookImage?.image = UIImage(named: book?.image ?? "")
//        bookImage?.contentMode = .scaleAspectFit
//        bookImage?.layer.masksToBounds = true
//        productContentView?.addSubview(bookImage!)
        
        bookImage = UIImageView(frame: CGRect(x: 0, y: 0, width: width / 6, height: width / 3))
        bookImage?.image = UIImage(named: book?.image ?? "")
        bookImage?.contentMode = .scaleAspectFit
        bookImage?.layer.masksToBounds = true
        productContentView?.addSubview(bookImage!)
        
        //Libro
        bookName = UILabel(frame: CGRect(x: ((width - 40)/3) + 30, y:10 , width: (width - 40) - (((width - 40)/3) + 40), height: 30))
        bookName?.text = book?.name
        bookName?.backgroundColor = .clear
        bookName?.textAlignment = .center
        bookName?.font = .boldSystemFont(ofSize: 20)
        productCard?.addSubview(bookName!)
        
        //Autor
//        productPrice = UILabel(frame: CGRect(x: ((width - 40)/3) + 30, y: 50, width: (width - 40) - (((width - 40)/3) + 40), height: (height/8) - 60))
//        productPrice?.text = "$\(product?.precio ?? 0.0)"
//        productPrice?.font = .systemFont(ofSize: 18)
//        productPrice?.textAlignment = .center
//        productPrice?.backgroundColor = .clear
//        productCard?.addSubview(productPrice!)
        
    }
    
    func createDescription(){
        
        descripcionView = UIView()
        descripcionView?.backgroundColor = .gray
        view.addSubview(descripcionView!)
        
        descripcionView?.addAnchorsAndSize(width: nil, height: height/4, left: 20, top: 15, right: 20, bottom: nil, withAnchor: .top, relativeToView: productContentView)
       
        
        labelTitleDescription = UILabel()
        labelTitleDescription?.text = "Descripción"
        labelTitleDescription?.font = .boldSystemFont(ofSize: 22)
        labelTitleDescription?.backgroundColor = .purple
        labelTitleDescription?.textAlignment = .center
        
        descripcionView?.addSubview(labelTitleDescription!)
        labelTitleDescription?.addAnchorsAndSize(width: nil, height: 50, left: 10, top: 10, right: 10, bottom: nil)
        
        
        bookSynopsis = UITextView()
        bookSynopsis?.backgroundColor = .orange
        bookSynopsis?.text = book?.synopsis ?? ""
        
        descripcionView?.addSubview(bookSynopsis!)
        descripcionView?.addAnchorsAndSize(width: nil, height: 80, left: 10, top: 10, right: 10, bottom: nil, withAnchor: .top, relativeToView: labelTitleDescription)
        
    }
    
    
    
    @objc func backAction(){
        print("Back")
        dismiss(animated: true)
    }
    
    
}
