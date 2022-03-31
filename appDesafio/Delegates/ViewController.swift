//
//  ViewController.swift
//  appDesafio
//
//  Created by MacBook on 23/01/22.
//

import UIKit
import FirebaseAuth

class ViewController: UIViewController, UITextFieldDelegate  {
    
    
    //var loginButton : CallToActionOptionView?
    var loginButton : UIButton?
    var registerButton : RegisterButtonOptionView?
    var message : MessageOptionView?
    var labelMessage : LabelMessageOptionView?
    var logo : UIImageView?
    var banner : UIImageView?
    
    var emailTextField : UITextField?
    var passwordTextField : UITextField?
    
    var EmailInputTextField : TextFieldOptionView?
    
    
    //var backgroundColor = UIColor(displayP3Red: 0.99, green: 0.99, blue: 0.95, alpha: 1)
    var backgroundColor = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    var blue = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
    var gray = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = backgroundColor
        initUI()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        emailTextField?.text = ""
        passwordTextField?.text = ""
        
        super.viewDidAppear(animated)
        
        sesionActiva()
        
    }
    
    func initUI(){
        
        logo = UIImageView(frame: CGRect(x: (width/3), y: 130, width: width/3, height: 70))
        logo?.image = UIImage(named: "bookstore-logo-1")
        logo?.contentMode = .scaleAspectFill
        view.addSubview(logo!)
        
        message = MessageOptionView(titleString: "¡Bienvenido!", frame: CGRect(x: 10, y: 230, width: width - 40, height: 50))
        view.addSubview(message!)
        
        
        
        emailTextField = UITextField(frame: CGRect(x:20, y: 310, width: width - 40, height: 60))
        emailTextField?.placeholder = "Ingresa tu email"
        emailTextField?.backgroundColor = gray
        emailTextField?.layer.cornerRadius = 7
        emailTextField?.layer.borderColor = UIColor.darkGray.cgColor
        emailTextField?.layer.borderWidth = 1
        emailTextField?.font = UIFont(name: "Helvetica Bold", size: 14)
        emailTextField?.textAlignment = .center
        emailTextField?.keyboardType = .emailAddress
        emailTextField?.autocapitalizationType = .none
        view.addSubview(emailTextField!)
                
        passwordTextField = UITextField(frame: CGRect(x:20, y: 400, width: width - 40, height: 60))
        passwordTextField?.placeholder = "Ingresa tu Password"
        passwordTextField?.isSecureTextEntry = true
        passwordTextField?.backgroundColor = gray
        passwordTextField?.layer.cornerRadius = 10
        passwordTextField?.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextField?.layer.borderWidth = 1
        passwordTextField?.font = UIFont(name: "Helvetica Bold", size: 14)
        passwordTextField?.textAlignment = .center
        passwordTextField?.keyboardType = .default
        view.addSubview(passwordTextField!)

        
        loginButton = UIButton(frame: CGRect(x: 20, y: 500, width: width - 40, height: 50))
        loginButton?.backgroundColor = blue
        loginButton?.layer.cornerRadius = 20
        loginButton?.setTitle("INICIAR SESIÓN", for: .normal)
        loginButton?.addTarget(self, action: #selector(logInAction), for: .touchUpInside)
        view.addSubview(loginButton!)
        
        registerButton = RegisterButtonOptionView(titleString: "¿Todavia no tienes cuenta? Regístrate", frame: CGRect(x: 20, y: 565, width: width - 40, height: 50))
        
        let createAccount = UITapGestureRecognizer(target: self, action: #selector(createAccount))
        registerButton?.addGestureRecognizer(createAccount)
        
        view.addSubview(registerButton!)
        
        banner = UIImageView(frame: CGRect(x: 0, y: ((height/12)*9), width: width, height: 250))
        banner?.image = UIImage(named: "mujer")
        view.addSubview(banner!)
      
    }
    
    @objc func logInAction(){
        print("INICIAR SESION")
        
        //let vc = UserAccountViewController()

        //vc.modalPresentationStyle = .fullScreen
        //present(vc, animated: true, completion: nil)
        if let mail = emailTextField?.text {
            if let contrasena = passwordTextField?.text{
                iniciarSesion(correo: mail, pass: contrasena)
            }
        }
    }
    
    func iniciarSesion(correo: String, pass: String){
        Auth.auth().signIn(withEmail: correo, password: pass) { [self] user, error in
            if user != nil{
                print("Logueo")
                let logged = UserAccountViewController()
                logged.modalPresentationStyle = .fullScreen
                present(logged, animated: true, completion: nil)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en Firebase:", error)
                    let alert = UIAlertController(title: "Error :(", message: error, preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Error :(", message: "Error en el código fuente", preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    
    @objc func createAccount(){
        print("CREAR CUENTA")
        
        let CreateAccountViewController = CreateAccountViewController()
        present(CreateAccountViewController, animated: true, completion: {
            print("Vamos a Crear una nueva cuenta")
        })
    }
    
    @IBAction func logInAccount(_ sender: Any){
        if ( emailTextField?.text?.isEmpty)! || (passwordTextField?.text?.isEmpty)! {
                  print("Llena todos los campos requeridos")
            
               } else {
                   let vc = UserAccountViewController()

                   vc.modalPresentationStyle = .fullScreen
                   present(vc, animated: true, completion: nil)
               }
    }
    
    func sesionActiva(){
        Auth.auth().addStateDidChangeListener { [self] user, error in
            if error == nil{
                print("No estamos logueados")
                
            }else{
                print("Estamos logueados")
                let logged = UserAccountViewController()
                logged.modalPresentationStyle = .fullScreen
                present(logged, animated: true, completion: nil)
            }
        }
    }

}

