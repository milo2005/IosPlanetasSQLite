//
//  ViewController.swift
//  Planetas
//
//  Created by Aplimovil on 11/1/16.
//  Copyright © 2016 Aplimovil. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    var dao:PlanetaDAO!
    var data:[Planeta]!

    override func viewDidLoad() {
        super.viewDidLoad()
        dao = PlanetaDAO()
        data = []
        
    }

    override func viewDidAppear(_ animated: Bool) {
        data = dao.all()
        table.reloadData()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func backToViewController(_ sender:UIStoryboardSegue){
    }
    
    //MARK: - DataSource
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:PlanetaTableViewCell = tableView.dequeueReusableCell(withIdentifier: "celda") as! PlanetaTableViewCell
        
        cell.nombre.text = data[indexPath.row].nombre
        cell.gravedad.text = "\(data[indexPath.row].gravedad!)"
        
        return cell
    }
    
}

