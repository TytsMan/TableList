//
//  TrackTableViewController.swift
//  TableList
//
//  Created by Arkadijs Makarenko on 10/08/2022.
//

import UIKit

class TrackTableViewController: UITableViewController {

//    var cover = [
//              "Carly Rae Japsen - Dedicated",
//              "Dj Khaled - father of",
//              "Injury Reserve - Jailbrake",
//              "Jonas Brothers - Happiness Begins ",
//              "Joyner Lucas - adhd",
//              "Maluma - 11-11",
//              "Never Young - LOSER",
//              "Rammstein - rammstein",
//              "Skepta - Ignorance Is Bliss",
//              "Skillet - Victory",
//              "Tylor the Creator - IGOR",
//              "YG - Stop Snitching",
//          ]
    
    var songs = Song.createSong()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return songs.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "trackListCell", for: indexPath)

//        cell.textLabel?.text = cover[indexPath.row]
//        cell.detailTextLabel?.text = cover[indexPath.row]
//        cell.imageView?.image = UIImage(named: cover[indexPath.row])
        
        let song = songs[indexPath.row]
        cell.textLabel?.text = song.track
        cell.detailTextLabel?.text = song.album
        cell.imageView?.image = UIImage(named: song.cover)
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let indexPath = tableView.indexPathForSelectedRow {
            print("indexPath: ", indexPath)
        // Get the new view controller using segue.destination.
            guard let detailVC = segue.destination as? DetailViewController else {return}
        // Pass the selected object to the new view controller.
            detailVC.song = songs[indexPath.row]
        }
    }


}
