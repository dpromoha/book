//
//  CoreDataManager.swift
//  book
//
//  Created by Daria on 27.06.2024.
//

import CoreData

final class CoreDataManager {
    
    static let shared = CoreDataManager()
    
    private lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: persistentContainerName)
        container.loadPersistentStores { storeDescription, error in
            if let error = error {
                fatalError("Unresolved error \(error)")
            }
        }
        
        return container
    }()
    
    private var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private let persistentContainerName = "BookModel"
    
    init() {}
    
    func addBook(title: String, author: String) {
        let newBook = BookModel(context: viewContext)
        newBook.title = title
        newBook.author = author
        
        saveContext()
    }
    
    func changeBookFavoriteState(for book: BookModel) {
        book.isFavorite.toggle()
        
        saveContext()
    }
    
    func fetchBooks() -> [BookModel] {
        let fetchRequest: NSFetchRequest<BookModel> = BookModel.fetchRequest()
        
        do {
            let books = try viewContext.fetch(fetchRequest)
            
            return books
        } catch let error as NSError {
            fatalError("Failed to fetch books: \(error)")
        }
    }
    
    func deleteBook(_ title: String) {
        // bad decision to delete something by title, not ID, but I can guarantee ID uniqueness, since I use free API :(
        if let bookToDelete = findBookWithTitle(title) {
            viewContext.delete(bookToDelete)
            do {
                try viewContext.save()
            } catch let error as NSError {
                fatalError("Failed to delete book: \(error)")
            }
        }
    }
    
    private func saveContext() {
        if viewContext.hasChanges {
            do {
                try viewContext.save()
            } catch let error as NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
    
    private func findBookWithTitle(_ title: String) -> BookModel? {
        let request: NSFetchRequest<BookModel> = BookModel.fetchRequest()
        request.predicate = NSPredicate(format: "title == %@", title)
        
        do {
            let results = try viewContext.fetch(request)
            
            return results.first
        } catch {
            
            return nil
        }
    }
    
}
