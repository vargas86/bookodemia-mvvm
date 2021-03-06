////
////  UserAccountViewControllerOLD-06022022.swift
////  appDesafio
////
////  Created by MacBook on 06/02/22.
////
//
//import UIKit
//
//class UserAccountViewController : UIViewController, UITextFieldDelegate  {
//
//    var tableView : UITableView?
//    var dataSource : CatalogObject?
//    var userName : UILabel?
//    var logo : UIImageView?
//    var searchContent : UIView?
//    var byBooksButton : UIButton?
//    var byGenreButton : UIButton?
//    var byAuthorButton : UIButton?
//
//    var SearchTextField: UITextField!
//
//    var SearchPressed : UIButton?
//
//    var backgroundColor = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
//    var blue = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
//    var black = UIColor(displayP3Red: 0.66, green: 0.66, blue: 0.66, alpha: 1)
//    var gray = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
//    var skyBlue = UIColor(displayP3Red: 0.11, green: 0.167, blue: 0.188, alpha: 1)
//    var width = UIScreen.main.bounds.width
//    var height = UIScreen.main.bounds.height
//
//    var booksManager =  BooksManager()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        //SearchTextField.delegate = self
//
//        view.backgroundColor = backgroundColor
//
//        getData()
//        initUI()
//    }
//
//    func initUI(){
//
//        userName = UILabel(frame: CGRect(x: 20, y: 60, width: width, height: 70))
//        userName?.text = "Hola, Juan de Dios"
//        userName?.numberOfLines = 1
//        userName?.textAlignment = .center
//        userName?.font = .boldSystemFont(ofSize: 20)
//        view.addSubview(userName!)
//
//        logo = UIImageView(frame: CGRect(x: 20, y: 130, width: width, height: 70))
//        logo?.image = UIImage(named: "book")
//        logo?.contentMode = .scaleAspectFit
//        view.addSubview(logo!)
//
//        searchContent = UIView(frame: CGRect(x: 10, y: 230, width: width - 20, height: 55))
//        searchContent?.backgroundColor = .white
//        searchContent?.layer.cornerRadius = 10
//        view.addSubview(searchContent!)
//
////        byBooksButton = UIButton(frame: CGRect(x: 10, y: 230, width: 100, height: 55))
////        byBooksButton?.setTitle("Libros", for: .normal)
////        byBooksButton?.setTitleColor(blue, for: .normal)
////        byBooksButton?.backgroundColor = .red
////        byBooksButton?.addTarget(self, action: #selector(byNames), for: .touchUpInside)
////        view.addSubview(byBooksButton!)
//
//        byGenreButton = UIButton(frame: CGRect(x: (width/3) + 15, y: 230, width: 100 , height: 55))
//        byGenreButton?.setTitle("Categorias", for: .normal)
//        byGenreButton?.setTitleColor(blue, for: .normal)
//        byBooksButton?.backgroundColor = .blue
//        byGenreButton?.addTarget(self, action: #selector(byCategories), for: .touchUpInside)
//        view.addSubview(byGenreButton!)
//
//        byAuthorButton = UIButton(frame: CGRect(x: (width/3) + 150, y: 230, width: 100, height: 55))
//        byAuthorButton?.setTitle("Autores", for: .normal)
//        byAuthorButton?.setTitleColor(blue, for: .normal)
//        byAuthorButton?.backgroundColor = .green
//        byAuthorButton?.addTarget(self, action: #selector(byAuthors), for: .touchUpInside)
//        view.addSubview(byAuthorButton!)
//
////        tableView = UITableView(frame: CGRect(x: 10, y: 300, width: width - 20, height: height - 100))
////        tableView?.backgroundColor = backgroundColor
////        tableView?.delegate = self
////        tableView?.dataSource = self
////
////        view.addSubview(tableView!)
//
//        SearchTextField = UITextField(frame: CGRect(x:20, y: 310, width: width - 40, height: 60))
//        SearchTextField!.placeholder = "Encuentra tu libro"
//        SearchTextField!.backgroundColor = gray
//        SearchTextField!.layer.cornerRadius = 7
//        SearchTextField!.layer.borderColor = UIColor.darkGray.cgColor
//        SearchTextField!.layer.borderWidth = 1
//        SearchTextField!.font = UIFont(name: "Helvetica Bold", size: 14)
//        SearchTextField!.textAlignment = .center
//        SearchTextField!.keyboardType = .alphabet
//        view.addSubview(SearchTextField!)
//
//        SearchPressed = UIButton(frame: CGRect(x:20, y: 390, width: width - 40, height: 60))
//        SearchPressed?.setTitle("Buscar", for: .normal)
//        SearchPressed?.setTitleColor(blue, for: .normal)
//        SearchPressed?.backgroundColor = .lightGray
//        SearchPressed?.addTarget(self, action: #selector(pressed), for: .touchUpInside)
//        view.addSubview(SearchPressed!)
//
//
//
//    }
//
//    func getData(){
//
//
//    // MARK: - Libros
//    // MARK: - SEXUALIDAD
//    let kamasutra = Book(name: "Kamasutra", synopsis: "El Kama-sutra es un antiguo texto hinduista que trata sobre el comportamiento sexual humano", image: "kamasutra", author: "Vatsiaiana", about: "Vatsiaiana fue un religioso y escritor de la India, en la ??poca del Imperio gupta.", genre: "Sexualidad", indexAuthor: "V", indexName: "K")
//
//    let tresmujeres = Book(name: "Tres Mujeres", synopsis: "Named a Best Book of the Year: The Washington Post * NPR * The Atlantic * New York Public Library * Vanity Fair * PBS * Time * Economist * Entertainment Weekly * Financial Times * Shelf Awareness * Guardian * Sunday Times * BBC * Esquire * Good Housekeeping * Elle * Real Simple * And more than twenty additional outlets", image: "tresmujeres", author: "Lisa Taddeo", about: "VLisa Taddeo spent eight years and thousands of hours tracking the women whose stories comprise Three Women, moving to the towns they lived in to better understand their lives. She has contributed to New York Magazine, Esquire, Elle, Glamour and many other publications.", genre: "Sexualidad", indexAuthor: "L", indexName: "T")
//
//    let talcomoeres = Book(name: "Tal como eres", synopsis: "En el siglo XX se cre??a que la sexualidad femenina era como la de los hombres pero ??descafeinada??, es decir, b??sicamente igual a la de ellos??? pero no tan buena. Nadie entend??a esos ??asuntos de mujeres?? tan complicados como son la respuesta genital, el deseo sexual o el orgasmo.", image: "talcomoeres", author: "Amelia Nagoski", about: "Dr. Amelia Nagoski is a conductor and music professor, in which jobs her responsibilities include running around waving her arms and making funny noises, and generally doing whatever it takes to help singers get in touch with their internal experience.", genre: "Sexualidad", indexAuthor: "A", indexName: "T")
//
//
//
//    let sexualidad = Genre(name: "Sexualidad", books: [kamasutra,tresmujeres,talcomoeres])
//
//    // MARK: - NOVELA
//    let crimenycastigo = Book(name: "Crimen y Castigo", synopsis: "Proust dec??a que todas las novelas de Dostoievski pudieron titularse Crimen y castigo. Efectivamente, la obra entera del gran escritor ruso gira alrededor de dos ideas fundamentales: la transgresi??n de las leyes morales y sociales, basada en el supuesto de la libertad humana, y el sometimiento posterior e inevitable a dichas leyes", image: "crimen", author: "Fyodor Dostoievsky", about: "Fi??dor Mij??ilovich Dostoyevski, tambi??n transcrito como Fi??dor Mij??ilovich Dostoievski fue uno de los principales escritores de la Rusia zarista, cuya literatura explora la psicolog??a humana en el complejo contexto pol??tico, social y espiritual de la sociedad rusa de la segunda mitad del siglo xix.", genre: "Novela", indexAuthor: "F", indexName: "C")
//
//    let mobydick = Book(name: "Moby Dick", synopsis: "Moby Dick??? es una novela del escritor Herman Melville publicada en 1851. Narra la traves??a del barco ballenero Pequod, comandado por el capit??n Ahab, junto a Ismael y el arponero Queequeg en la obsesiva y autodestructiva persecuci??n de un gran cachalote blanco.", image: "no-imagen", author: "Herman Melville", about: "Not Available", genre: "Novela", indexAuthor: "H", indexName: "M")
//
//    let madamebovary = Book(name: "Madame Bovary", synopsis: "Madame Bovary es una novela escrita por Gustave Flaubert. Se public?? por entregas en La Revue de Paris desde el 1 de octubre de 1856 hasta el 15 de diciembre del mismo a??o; y en forma de libro, en 1857.", image: "no-imagen", author: "Gustave Flaubert", about: "Not Available", genre: "Novela", indexAuthor: "G", indexName: "M")
//
//    let senoradalloway = Book(name: "La Se??ora Dalloway", synopsis: "La se??ora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un d??a en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Virginia Wolf", about: "Not Available", genre: "Novela", indexAuthor: "V", indexName: "L")
//
//    let novela = Genre(name: "Novela", books: [crimenycastigo, mobydick, madamebovary, senoradalloway])
//
//    // MARK: - Deportes
//    let messi = Book(name: "D10S, la vida del messias", synopsis: "PLa se??ora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un d??a en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Messi", about: "Not Available", genre: "Novela", indexAuthor: "M", indexName: "D")
//
//    let cr7 = Book(name: "Shiuuuu", synopsis: "PLa se??ora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un d??a en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Cristiano Ronaldo", about: "Not Available", genre: "Novela", indexAuthor: "C", indexName: "S")
//
//    let pele = Book(name: "O??rei", synopsis: "La se??ora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un d??a en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Pele", about: "Not Available", genre: "Novela", indexAuthor: "P", indexName: "O")
//
//
//    let autobiografico = Genre(name: "Autobiografias", books: [messi, cr7, pele])
//
//    // MARK: - Menu
//    let catalog = CatalogObject(genres: [sexualidad, novela, autobiografico], title: "Libros")
//    dataSource = catalog
//
//    }
//
//    @objc func pressed() {
//        SearchTextField.endEditing(true)
//        print("BUSCAR: ", SearchTextField.text!)
//        if let book = SearchTextField.text {
//            booksManager.fetchBook(bookName: book)
//        }
//        SearchTextField.text = ""
//    }
//
//
//
//    @objc func byCategories(){
//        print("Filtrar por categorias")
//
//        let vc = ByCategoriesViewController()
//
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//    }
//
//    @objc func byAuthors(){
//        print("Filtrar por categorias")
//
//        let vc = ByAuthorViewController()
//
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//    }
//
//    @objc func byNames(){
//        print("Filtrar por categorias")
//
//        let vc = ByNameViewController()
//
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//    }
//}
//
//
//
//
//
//
