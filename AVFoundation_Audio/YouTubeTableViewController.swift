//
//  YouTubeTableViewController.swift
//  AVFoundation_Audio
//
//  Created by Vadim Vinogradov on 16.07.2023.
//

import AVKit
import WebKit

class YouTubeTableViewController: UITableViewController {
    
    let videos = Video.make()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationItem.title = "YouTube Videos"

        // Uncomment the following line to preserve selection between presentations
//         self.clearsSelectionOnViewWillAppear = false

//         Uncomment the following line to display an Edit button in the navigation bar for this view controller.
//         self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return videos.count
    }

  
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        let video = videos[indexPath.row]
        
        var contentConfig = UIListContentConfiguration.cell()
        contentConfig.text = video.title
        contentConfig.image = video.image
        configureImageContent(&contentConfig, with: video.image)

        cell.contentConfiguration = contentConfig
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let webView = WKWebView(frame: self.view.frame)
        let webViewViewCotroller = UIViewController()
        webViewViewCotroller.view.addSubview(webView)
        
        let request = URLRequest(url: videos[indexPath.row].url)
        webView.load(request)
        
        webViewViewCotroller.title = "Video"
        self.navigationController?.pushViewController(webViewViewCotroller, animated: true)
    }
    
    private func configureImageContent(_ contentConfiguration: inout UIListContentConfiguration, with image: UIImage?) {
        guard let image = image else {
            return
        }
        
        contentConfiguration.image = image
        contentConfiguration.imageProperties.maximumSize = CGSize(width: 80, height: 80)
        contentConfiguration.imageProperties.cornerRadius = 5
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

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
