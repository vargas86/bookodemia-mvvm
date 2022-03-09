////
////  UserAccountViewController.swift
////  appDesafio
////
////  Created by MacBook on 23/01/22.
////
//
//import UIKit
//
//class UserAccountViewController : UIViewController {
//    
//    var tableView : UITableView?
//    var dataSourceFilteredByTitle : CatalogObjectByTitle?
//    var dataSource : CatalogObject?
//    var userName : UILabel?
//    var logo : UIImageView?
//    var searchContent : UIView?
//    var byBooksButton : UIButton?
//    var byGenreButton : UIButton?
//    var byAuthorButton : UIButton?
//    
//    var backgroundColor = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
//    var blue = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
//    var black = UIColor(displayP3Red: 0.66, green: 0.66, blue: 0.66, alpha: 1)
//    var gray = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
//    var skyBlue = UIColor(displayP3Red: 0.11, green: 0.167, blue: 0.188, alpha: 1)
//    var width = UIScreen.main.bounds.width
//    var height = UIScreen.main.bounds.height
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
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
//        byBooksButton = UIButton(frame: CGRect(x: 10, y: 230, width: width/3, height: 55))
//        byBooksButton?.setTitle("Libros", for: .normal)
//        byBooksButton?.setTitleColor(blue, for: .normal)
//        view.addSubview(byBooksButton!)
//        
//        byGenreButton = UIButton(frame: CGRect(x: 10, y: 230, width: width/3 * 2 + 100, height: 55))
//        byGenreButton?.setTitle("Categorias", for: .normal)
//        byGenreButton?.setTitleColor(blue, for: .normal)
//        view.addSubview(byGenreButton!)
//        
//        byAuthorButton = UIButton(frame: CGRect(x: 10, y: 230, width: width/3 * 3 + 200, height: 55))
//        byAuthorButton?.setTitle("Autores", for: .normal)
//        byAuthorButton?.setTitleColor(blue, for: .normal)
//        view.addSubview(byAuthorButton!)
//        
//        tableView = UITableView(frame: CGRect(x: 10, y: 300, width: width - 20, height: height - 100))
//        tableView?.backgroundColor = backgroundColor
//        tableView?.delegate = self
//        tableView?.dataSource = self
//        
//        view.addSubview(tableView!)
//        
//    }
//    
//    func getData(){
//
//    
//    // MARK: - Libros
//    // MARK: - SEXUALIDAD
//    let kamasutra = Book(name: "Kamasutra", synopsis: "El Kama-sutra es un antiguo texto hinduista que trata sobre el comportamiento sexual humano", image: "kamasutra", author: "Vatsiaiana", about: "Vatsiaiana fue un religioso y escritor de la India, en la época del Imperio gupta.", genre: "Sexualidad", indexAuthor: "V", indexName: "K")
//    
//    let tresmujeres = Book(name: "Tres Mujeres", synopsis: "Named a Best Book of the Year: The Washington Post * NPR * The Atlantic * New York Public Library * Vanity Fair * PBS * Time * Economist * Entertainment Weekly * Financial Times * Shelf Awareness * Guardian * Sunday Times * BBC * Esquire * Good Housekeeping * Elle * Real Simple * And more than twenty additional outlets", image: "tresmujeres", author: "Lisa Taddeo", about: "VLisa Taddeo spent eight years and thousands of hours tracking the women whose stories comprise Three Women, moving to the towns they lived in to better understand their lives. She has contributed to New York Magazine, Esquire, Elle, Glamour and many other publications.", genre: "Sexualidad", indexAuthor: "L", indexName: "T")
//    
//    let talcomoeres = Book(name: "Tal como eres", synopsis: "En el siglo XX se creía que la sexualidad femenina era como la de los hombres pero «descafeinada», es decir, básicamente igual a la de ellos… pero no tan buena. Nadie entendía esos «asuntos de mujeres» tan complicados como son la respuesta genital, el deseo sexual o el orgasmo.", image: "talcomoeres", author: "Amelia Nagoski", about: "Dr. Amelia Nagoski is a conductor and music professor, in which jobs her responsibilities include running around waving her arms and making funny noises, and generally doing whatever it takes to help singers get in touch with their internal experience.", genre: "Sexualidad", indexAuthor: "A", indexName: "T")
//        
//    
//        
//    let sexualidad = Genre(name: "Sexualidad", books: [kamasutra,tresmujeres,talcomoeres])
//    
//    // MARK: - NOVELA
//    let crimenycastigo = Book(name: "Crimen y Castigo", synopsis: "Proust decía que todas las novelas de Dostoievski pudieron titularse Crimen y castigo. Efectivamente, la obra entera del gran escritor ruso gira alrededor de dos ideas fundamentales: la transgresión de las leyes morales y sociales, basada en el supuesto de la libertad humana, y el sometimiento posterior e inevitable a dichas leyes", image: "crimen", author: "Fyodor Dostoievsky", about: "Fiódor Mijáilovich Dostoyevski, también transcrito como Fiódor Mijáilovich Dostoievski fue uno de los principales escritores de la Rusia zarista, cuya literatura explora la psicología humana en el complejo contexto político, social y espiritual de la sociedad rusa de la segunda mitad del siglo xix.", genre: "Novela", indexAuthor: "F", indexName: "C")
//
//    let mobydick = Book(name: "Moby Dick", synopsis: "Moby Dick​ es una novela del escritor Herman Melville publicada en 1851. Narra la travesía del barco ballenero Pequod, comandado por el capitán Ahab, junto a Ismael y el arponero Queequeg en la obsesiva y autodestructiva persecución de un gran cachalote blanco.", image: "no-imagen", author: "Herman Melville", about: "Not Available", genre: "Novela", indexAuthor: "H", indexName: "M")
//        
//    let madamebovary = Book(name: "Madame Bovary", synopsis: "Madame Bovary es una novela escrita por Gustave Flaubert. Se publicó por entregas en La Revue de Paris desde el 1 de octubre de 1856 hasta el 15 de diciembre del mismo año; y en forma de libro, en 1857.", image: "no-imagen", author: "Gustave Flaubert", about: "Not Available", genre: "Novela", indexAuthor: "G", indexName: "M")
//        
//    let senoradalloway = Book(name: "La Señora Dalloway", synopsis: "La señora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Virginia Wolf", about: "Not Available", genre: "Novela", indexAuthor: "V", indexName: "L")
//     
//    let novela = Genre(name: "Novela", books: [crimenycastigo, mobydick, madamebovary, senoradalloway])
//    
//    // MARK: - Deportes
//    let messi = Book(name: "D10S, la vida del messias", synopsis: "PLa señora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Messi", about: "Not Available", genre: "Novela", indexAuthor: "M", indexName: "D")
//        
//    let cr7 = Book(name: "Shiuuuu", synopsis: "PLa señora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Cristiano Ronaldo", about: "Not Available", genre: "Novela", indexAuthor: "C", indexName: "S")
//        
//    let pele = Book(name: "O´rei", synopsis: "La señora Dalloway es la cuarta novela de Virginia Woolf, publicada el 14 de mayo de 1925. Detalla un día en la vida de Clarissa Dalloway, en la Inglaterra posterior a la Primera Guerra Mundial", image: "no-imagen", author: "Pele", about: "Not Available", genre: "Novela", indexAuthor: "P", indexName: "O")
//        
//    
//    let autobiografico = Genre(name: "Autobiografias", books: [messi, cr7, pele])
//        
//    // MARK: - Menu
//    let catalog = CatalogObject(genres: [sexualidad, novela, autobiografico], title: "Libros")
//    dataSource = catalog
//        
//    // MARK: - FILTRAR POR TITULO
//    let K = IndexName(indexName: "T", books: [tresmujeres,talcomoeres])
//    let T = IndexName(indexName: "K", books: [kamasutra])
//    let C = IndexName(indexName: "C", books: [crimenycastigo])
//    let M = IndexName(indexName: "M", books: [mobydick,madamebovary])
//    let L = IndexName(indexName: "L", books: [senoradalloway])
//    let D = IndexName(indexName: "D", books: [messi])
//    let S = IndexName(indexName: "S", books: [cr7])
//    let O = IndexName(indexName: "O", books: [pele])
//            
//    let catalogObjectByTitle = CatalogObjectByTitle(indexNames: [C,D,K,L,M,O,S,T], title: "Orden Alfabético")
//    dataSourceFilteredByTitle = catalogObjectByTitle
//        
//    }
//}
//
//// MARK: - UITableViewDataSource
//extension UserAccountViewController : UITableViewDataSource{
//    ///El numero de celdas por cada seccion
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return dataSource?.genres?[section].books?.count ?? 0
//    }
//    
//    ///El tipo de celda que se mostrara
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let book = dataSource?.genres?[indexPath.section].books?[indexPath.row]
//        let cell = CatalogTableViewCell(book: book!)
//        return cell
//    }
//    
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return height / 6
//    }
//}
//
//// MARK: - UITableViewDelegate
//extension UserAccountViewController : UITableViewDelegate{
//    
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        let view = UIView() // Aqui definimos el UIView el cual se va a retornar en la funcion
//        view.backgroundColor = backgroundColor// Le asignamos el color random al background de la vista
//        
//        
//       
//        let label = UILabel(frame: CGRect(x: 10, y: 0, width: width, height: 20))
//        label.text = dataSource?.genres?[section].name ?? ""
//        label.textColor = .black
//        label.font = .boldSystemFont(ofSize: 20)
//        view.addSubview(label)
//        
//        return view
//   }
//
//    ///Cacha el Clik en cada celda para alguna accion
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        print("Estoy en la seccion \(indexPath.section) en la celda \(indexPath.row)")
//        
//        //let product = dataSoruce?.categorias?[indexPath.section].productos?[indexPath.row]
//        
//        let vc = DetailProductViewController()
//
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//    }
//    
//    ///Numero de secciones que vamos a usar
//    func numberOfSections(in tableView: UITableView) -> Int {
//        return dataSource?.genres?.count ?? 0
//    }
//    
//}
