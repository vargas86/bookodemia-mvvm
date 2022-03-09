//
//  CatalogObject.swift
//  appDesafio
//
//  Created by MacBook on 23/01/22.
//

import Foundation
import UIKit

// Catálogo de Libros
class CatalogObject{
    var genres : [Genre]?
    var title : String?
    
    init(genres : [Genre], title : String){
        self.genres = genres
        self.title = title
    }
}

//NUEVO
class CatalogObjectByTitle{
    var indexNames : [IndexName]?
    var title : String?
    
    init(indexNames : [IndexName], title : String){
        self.indexNames = indexNames
        self.title = title
    }
}

class CatalogObjectByAuthor{
    var indexAuthors : [IndexAuthor]?
    var title : String?
    
    init(indexAuthors : [IndexAuthor], title : String){
        self.indexAuthors  = indexAuthors 
        self.title = title
    }
}

class IndexName{
    var indexName : String?
    var books : [Book]?
    
    init(indexName: String, books : [Book]){
        self.indexName = indexName
        self.books = books
    }
}

class IndexAuthor{
    var indexAuthor : String?
    var books : [Book]?
    
    init(indexAuthor: String, books : [Book]){
        self.indexAuthor = indexAuthor
        self.books = books
    }
}

// Genero Literario - CATEGORIA
class Genre{
    var name : String?
    var books : [Book]?
    
    init(name: String, books : [Book]){
        self.name = name
        self.books = books
    }
}

// Book - Producto
class Book{
    var name : String?
    var synopsis : String?
    var image : String?
    var author : String?
    var about : String?
    var genre : String?
    var indexAuthor : String?
    var indexName : String?
    
    init(name : String, synopsis : String, image : String, author : String, about : String, genre : String, indexAuthor : String, indexName : String){
        self.name = name
        self.synopsis = synopsis
        self.image = image
        self.author = author
        self.about = about
        self.genre = genre
        self.indexAuthor = indexAuthor
        self.indexName = indexName
    }

}
