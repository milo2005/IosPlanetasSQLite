//
//  PlanetaDAO.swift
//  Planetas
//
//  Created by Aplimovil on 11/1/16.
//  Copyright © 2016 Aplimovil. All rights reserved.
//

import Foundation
import SQLite

class PlanetaDAO{
    
    let path = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
    
    var db:Connection!
    
    var planeta:Table = Table("planeta")
    var id:Expression<Int64> = Expression<Int64>("id")
    var nombre:Expression<String> =  Expression<String>("nombre")
    var gravedad:Expression<Double> =  Expression<Double>("gravedad")
    
    
    init(){
        do{
            try db = Connection("\(path)/planetas.db")
            let createTable = planeta.create(block: {(t:TableBuilder) in
                t.column(id, primaryKey:true)
                t.column(nombre)
                t.column(gravedad)
            })
            
            try db.run(createTable)
        }catch{
        }
    }
    
    func insert(p:Planeta){
        let query = planeta.insert(nombre <- p.nombre, gravedad <- p.gravedad)
        do{
            try db.run(query)
        }catch{
        }
        
    }
    
    func update(p:Planeta){
        let u = planeta.filter(id == p.id)
        let query = u.update(nombre <- p.nombre, gravedad <- p.gravedad)
        do{
            try db.run(query)
        }catch{
        }
    }
    
    func delete(id:Int64){
        let d = planeta.filter(self.id == id)
        let query = d.delete()
        do{
            try db.run(query)
        }catch{
        }
    }
    
    func planetaById(id:Int64) -> Planeta?{
        
        let filter = planeta.filter(self.id == id)
        var p:Planeta? = nil
        
        do{
            for row in try db.prepare(filter){
            
                p = Planeta()
            
                p!.id = row[self.id]
                p!.nombre = row[nombre]
                p!.gravedad = row[gravedad]
                break
            }
            
            return p
        }catch{
            return nil
        }
        
        
    }
    
    func all()->[Planeta]{
        var data:[Planeta] = []
        let sql:String = "SELECT * FROM planeta"
        
        do{
            
            for row in try db.prepare(sql){
                
                let p:Planeta = Planeta()
                p.id = row[0] as! Int64
                p.nombre = row[1] as! String
                p.gravedad = row[2] as! Double
                data.append(p)
                
            }
            
        }catch{}
        
        
        return data
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}
