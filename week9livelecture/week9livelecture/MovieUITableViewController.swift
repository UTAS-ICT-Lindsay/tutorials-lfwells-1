//
//  MovieUITableViewController.swift
//  week9livelecture
//
//  Created by Lindsay Wells on 27/4/2026.
//

import UIKit
import Firebase
import FirebaseFirestore

class MovieUITableViewController: UITableViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {

    var movies = [Movie]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
                self.tableView.reloadData()
                
                self.navigationController!.tabBarItem.badgeValue = "\(self.movies.count)"
                //(self.tabBarController?.viewControllers[1] as! TwoListsViewController).floorsTable.reloadData()
            }
        }
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1//20
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        //if (section == 0) //do a list of floors
        //if section == 1) //do a list of windows
        return movies.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Section \(section)"
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /*if (indexPath.section == 0)
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "FloorCell", for: indexPath)
        }
        else
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "WindowCell", for: indexPath)
        }*/

        let cell = tableView.dequeueReusableCell(withIdentifier: "MovieCell", for: indexPath)
        let position = indexPath.row
        // Configure the cell...
        if let movieCell = cell as? MovieUITableViewCell {
            movieCell.titleLabel?.text = movies[position].title
            movieCell.subTitleLabel?.text = String(movies[position].year)
            movieCell.movie = movies[position]
        }
        

        return cell
    }
    
    @IBOutlet weak var showImageSpot: UIImageView!
    
    @IBAction func takeAPicture(_ sender: Any) {
        var imagePickerScreen = UIImagePickerController()
        imagePickerScreen.delegate = self
        imagePickerScreen.sourceType = .photoLibrary
        present(imagePickerScreen, animated: true, completion: nil)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any])
    {
        //if (something == null) return;
        
        
        guard let selectedImage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            fatalError("Expected original image from info dictionary")
        }
        
        /*if let selectedImage2 = info[UIImagePickerController.InfoKey.originalImage] as? UIImage
        {
            showImageSpot.image = selectedImage2
        }*/
        
        print(selectedImage.size)
        showImageSpot.image = selectedImage
        
        picker.dismiss(animated: true)
    }
    
    
    @IBAction func deleteTogglePressed(_ sender: Any) {
        self.tableView.setEditing(true, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath)
    {
        if editingStyle == .delete {
            movies.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        }
    }
    
}
