//
//  CreateAccountViewController.swift
//  appDesafio
//
//  Created by MacBook on 23/01/22.
//

import UIKit
import FirebaseAuth
import FirebaseDatabase

class CreateAccountViewController : UIViewController {
    
    
    var ownContent : UIView?
    var instructions : UILabel?
    var registerTitle : UILabel?
    var UsuarioTextField : UITextField?
    var emailTextField : UITextField?
    var passwordTextField : UITextField?
    var confirmPasswordTextField : UITextField?
    var createButton : UIButton?
    var logo : UIImageView?
    //var botonCierre: UIButton?
    
    var message : MessageOptionView?
    var labelMessage : LabelMessageOptionView?
    
    var backgroundColor = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    var blue = UIColor(displayP3Red: 0.1, green: 0.1, blue: 0.4, alpha: 1)
    var gray = UIColor(displayP3Red: 0.92, green: 0.92, blue: 0.92, alpha: 1)
    var width = UIScreen.main.bounds.width
    var height = UIScreen.main.bounds.height
    
    var alert = ""
    var ref: DatabaseReference?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = Database.database().reference() //Conexión a la base de datos
        view.backgroundColor = backgroundColor
        initUI()
    }
    
    func initUI(){
        
        logo = UIImageView(frame: CGRect(x: 20, y: 60, width: width, height: 70))
        logo?.image = UIImage(named: "book")
        logo?.contentMode = .scaleAspectFit
        view.addSubview(logo!)
        
        
        
        ownContent = UIView(frame: CGRect(x: 20, y: 230, width: width - 40, height: height/2 - 50))
        ownContent?.backgroundColor = .white
        ownContent?.layer.cornerRadius = 20
        ownContent?.layer.shadowColor = UIColor.black.cgColor
        ownContent?.layer.shadowOpacity = 0.35
        ownContent?.layer.shadowOffset = .zero
        view.addSubview(ownContent!)
        
        instructions = UILabel(frame: CGRect(x: 20, y: 145, width: width - 40, height: 50))
        instructions?.text = "Estas a unos pasos de vivir la mejor experiencia"
        instructions?.textAlignment = .center
        instructions?.font = UIFont(name: "Helvetica Bold", size: 16)
        instructions?.textColor = blue
        view.addSubview(instructions!)
    
        registerTitle = UILabel(frame: CGRect(x: 20, y: 245, width: width - 40, height: 50))
        registerTitle?.text = "Registra tu información"
        registerTitle?.textAlignment = .center
        registerTitle?.font = UIFont(name: "Helvetica Bold", size: 20)
        registerTitle?.textColor = blue
        view.addSubview(registerTitle!)
        
        UsuarioTextField = UITextField(frame: CGRect(x:40, y: 310, width: width - 80, height: 60))
        UsuarioTextField?.placeholder = "Ingresa tu usuario"
        UsuarioTextField?.backgroundColor = .white
        UsuarioTextField?.layer.cornerRadius = 7
        UsuarioTextField?.layer.borderColor = UIColor.darkGray.cgColor
        UsuarioTextField?.layer.borderWidth = 1
        UsuarioTextField?.font = UIFont(name: "Helvetica Bold", size: 14)
        UsuarioTextField?.textAlignment = .center
        UsuarioTextField?.keyboardType = .default
        view.addSubview(UsuarioTextField!)
        
        labelMessage = LabelMessageOptionView(titleString: "Usuario", colorString: .white, frame: CGRect(x: 40, y: 295, width: width - 40, height: 30))
        view.addSubview(labelMessage!)
        
        emailTextField = UITextField(frame: CGRect(x:40, y: 390, width: width - 80, height: 60))
        emailTextField?.placeholder = "Registra un correo"
        emailTextField?.backgroundColor = .white
        emailTextField?.layer.cornerRadius = 7
        emailTextField?.layer.borderColor = UIColor.darkGray.cgColor
        emailTextField?.layer.borderWidth = 1
        emailTextField?.font = UIFont(name: "Helvetica Bold", size: 14)
        emailTextField?.textAlignment = .center
        emailTextField?.keyboardType = .emailAddress
        view.addSubview(emailTextField!)
        
        labelMessage = LabelMessageOptionView(titleString: "Correo", colorString: .white, frame: CGRect(x: 40, y: 375, width: width - 40, height: 30))
        view.addSubview(labelMessage!)
        
        passwordTextField = UITextField(frame: CGRect(x:40, y: 470, width: width - 80, height: 60))
        passwordTextField?.placeholder = "Crear una contraseña"
        passwordTextField?.isSecureTextEntry = true
        passwordTextField?.backgroundColor = .white
        passwordTextField?.layer.cornerRadius = 7
        passwordTextField?.layer.borderColor = UIColor.darkGray.cgColor
        passwordTextField?.layer.borderWidth = 1
        passwordTextField?.font = UIFont(name: "Helvetica Bold", size: 14)
        passwordTextField?.textAlignment = .center
        passwordTextField?.keyboardType = .default
        view.addSubview(passwordTextField!)
        
        labelMessage = LabelMessageOptionView(titleString: "Contraseña", colorString: .white, frame: CGRect(x: 40, y: 455, width: width - 40, height: 30))
        view.addSubview(labelMessage!)
        
        confirmPasswordTextField = UITextField(frame: CGRect(x:40, y: 550, width: width - 80, height: 60))
        confirmPasswordTextField?.placeholder = "Vuelve a escribir tu contraseña"
        confirmPasswordTextField?.isSecureTextEntry = true
        confirmPasswordTextField?.backgroundColor = .white
        confirmPasswordTextField?.layer.cornerRadius = 7
        confirmPasswordTextField?.layer.borderColor = UIColor.darkGray.cgColor
        confirmPasswordTextField?.layer.borderWidth = 1
        confirmPasswordTextField?.font = UIFont(name: "Helvetica Bold", size: 14)
        confirmPasswordTextField?.textAlignment = .center
        confirmPasswordTextField?.keyboardType = .default
        view.addSubview(confirmPasswordTextField!)
        
        labelMessage = LabelMessageOptionView(titleString: "Confirmar Contraseña", colorString: .white, frame: CGRect(x: 40, y: 535, width: width, height: 30))
        view.addSubview(labelMessage!)
        
        createButton = UIButton(frame: CGRect(x: 20, y: (height/8) * 7 - 90, width: width - 40, height: 50))
        createButton?.backgroundColor = blue
        createButton?.layer.cornerRadius = 20
        createButton?.setTitle("CREAR CUENTA", for: .normal)
        createButton?.addTarget(self, action: #selector(createNewAccount), for: .touchUpInside)
        view.addSubview(createButton!)
    }
    
//    @objc func logInAction(){
//        print("INICIAR SESION")
//
//        let vc = UserAccountViewController()
//
//        vc.modalPresentationStyle = .fullScreen
//        present(vc, animated: true, completion: nil)
//    }
    
    @IBAction func createNewAccount(_ sender: Any){
        if ( UsuarioTextField?.text?.isEmpty)! || (emailTextField?.text?.isEmpty)! || (passwordTextField?.text?.isEmpty)! || (confirmPasswordTextField?.text?.isEmpty)!  {
                          alert = "Llena todos los campos requeridos"
                            print("Llena todos los campos requeridos")
        } else {
        if let usuario = UsuarioTextField?.text,
           let correo = emailTextField?.text,
           let pass = passwordTextField?.text  {
            
            registroTerminado(nombre: usuario, correo: correo, pass: pass)
            let vc = ViewController()

            //vc.modalPresentationStyle = .fullScreen
            //present(vc, animated: true, completion: nil)
                  
               } else {
                   print("Llena todos los campos requeridos")
                   
               }
        }
    }
    
    @objc func cierreSesion(){
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
    
    func registroTerminado(nombre: String, correo: String, pass: String){
        Auth.auth().createUser(withEmail: correo, password: pass) { [self] user, error in
            if user != nil{
                print("Usuario creado")
                let campos = ["nombre": UsuarioTextField?.text, "email": self.emailTextField?.text, "id": Auth.auth().currentUser?.uid]
                ref?.child("users").child(Auth.auth().currentUser!.uid).setValue(campos)
                
                self.dismiss(animated: true, completion: nil)
            }else{
                if let error = error?.localizedDescription{
                    print("Error en Firebase:", error)
                    let alert = UIAlertController(title: "Error :(", message: error, preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    self.present(alert, animated: true, completion: nil)
                }else{
                    let alert = UIAlertController(title: "Error :(", message: "Error en el código fuente", preferredStyle: .alert)
                    let aceptar = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
                    alert.addAction(aceptar)
                    self.present(alert, animated: true, completion: nil)
                }
            }
        }
        
    }
    

    
}

