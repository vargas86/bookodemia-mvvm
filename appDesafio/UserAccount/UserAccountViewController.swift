//
//  UserAccountViewController.swift
//  appDesafio
//
//  Created by MacBook on 23/01/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class UserAccountViewController : UIViewController, UITextFieldDelegate  {

    var tableView : UITableView?
    var dataSource : CatalogObject?
    var userName : UILabel?
    var UserNameLogged : UILabel?
//    var UserNameLoggedName : UILabel?
    var logo : UIImageView?
    var banner : UIImageView?
    var searchContent : UIView?
    var byBooksButton : UIButton?
    var byGenreButton : UIButton?
    var byAuthorButton : UIButton?
    var phraseBook : UILabel?
    
    var logout: UIButton?
    var SearchTextField: UITextField!
    var SearchPressed : UIButton?
    
    var backgroundColor = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    var blue = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
    var black = UIColor(displayP3Red: 0.66, green: 0.66, blue: 0.66, alpha: 1)
    var gray = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    var skyBlue = UIColor(displayP3Red: 0.11, green: 0.167, blue: 0.188, alpha: 1)
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var ref: DatabaseReference?
    
    var booksManager =  BooksManager()

    override func viewDidLoad() {
        super.viewDidLoad()
        //SearchTextField.delegate = self
        ref = Database.database().reference() //Conexión a la base de datos
        view.backgroundColor = backgroundColor
        
        getData()
        initUI()
    }
    
    func initUI(){
        
        logout = UIButton(frame: CGRect(x: ((width/10)*8)+20, y: 75, width: 40, height: 40))
        logout?.setImage(UIImage(named: "logout2"), for: .normal)
        logout?.addTarget(self, action: #selector(logOutUser), for: .touchUpInside)
        view.addSubview(logout!)

        userName = UILabel(frame: CGRect(x: 0, y: 60, width: width/3+100, height: 70))
        userName?.text = "Hola, Juan de Dios"
        userName?.numberOfLines = 1
        userName?.textAlignment = .center
        userName?.font = .boldSystemFont(ofSize: 20)
        view.addSubview(userName!)
        
        
//        UserNameLogged = UILabel(frame: CGRect(x: 20, y: 60, width: width, height: 70))
//        let userId = (Auth.auth().currentUser?.uid)!
//        ref?.child("users").child(userId).observeSingleEvent(of: .value, with: { [self] (snatshop) in
//            let value = snatshop.value as? NSDictionary
//            UserNameLogged?.text = value!["nombre"] as? String
//        })
//        UserNameLogged?.font = .boldSystemFont(ofSize: 20)
//        UserNameLogged?.textAlignment = .center
//
//        view.addSubview(UserNameLogged!)
        
        
        

        logo = UIImageView(frame: CGRect(x: 18, y: 150, width: width, height: 70))
        logo?.image = UIImage(named: "bookstore-logo-3")
        logo?.contentMode = .scaleAspectFit
        view.addSubview(logo!)
        
        phraseBook = UILabel(frame: CGRect(x: 20, y: ((height/12)*3) - 40, width: width - 40 , height: 200))
        phraseBook?.text = "No dejes para mañana lo que puedes leer hoy"
        phraseBook?.numberOfLines = 3
        phraseBook?.textAlignment = .center
        phraseBook?.font = .boldSystemFont(ofSize: 30)
        view.addSubview(phraseBook!)
        
        banner = UIImageView(frame: CGRect(x: 0, y: ((height/12)*9), width: width, height: 250))
        banner?.image = UIImage(named: "mujer")
        view.addSubview(banner!)
        
        searchContent = UIView(frame: CGRect(x: 10, y: height - ((height/10)*1), width: width - 20, height: 55))
        searchContent?.backgroundColor = .white
        searchContent?.layer.cornerRadius = 10
        view.addSubview(searchContent!)

        byBooksButton = UIButton(frame: CGRect(x: 10, y: height - ((height/10)*1), width: 100, height: 55))
        byBooksButton?.setTitle("Libros", for: .normal)
        byBooksButton?.setTitleColor(blue, for: .normal)
//        byBooksButton?.backgroundColor = .red
        byBooksButton?.addTarget(self, action: #selector(byNames), for: .touchUpInside)
        view.addSubview(byBooksButton!)

        byGenreButton = UIButton(frame: CGRect(x: (width/3) + 15, y: height - ((height/10)*1), width: 100 , height: 55))
        byGenreButton?.setTitle("Categorias", for: .normal)
        byGenreButton?.setTitleColor(blue, for: .normal)
//        byBooksButton?.backgroundColor = .blue
        byGenreButton?.addTarget(self, action: #selector(byCategories), for: .touchUpInside)
        view.addSubview(byGenreButton!)

        byAuthorButton = UIButton(frame: CGRect(x: (width/3) + 150, y: height - ((height/10)*1), width: 100, height: 55))
        byAuthorButton?.setTitle("Autores", for: .normal)
        byAuthorButton?.setTitleColor(blue, for: .normal)
//        byAuthorButton?.backgroundColor = .green
        byAuthorButton?.addTarget(self, action: #selector(byAuthors), for: .touchUpInside)
        view.addSubview(byAuthorButton!)

//        tableView = UITableView(frame: CGRect(x: 10, y: 300, width: width - 20, height: height - 100))
//        tableView?.backgroundColor = backgroundColor
//        tableView?.delegate = self
//        tableView?.dataSource = self
//
//        view.addSubview(tableView!)
        
        SearchTextField = UITextField(frame: CGRect(x:20, y: ((height/12)*5), width: width - 40, height: 60))
        SearchTextField!.placeholder = "Encuentra tu libro"
        SearchTextField!.backgroundColor = gray
        SearchTextField!.layer.cornerRadius = 7
        SearchTextField!.layer.borderColor = UIColor.darkGray.cgColor
        SearchTextField!.layer.borderWidth = 1
        SearchTextField!.font = UIFont(name: "Helvetica Bold", size: 14)
        SearchTextField!.textAlignment = .center
        SearchTextField!.keyboardType = .alphabet
        view.addSubview(SearchTextField!)
        
        SearchPressed = UIButton(frame: CGRect(x:20, y: ((height/12)*6)  , width: width - 40, height: 60))
        SearchPressed?.setTitle("Quiero Leer", for: .normal)
        SearchPressed?.setTitleColor(.white, for: .normal)
        SearchPressed?.backgroundColor = blue
        SearchPressed!.layer.cornerRadius = 7
        SearchPressed?.addTarget(self, action: #selector(pressed), for: .touchUpInside)
        view.addSubview(SearchPressed!)
        
        
        

    }

    func getData(){


    // MARK: - Libros
    // MARK: - SEXUALIDAD
    let kamasutra = Book(name: "Kamasutra", synopsis: "El Kama-sutra es un antiguo texto hinduista que trata sobre el comportamiento sexual humano", image: "kamasutra", author: "Vatsiaiana", about: "Vatsiaiana fue un religioso y escritor de la India, en la época del Imperio gupta.", genre: "Sexualidad", indexAuthor: "V", indexName: "K")

    let tresmujeres = Book(name: "Tres Mujeres", synopsis: "Named a Best Book of the Year: The Washington Post * NPR * The Atlantic * New York Public Library * Vanity Fair * PBS * Time * Economist * Entertainment Weekly * Financial Times * Shelf Awareness * Guardian * Sunday Times * BBC * Esquire * Good Housekeeping * Elle * Real Simple * And more than twenty additional outlets", image: "tresmujeres", author: "Lisa Taddeo", about: "VLisa Taddeo spent eight years and thousands of hours tracking the women whose stories comprise Three Women, moving to the towns they lived in to better understand their lives. She has contributed to New York Magazine, Esquire, Elle, Glamour and many other publications.", genre: "Sexualidad", indexAuthor: "L", indexName: "T")

    let talcomoeres = Book(name: "Tal como eres", synopsis: "En el siglo XX se creía que la sexualidad femenina era como la de los hombres pero «descafeinada», es decir, básicamente igual a la de ellos… pero no tan buena. Nadie entendía esos «asuntos de mujeres» tan complicados como son la respuesta genital, el deseo sexual o el orgasmo.", image: "talcomoeres", author: "Amelia Nagoski", about: "Dr. Amelia Nagoski is a conductor and music professor, in which jobs her responsibilities include running around waving her arms and making funny noises, and generally doing whatever it takes to help singers get in touch with their internal experience.", genre: "Sexualidad", indexAuthor: "A", indexName: "T")



    let sexualidad = Genre(name: "Sexualidad", books: [kamasutra,tresmujeres,talcomoeres])

    // MARK: - NOVELA
    let crimenycastigo = Book(name: "Crimen y Castigo", synopsis: "Proust decía que todas las novelas de Dostoievski pudieron titularse Crimen y castigo. Efectivamente, la obra entera del gran escritor ruso gira alrededor de dos ideas fundamentales: la transgresión de las leyes morales y sociales, basada en el supuesto de la libertad humana, y el sometimiento posterior e inevitable a dichas leyes", image: "crimen", author: "Fyodor Dostoievsky", about: "Fiódor Mijáilovich Dostoyevski, también transcrito como Fiódor Mijáilovich Dostoievski fue uno de los principales escritores de la Rusia zarista, cuya literatura explora la psicología humana en el complejo contexto político, social y espiritual de la sociedad rusa de la segunda mitad del siglo xix.", genre: "Novela", indexAuthor: "F", indexName: "C")

    let mobydick = Book(name: "Moby Dick", synopsis: "Moby Dick​ es una novela del escritor Herman Melville publicada en 1851. Narra la travesía del barco ballenero Pequod, comandado por el capitán Ahab, junto a Ismael y el arponero Queequeg en la obsesiva y autodestructiva persecución de un gran cachalote blanco.", image: "no-imagen", author: "Herman Melville", about: "Not Available", genre: "Novela", indexAuthor: "H", indexName: "M")

    let madamebovary = Book(name: "Madame Bovary", synopsis: "Madame Bovary es una novela escrita por Gustave Flaubert. Se publicó por entregas en La Revue de Paris desde el 1 de octubre de 1856 hasta el 15 de diciembre del mismo año; y en forma de libro, en 1857.", image: "no-imagen", author: "Gustave Flaubert", about: "Not Available", genre: "Novela", indexAuthor: "G", indexName: "M")

    let senoradalloway = Book(name: "La Señora Dalloway", synopsis: "La señora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Virginia Wolf", about: "Not Available", genre: "Novela", indexAuthor: "V", indexName: "L")

    let novela = Genre(name: "Novela", books: [crimenycastigo, mobydick, madamebovary, senoradalloway])

    // MARK: - Deportes
    let messi = Book(name: "D10S, la vida del messias", synopsis: "PLa señora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Messi", about: "Not Available", genre: "Novela", indexAuthor: "M", indexName: "D")

    let cr7 = Book(name: "Shiuuuu", synopsis: "PLa señora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Cristiano Ronaldo", about: "Not Available", genre: "Novela", indexAuthor: "C", indexName: "S")

    let pele = Book(name: "O´rei", synopsis: "La señora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Pele", about: "Not Available", genre: "Novela", indexAuthor: "P", indexName: "O")


    let autobiografico = Genre(name: "Autobiografias", books: [messi, cr7, pele])

    // MARK: - Menu
    let catalog = CatalogObject(genres: [sexualidad, novela, autobiografico], title: "Libros")
    dataSource = catalog

    }
    
    @objc func pressed() {
        SearchTextField.endEditing(true)
        print("BUSCAR: ", SearchTextField.text!)
        if let book = SearchTextField.text {
            booksManager.fetchBook(bookName: book)
        }
        SearchTextField.text = ""
    }
    

    
    @objc func byCategories(){
        print("Filtrar por categorias")
        
        let vc = ByCategoriesViewController()

        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func byAuthors(){
        print("Filtrar por categorias")
        
        let vc = ByAuthorViewController()

        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func byNames(){
        print("Filtrar por categorias")
        
        let vc = ByNameViewController()

        vc.modalPresentationStyle = .fullScreen
        present(vc, animated: true, completion: nil)
    }
    
    @objc func logOutUser(){
        let alerta = UIAlertController(title: "Cerrar sesión", message: "¿Seguro que desea cerrar sesión?", preferredStyle: .alert)
        let aceptar = UIAlertAction(title: "Aceptar", style: .default) { _ in
            try! Auth.auth().signOut()
            self.dismiss(animated: true, completion: nil)
        }

        let cancelar = UIAlertAction(title: "Cancelar", style: .default, handler: nil)
        alerta.addAction(aceptar)
        alerta.addAction(cancelar)
        present(alerta, animated: true, completion: nil)
    }
    
    
}






