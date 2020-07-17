//
//  AddTableViewController.swift
//  Tasks
//
//  Created by Katarina Veljkovic on 08/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit

protocol AddTableViewControllerDelegate: class{
    func done(task: Task) -> Void
}

class AddTableViewController: UITableViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    /// UI
    private var textFieldIme = UITextField()
    private var textFieldBoja = UITextField()
    private var datePicker = UIDatePicker()
    private var textFieldDatum = UITextField()
    private var textFieldPrioritet = UITextField()
    private var selectedBojaTextField = UITextField()
    private var selectedPrioritetTextField = UITextField()
    private var pickerViewPrioritet = UIPickerView()
    private var pickerViewBoja = UIPickerView()
    private var switchHitno = UISwitch()
    private var switchFaza1 = UISwitch()
    private var switchFaza2 = UISwitch()
    private var switchFaza3 = UISwitch()
    
    /// Data
    var task = Task()
    var boje = ["red", "blue", "orange"]
    var prioritet = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eight", "ninth", "tenth"]
    var bojeUI = UIColor()
    var selectedPrioritet = String()
    var selectedBoja = String()
    var faza : [Set] = [Set.prepare, Set.empty, Set.empty]
    var selectedPrioritetEnum = Prioritet(rawValue: 1)
    var hitno = Bool()
    
    weak var delegate: AddTableViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        navigationController?.navigationBar.topItem?.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .cancel, target: self, action: #selector(cancelButtonTapped))
        
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(doneButtonTapped))
        
        tableView.allowsSelection = false
        tableView.register(FirstTableViewCell.self, forCellReuseIdentifier: String(describing: FirstTableViewCell.self))
        
        tableView.register(FifthTableViewCell.self, forCellReuseIdentifier: String(describing: FifthTableViewCell.self))
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 8
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch(indexPath.row){
    case 0:
            let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
            cell.label.text = "Ime:"
            cell.textField.placeholder = "Unesite ime"
            textFieldIme = cell.textField
            cell.textField.addTarget(self, action: #selector(textFieldImeValueChanged(textField:)), for: .valueChanged)
            
            return cell
    case 1:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
        cell.label.text = "Prioritet:"
        cell.textField.placeholder = "Prioritet"
        createPickerPrioritet(tf: cell.textField)
        selectedPrioritetTextField = cell.textField
        
        return cell
    case 2:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
        cell.label.text = "Boja:"
        cell.textField.placeholder = "Boja"
        createPickerBoja(tf: cell.textField)
        selectedBojaTextField = cell.textField
        
        return cell
    case 3:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FifthTableViewCell.self)) as! FifthTableViewCell
        cell.label.text = "Hitno:"
        cell.uiSwitch.addTarget(self, action: #selector(switchHitnoValueChanged(uiswitch:)), for: .valueChanged)
        switchHitno = cell.uiSwitch
        
        return cell
    case 4:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FifthTableViewCell.self)) as! FifthTableViewCell
        cell.label.text = "Faza 1:"
        switchFaza1 = cell.uiSwitch
        cell.uiSwitch.isOn = true
        cell.uiSwitch.isEnabled = false
        
        return cell
    case 5:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FifthTableViewCell.self)) as! FifthTableViewCell
        cell.label.text = "Faza 2:"
        switchFaza2 = cell.uiSwitch
        cell.uiSwitch.addTarget(self, action: #selector(switchFaza2ValueChanged(uiswitch:)), for: .valueChanged)
        
        return cell
    case 6:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FifthTableViewCell.self)) as! FifthTableViewCell
        cell.label.text = "Faza 3:"
        switchFaza3 = cell.uiSwitch
        cell.uiSwitch.addTarget(self, action: #selector(switchFaza3ValueChanged(uiswitch:)), for: .valueChanged)
        
        return cell
    default:
        return UITableViewCell()
        }
    }
    func createPickerBoja(tf: UITextField){
        tf.inputView = pickerViewBoja
        pickerViewBoja.delegate = self
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolBar.sizeToFit()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        tf.inputAccessoryView = toolBar
    }
    func createPickerPrioritet(tf: UITextField){
        tf.inputView = pickerViewPrioritet
        pickerViewPrioritet.delegate = self
        let toolBar = UIToolbar(frame: CGRect(x: 0, y: 0, width: UIScreen.main.bounds.width, height: 35))
        toolBar.sizeToFit()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        tf.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 // number of session
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if pickerView == pickerViewBoja {
            return boje.count // number of dropdown items
        }
         else if pickerView == pickerViewPrioritet{
            return prioritet.count
        }
        return 1;
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if( pickerView == pickerViewBoja){
            return boje[row] // dropdown item
        }
        if(pickerView == pickerViewPrioritet) {
            return prioritet[row]
        }
        return boje[row]
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if(pickerView == pickerViewBoja){
            selectedBoja = boje[row]
            textFieldBoja.text = selectedBoja
            if(selectedBoja == "red"){
                selectedBojaTextField.textColor = .red
                bojeUI = .red
                selectedBojaTextField.backgroundColor = .red
            }
            if(selectedBoja == "blue"){
                selectedBojaTextField.textColor = .blue
                bojeUI = .blue
                selectedBojaTextField.backgroundColor = .blue
            }
            if(selectedBoja == "orange"){
                selectedBojaTextField.textColor = .orange
                bojeUI = .orange
                selectedBojaTextField.backgroundColor = .orange
            }
        }
        else if(pickerView == pickerViewPrioritet){
            selectedPrioritet = prioritet[row]
            textFieldPrioritet.text = selectedPrioritet
            selectedPrioritetTextField.text = selectedPrioritet
            switch(selectedPrioritet){
            case "first":
                selectedPrioritetEnum = Prioritet.jedan
            case "second":
                selectedPrioritetEnum = Prioritet.dva
            case "third":
                selectedPrioritetEnum = Prioritet.tri
            case "fourth":
                selectedPrioritetEnum = Prioritet.cetiri
            case "fifth":
                selectedPrioritetEnum = Prioritet.pet
            case "sixth":
                selectedPrioritetEnum = Prioritet.sest
            case "seventh":
                selectedPrioritetEnum = Prioritet.sedam
            case "eight":
                selectedPrioritetEnum = Prioritet.osam
            case "ninth":
                selectedPrioritetEnum = Prioritet.devet
            case "tenth":
                selectedPrioritetEnum = Prioritet.deset
            default:
                selectedPrioritetEnum = Prioritet.jedan
                    
            }
        }
    }
    @objc func switchHitnoValueChanged(uiswitch: UISwitch){
        if(uiswitch.isOn == true){
            hitno = true
        }
        else if(uiswitch.isOn == false){
            hitno = false
        }
    }
    @objc func switchFaza2ValueChanged(uiswitch: UISwitch){
        if(switchFaza2.isOn == true){
            faza[1] = Set.run
        }
        else if switchFaza2.isOn == false && switchFaza3.isOn == true{
            switchFaza3.isOn = false
            faza[1] = Set.empty
        }
    }
    @objc func switchFaza3ValueChanged(uiswitch: UISwitch){
        if(switchFaza2.isOn == true && switchFaza3.isOn == true){
            faza[2] = Set.finish
        }
        else if(switchFaza2.isOn == false){
            switchFaza3.isOn = false;
        }
    }
    
    @objc func textFieldImeValueChanged(textField: UITextField){
        textFieldIme.text = textField.text
    }
    @objc func doneButtonTapped() {
        dismiss(animated: true)
        task.ime = textFieldIme.text!
        task.prioritet = selectedPrioritetEnum!
        task.boja = bojeUI
        task.date = Date()
        task.isUrgent = hitno
        task.phases = faza
        
        delegate?.done(task: task)

    }
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    
}

