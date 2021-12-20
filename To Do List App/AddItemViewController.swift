
import UIKit

class AddItemViewController: UIViewController {

    @IBOutlet var itemTextFields: [UITextField]!
    weak var delegate: addItemViewControllerDelegate?
    var dueDate: Date = Date()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itemTextFields[0].text = ""
        itemTextFields[1].text = ""
    }
    
    @IBAction func datePickerValueChanged(_ sender: UIDatePicker) {
        //save values?
        dueDate = sender.date
    }
    
    @IBAction func addBtnPressed(_ sender: UIButton) {
        print("AddItemViewController: addBtnPressed")
        let item = ToDoStruct(title: itemTextFields[0].text!, note: itemTextFields[1].text!, date: dueDate, done: false)
        delegate?.addItem(by: self, with: item)
    }
}

extension NSLayoutConstraint {
    override public var description: String {
        let id = identifier ?? ""
        return "id: \(id), constant: \(constant)"
    }
}


//read data
//add btn pressed
//seuge back to main

