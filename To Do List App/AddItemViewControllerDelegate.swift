
import Foundation

protocol addItemViewControllerDelegate: AnyObject {
    func addItem(by controller: AddItemViewController, with item: ToDoStruct)
}
