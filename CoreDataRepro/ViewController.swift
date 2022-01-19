//
//  ViewController.swift
//  CoreDataRepro
//
//  Created by Markus Chmelar on 19.01.22.
//

import UIKit
import CoreData

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  private func fetchData() async {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let context = appDelegate.persistentContainer.viewContext
    let request = Thing.fetchRequest()
    
    do {
      context.perform {
        // This compiles and uses `NSManagedObjectContext.perform(block:)`
      }
      context.perform {
        // This does not compile with iOS < 15 because it uses `NSManagedObjectContext.perform(scheduler:block:)`
        let _ = try context.fetch(request)
      }
    } catch {
      print(error)
    }
  }
}

