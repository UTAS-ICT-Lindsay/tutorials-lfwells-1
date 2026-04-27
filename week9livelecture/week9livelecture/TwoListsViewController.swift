//
//  TwoListsViewController.swift
//  week9livelecture
//
//  Created by Lindsay Wells on 27/4/2026.
//

import UIKit
import Firebase
import FirebaseFirestore

class TwoListsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var floorsTable: UITableView!
    
    @IBOutlet weak var windowsTable: UITableView!
    
    var movies = [Movie]()
    var moviesListTwo = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesListTwo.append(Movie(title: "Shawshank Redemtion", year: 2000, duration: 3))
        
        floorsTable.dataSource = self
        floorsTable.delegate = self
        
        windowsTable.dataSource = self
        windowsTable.delegate = self
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        let db = Firestore.firestore()
        let movieCollection = db.collection("movies")
        movieCollection.getDocuments() { (result, err) in
            if let err = err
            {
                print("Error getting documents: \(err)")
            }
            else
            {
                for document in result!.documents
                {
                    let conversionResult = Result
                    {
                        try document.data(as: Movie.self)
                    }
                    switch conversionResult
                    {
                    case .success(let movie):
                        print("Movie: \(movie)")
                        
                        //NOTE THE ADDITION OF THIS LINE
                        self.movies.append(movie)
                        
                    case .failure(let error):
                        // A `Movie` value could not be initialized from the DocumentSnapshot.
                        print("Error decoding movie: \(error)")
                    }
                }
                
                //NOTE THE ADDITION OF THIS LINE
                //self.tableView.reloadData()
                self.floorsTable.reloadData()
                self.windowsTable.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == floorsTable {
            return movies.count
        } else {
            return moviesListTwo.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        let position = indexPath.row
        // Configure the cell...
        
        if let movieCell = cell as? MovieUITableViewCell {
            
            if (tableView == floorsTable)
            {
                movieCell.titleLabel?.text = movies[position].title
                movieCell.subTitleLabel?.text = String(movies[position].year)
            }
            else
            {
                movieCell.titleLabel?.text = moviesListTwo[position].title
                movieCell.subTitleLabel?.text = String(moviesListTwo[position].year)
            }
        }
        

        return cell
    }
    

}
