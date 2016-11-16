//
//  AddViewController.swift
//  Planetas
//
//  Created by Aplimovil on 11/4/16.
//  Copyright © 2016 Aplimovil. All rights reserved.
//

import UIKit

class AddViewController: UIViewController {

    @IBOutlet var nombre: UITextField!
    @IBOutlet var gravedad: UITextField!
    
    var planeta:Planeta?
    var dao:PlanetaDAO!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dao = PlanetaDAO()
        
        if planeta != nil {
            self.title = "Editar"
        }else{
            planeta = Planeta()
        }
        
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    @IBAction func add(_ sender: AnyObject) {
        planeta?.nombre = nombre.text
        planeta?.gravedad = Double(gravedad.text!)
        dao.insert(p: planeta!)
        performSegue(withIdentifier: "backToList", sender: nil)
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
