//LUBABAH MUJALLID
//I know the UI does'nt hold up, but all the functionalities are there..



import CoreData
import UIKit

class ToDoListViewController: UITableViewController {
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    var list = [ToDoItem]()
    let tag = "ToDoListViewController:"

    override func viewDidLoad() {
        super.viewDidLoad()
        print("\(tag) view did load")
        fetchList()
        //tableView.delegate = self
        //tableView.dataSource = self
    }
    
    func fetchList() { //fetch to do list items from core data'
        print("\(tag) fetch list")
        do {
            list = try context.fetch(ToDoItem.fetchRequest())
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        catch {
            print("\(error)")
        }
    }
    
    @IBAction func addBtnPressed(_ sender: UIBarButtonItem) { //move to AddItemViewControlle
        print("\(tag) addBtnPressed")
        //prepare(for: <#T##UIStoryboardSegue#>, sender: <#T##Any?#>)
        //hmmm I may not need this
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let addItemCV = segue.destination as! AddItemViewController
        addItemCV.delegate = self
    }
    
}

extension ToDoListViewController {
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! ToDoListTableViewCell
        cell.cellLabels[0].text = list[indexPath.row].title
        cell.cellLabels[2].text = list[indexPath.row].note
        let formatter = DateFormatter()
        formatter.dateStyle = .medium
        formatter.timeStyle = .none
        cell.cellLabels[1].text = formatter.string(from: list[indexPath.row].date!)
        if list[indexPath.row].done {
            cell.accessoryType = .checkmark
        }
        else {
            cell.accessoryType = .none
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return list.count
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.cellForRow(at: indexPath)
        if list[indexPath.row].done {
            list[indexPath.row].done.toggle()
            cell!.accessoryType = .none
        }
        else {
            list[indexPath.row].done.toggle()
            cell!.accessoryType = .checkmark
        }
    }
}

extension ToDoListViewController: addItemViewControllerDelegate {
    
    func addItem(by controller: AddItemViewController, with item: ToDoStruct) {
        print(item)
        let itemToAdd = ToDoItem(context: context)
        itemToAdd.title = item.title
        itemToAdd.note = item.note
        itemToAdd.date = item.date
        itemToAdd.done = item.done
        do {
            try self.context.save()
        }
        catch {}
        fetchList()
        dismiss(animated: true, completion: nil)
    }
    
}
