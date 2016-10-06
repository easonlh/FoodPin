//
//  RestaurantTableViewController.swift
//  FoodPin
//
//  Created by 刘浩 on 05/10/2016.
//  Copyright © 2016 刘浩. All rights reserved.
//

import UIKit

class RestaurantTableViewController: UITableViewController {
    
    var canguan = ["建哥","山山","刘冲","郭瑞","张盟","武曲","轩子"]
    var canguanpic = ["a.jpg","b.jpg","c.jpg","d.jpg","e.jpg","f.jpg","g.jpg"]
    var canguanlocation = ["有房有媳妇","有车有房有媳妇","有车有房有媳妇有孩子","有车有媳妇有房","有车有房有媳妇","有前途","有房有车"]
    var canguantype  = ["","B","C","D","E","F","G"]
    var isgorest = [Bool](repeating: false, count: 7)
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return canguan.count
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let alert = UIAlertController(title: "dear, you select", message: "message", preferredStyle: UIAlertControllerStyle.actionSheet)
        let cancelAction = UIAlertAction(title: "cancel", style: UIAlertActionStyle.cancel, handler: nil)
        let dailMethod = {
            (action: UIAlertAction) -> Void in
            let alert = UIAlertController(title: "message", message: "you dail number is errror", preferredStyle: .alert)
            let action = UIAlertAction(title: "ok", style: .default, handler: nil)
            alert.addAction(action)
            self.present(alert, animated: true, completion: nil)
        }
        let dialAction = UIAlertAction(title: "dial 021-6532-\(indexPath.row + 1)", style: .default, handler: dailMethod)
        let iamcome = UIAlertAction(title: "i am come", style: .default) { (_) in
            let cell = tableView.cellForRow(at: indexPath)
            cell?.accessoryType = UITableViewCellAccessoryType.checkmark
            self.isgorest[indexPath.row] = true
            
        }
        alert.addAction(cancelAction)
        alert.addAction(dialAction)
        alert.addAction(iamcome)
        self.present(alert, animated: true, completion: nil)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as! CustomTableViewCell
        
        
        cell.restaurantImage.image = UIImage(named: canguanpic[indexPath.row])
        cell.restaurantName.text = canguan[indexPath.row]
        cell.restaurantImage.layer.cornerRadius = cell.restaurantImage.frame.size.width / 2
        cell.location.text = canguanlocation[indexPath.row]
        cell.restaurantType.text = canguantype[indexPath.row]
        cell.restaurantImage.clipsToBounds = true
        if isgorest[indexPath.row]  {
            cell.accessoryType = .checkmark
        } else {
            cell.accessoryType = .none
        }
        

        return cell
    }


    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

   
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            canguan.remove(at: indexPath.row)
            canguantype.remove(at: indexPath.row)
            canguanlocation.remove(at: indexPath.row)
            isgorest.remove(at: indexPath.row)
            canguanpic.remove(at: indexPath.row)
            tableView.deleteRows(at: [indexPath], with: .fade)
         //   tableView.deleteRows(at: [indexPath], with: .fade)

            tableView.reloadData()
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }
            }
   override func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let shareAction = UITableViewRowAction(style: UITableViewRowActionStyle.default, title: "share") { (action, indexPath) in
            let alert = UIAlertController(title: "share to ", message: "please select you share type", preferredStyle: .actionSheet)
            let qqAction = UIAlertAction(title: "qq", style: .default, handler: nil)
                 let weiboAction = UIAlertAction(title: "weibo", style: .default, handler: nil)
                 let weixinAction = UIAlertAction(title: "weixin", style: .default, handler: nil)
            alert.addAction(qqAction)
            alert.addAction(weiboAction)
            alert.addAction(weixinAction)
            self.present(alert, animated: true, completion: nil)
        }
    shareAction.backgroundColor = UIColor(red: 218/255, green: 225/255, blue: 218/255, alpha: 1)
    let deleteAction = UITableViewRowAction(style: .default, title: "delete") { (action, indexPath) in
        self.canguan.remove(at: indexPath.row)
        self.canguantype.remove(at: indexPath.row)
        self.canguanlocation.remove(at: indexPath.row)
        self.isgorest.remove(at: indexPath.row)
        self.canguanpic.remove(at: indexPath.row)
        tableView.deleteRows(at: [indexPath], with: .fade)
        //   tableView.deleteRows(at: [indexPath], with: .fade)
        
        tableView.reloadData()

    }
        return [shareAction, deleteAction]
        
    }


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
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
