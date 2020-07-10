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
    var task = Task()
    var textFieldIme = UITextField()
    var textFieldBoja = UITextField()
    var datePicker = UIDatePicker()
    var textFieldDatum = UITextField()
    var textFieldPrioritet = UITextField()
    var boje = ["red", "blue", "orange"]
    var prioritet = ["first", "second", "third", "fourth", "fifth", "sixth", "seventh", "eight", "ninth", "tenth"]
    var bojeUI = UIColor()
    var selectedBoja = String()
    var selectedBojaTextField = UITextField()
    var selectedPrioritet = String()
    var selectedPrioritetTextField = UITextField()
    var pickerViewPrioritet = UIPickerView()
    var pickerViewBoja = UIPickerView()
    var switchHitno = UISwitch()
    var switchFaza1 = UISwitch()
    var switchFaza2 = UISwitch()
    var switchFaza3 = UISwitch()
    var faza : [Set] = []
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
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FirstTableViewCell.self)) as! FirstTableViewCell
        cell.label.text = "Datum:"
        cell.textField.placeholder = "Datum"
        createDatePicker(tf : cell.textField)
        textFieldDatum = cell.textField
        
        return cell
    case 4:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FifthTableViewCell.self)) as! FifthTableViewCell
        cell.label.text = "Hitno:"
        cell.uiSwitch.addTarget(self, action: #selector(switchHitnoValueChanged(uiswitch:)), for: .valueChanged)
        switchHitno = cell.uiSwitch
        
        return cell
    case 5:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FifthTableViewCell.self)) as! FifthTableViewCell
        cell.label.text = "Faza 1:"
        switchFaza1 = cell.uiSwitch
        faza.append(Set.run)
        cell.uiSwitch.isOn = true
        cell.uiSwitch.isEnabled = false
        
        
        return cell
    case 6:
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: FifthTableViewCell.self)) as! FifthTableViewCell
        cell.label.text = "Faza 2:"
        switchFaza2 = cell.uiSwitch
        cell.uiSwitch.addTarget(self, action: #selector(switchFaza2ValueChanged(uiswitch:)), for: .valueChanged)
        
        return cell
    case 7:
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
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        tf.inputAccessoryView = toolBar
    }
    func createPickerPrioritet(tf: UITextField){
        tf.inputView = pickerViewPrioritet
        pickerViewPrioritet.delegate = self
        let toolBar = UIToolbar()
        toolBar.sizeToFit()
        let button = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(self.action))
        toolBar.setItems([button], animated: true)
        toolBar.isUserInteractionEnabled = true
        tf.inputAccessoryView = toolBar
    }
    @objc func action() {
          view.endEditing(true)
    }
    func createDatePicker(tf : UITextField){
        let toolbar = UIToolbar()
        toolbar.sizeToFit()
        let doneButton = UIBarButtonItem(barButtonSystemItem: .done, target: nil, action: #selector(donePressed))
        toolbar.setItems([doneButton], animated: true)
        tf.inputAccessoryView = toolbar
        tf.inputView = datePicker
        datePicker.datePickerMode = .date
    }
    @objc func donePressed(){
        self.view.endEditing(true)
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textFieldDatum.text = formatter.string(from: datePicker.date)
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
        if(switchFaza3.isOn == true){
            faza.removeLast()
            faza.append(Set.prepare)
            switchFaza3.isOn = false
        }
        else if(switchFaza3.isOn == false){
            faza.append(Set.prepare)
        }
    }
    @objc func switchFaza3ValueChanged(uiswitch: UISwitch){
        if(switchFaza2.isOn == true){
            faza.removeLast()
            faza.append(Set.finish)
            switchFaza2.isOn = false
        }
        else if(switchFaza2.isOn == false){
            faza.append(Set.finish)
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
        task.date = datePicker.date
        task.isUrgent = hitno
        task.phases = faza
        
        delegate?.done(task: task)

    }
    @objc func cancelButtonTapped() {
        dismiss(animated: true)
    }
    
    
}

