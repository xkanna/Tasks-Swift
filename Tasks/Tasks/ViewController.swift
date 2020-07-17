//
//  ViewController.swift
//  Tasks
//
//  Created by Katarina Veljkovic on 08/07/2020.
//  Copyright © 2020 Katarina Veljkovic. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,  UITableViewDataSource {

    let tableView = UITableView()
    var task = Task()
    var tasks : [Task] = []
    var tempTask = Task()
    var sortingTasks : [Task] = []
    let textFieldIme = UITextField()
    let textFieldPrioritet = UITextField()
    let textFieldBoja = UITextField()
    let textFieldDatum = UITextField()
    let textFieldHitno = UITextField()
    let textFieldFaza = UITextField()
    let bojaView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationController?.navigationBar.topItem?.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(addButtonTapped))
     
        tableView.register(MainTableViewCell.self, forCellReuseIdentifier: String(describing: MainTableViewCell.self))
        tableView.delegate = self
        tableView.dataSource = self
        
        let mainStack = UIStackView()
        view.addSubview(mainStack)
        mainStack.translatesAutoresizingMaskIntoConstraints = false
        mainStack.axis = .vertical
        mainStack.alignment = .fill
        mainStack.distribution = .fill
        mainStack.spacing = 20
        mainStack.topAnchor.constraint(equalTo: view.layoutMarginsGuide.topAnchor, constant: 20).isActive = true
        mainStack.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -20).isActive = true
        mainStack.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20).isActive = true
        mainStack.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true;
        
        let firstStack = UIStackView()
        mainStack.addArrangedSubview(firstStack)
        firstStack.translatesAutoresizingMaskIntoConstraints = false
        firstStack.axis = .horizontal
        firstStack.alignment = .fill
        firstStack.distribution = .fill
        
//stack ime
        
        let labelIme = UILabel()
        firstStack.addArrangedSubview(labelIme)
        labelIme.translatesAutoresizingMaskIntoConstraints = false
        labelIme.text = "Ime:"
        labelIme.textColor = .black
        labelIme.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor).isActive = true
        labelIme.heightAnchor.constraint(equalTo: firstStack.heightAnchor).isActive = true
        
        
        firstStack.addArrangedSubview(textFieldIme)
        textFieldIme.translatesAutoresizingMaskIntoConstraints = false
        textFieldIme.placeholder = "Imee"
        textFieldIme.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor, constant: 40).isActive = true
//prioritet
        
        let labelPrioritet = UILabel()
        firstStack.addArrangedSubview(labelPrioritet)
        labelPrioritet.translatesAutoresizingMaskIntoConstraints = false
        labelPrioritet.text = "Prioritet:"
        labelPrioritet.textColor = .black
        labelPrioritet.heightAnchor.constraint(equalTo: firstStack.heightAnchor).isActive = true
        labelPrioritet.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor, constant: 150).isActive = true
        
        
        firstStack.addArrangedSubview(textFieldPrioritet)
        textFieldPrioritet.translatesAutoresizingMaskIntoConstraints = false
        textFieldPrioritet.placeholder = "Prioritet"
        textFieldPrioritet.heightAnchor.constraint(equalTo: firstStack.heightAnchor).isActive = true
        textFieldPrioritet.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor, constant: 240).isActive = true
 //drugi stack
        
        let secondStack = UIStackView()
        mainStack.addArrangedSubview(secondStack)
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        secondStack.axis = .horizontal
        secondStack.alignment = .fill
        secondStack.distribution = .fill
        
        let bojaLabel = UILabel()
        secondStack.addArrangedSubview(bojaLabel)
        bojaLabel.translatesAutoresizingMaskIntoConstraints = false
        bojaLabel.text = "Boja:"
        bojaLabel.textColor = .black
        bojaLabel.heightAnchor.constraint(equalTo: secondStack.heightAnchor).isActive = true
        bojaLabel.leadingAnchor.constraint(equalTo: secondStack.leadingAnchor).isActive = true
        
        secondStack.addArrangedSubview(bojaView)
        bojaView.translatesAutoresizingMaskIntoConstraints = false
        bojaView.heightAnchor.constraint(equalToConstant: 20).isActive = true
        bojaView.leadingAnchor.constraint(equalTo: secondStack.leadingAnchor, constant: 40).isActive = true
        
//datum
        let labelDatum = UILabel()
        secondStack.addArrangedSubview(labelDatum)
        labelDatum.translatesAutoresizingMaskIntoConstraints = false
        labelDatum.text = "Datum:"
        labelDatum.textColor = .black
        labelDatum.heightAnchor.constraint(equalTo: secondStack.heightAnchor).isActive = true
        labelDatum.leadingAnchor.constraint(equalTo: secondStack.leadingAnchor, constant: 150).isActive = true
        
        
        secondStack.addArrangedSubview(textFieldDatum)
        textFieldDatum.translatesAutoresizingMaskIntoConstraints = false
        textFieldDatum.placeholder = "Datuum"
        textFieldDatum.heightAnchor.constraint(equalTo: secondStack.heightAnchor).isActive = true
        textFieldDatum.leadingAnchor.constraint(equalTo: secondStack.leadingAnchor, constant: 230).isActive = true
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textFieldDatum.text = formatter.string(from: task.date)

//treci stack
        let thirdStack = UIStackView()
        mainStack.addArrangedSubview(thirdStack)
        thirdStack.translatesAutoresizingMaskIntoConstraints = false
        thirdStack.axis = .horizontal
        thirdStack.alignment = .fill
        thirdStack.distribution = .fill
//hitno
        let labelHitno = UILabel()
        thirdStack.addArrangedSubview(labelHitno)
        labelHitno.translatesAutoresizingMaskIntoConstraints = false
        labelHitno.text = "Hitno:"
        labelHitno.textColor = .black
        labelHitno.heightAnchor.constraint(equalTo: thirdStack.heightAnchor).isActive = true
        labelHitno.leadingAnchor.constraint(equalTo: thirdStack.leadingAnchor).isActive = true
        
        
        thirdStack.addArrangedSubview(textFieldHitno)
        textFieldHitno.translatesAutoresizingMaskIntoConstraints = false
        textFieldHitno.placeholder = "Hitnoo"
        textFieldHitno.heightAnchor.constraint(equalTo: thirdStack.heightAnchor).isActive = true
        textFieldHitno.leadingAnchor.constraint(equalTo: thirdStack.leadingAnchor, constant: 60).isActive = true
//faze
        let labelFaza = UILabel()
        thirdStack.addArrangedSubview(labelFaza)
        labelFaza.translatesAutoresizingMaskIntoConstraints = false
        labelFaza.text = "Faza:"
        labelFaza.textColor = .black
        labelFaza.heightAnchor.constraint(equalTo: thirdStack.heightAnchor).isActive = true
        labelFaza.leadingAnchor.constraint(equalTo: thirdStack.leadingAnchor, constant: 150).isActive = true
        
        thirdStack.addArrangedSubview(textFieldFaza)
        textFieldFaza.translatesAutoresizingMaskIntoConstraints = false
        textFieldFaza.placeholder = "Hitnoo"
        textFieldFaza.heightAnchor.constraint(equalTo: thirdStack.heightAnchor).isActive = true
        textFieldFaza.leadingAnchor.constraint(equalTo: thirdStack.leadingAnchor, constant: 230).isActive = true
//table view
        let fourthStack = UIStackView()
        mainStack.addArrangedSubview(fourthStack)
        fourthStack.translatesAutoresizingMaskIntoConstraints = false
        fourthStack.axis = .horizontal
        fourthStack.alignment = .fill
        fourthStack.distribution = .fill
        
        fourthStack.addArrangedSubview(tableView)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.heightAnchor.constraint(equalTo: fourthStack.heightAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: fourthStack.leadingAnchor).isActive = true
        
        tableView.allowsSelection = false
        
        let set = [Set.prepare, Set.run, Set.empty]
        let set2 = [Set.prepare, Set.run, Set.finish]
        
        let task1 = Task(ime: "task1", prioritet: Prioritet.cetiri, boja: .red, date: Date(), isUrgent: false, phases: set )
        let task2 = Task(ime: "task2", prioritet: Prioritet.tri, boja: .orange, date: Date(), isUrgent: true, phases: set2)
        let task3 = Task(ime: "task3", prioritet: Prioritet.devet, boja: .blue, date: Date(), isUrgent: false, phases: set)
        let task4 = Task(ime: "task4", prioritet: Prioritet.dva, boja: .orange, date: Date(), isUrgent: true, phases: set2)
        let task5 = Task(ime: "task5", prioritet: Prioritet.osam, boja: .blue, date: Date(), isUrgent: true, phases: set)
        let task6 = Task(ime: "task6", prioritet: Prioritet.jedan, boja: .red, date: Date(), isUrgent: false, phases: set)
        tasks.append(task1)
        tasks.append(task2)
        tasks.append(task3)
        tasks.append(task4)
        tasks.append(task5)
        tasks.append(task6)
        
        sorting()
        
        start()

    }
    func sorting(){
        tasks.sort(by: {
            if $0.isUrgent != $1.isUrgent {
                return $0.isUrgent && !$1.isUrgent
            } else if $0.prioritet != $1.prioritet {
                return $0.prioritet.rawValue < $1.prioritet.rawValue
            } else if $0.date.compare($1.date) == .orderedDescending {
                return true
            }
            return false
        })
    }
    @objc func addButtonTapped() {
        let vc = AddTableViewController()
        vc.delegate = self
        //vc.task = task
        let nc = UINavigationController(rootViewController: vc)
        present(nc, animated: true)
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: MainTableViewCell.self)) as! MainTableViewCell
        cell.label.text = tasks[indexPath.row].ime
        cell.view.backgroundColor = tasks[indexPath.row].boja
        return cell
    }
    func start() {
        stage1()
    }
    
    func stage1(){
        
        Timer.scheduledTimer(withTimeInterval:2, repeats: false) { [weak self] timer in
            guard let self = self else {
                return
            }
            
            if !self.tasks.isEmpty {
                self.AddToLabels()
                self.textFieldFaza.text = "prepare"
                self.tempTask = self.tasks[0]
                
                if self.tempTask.phases[0] == Set.prepare {
                    
                    if self.tempTask.phases[1] == Set.run {
                        self.stage2()
                    }
                }
                self.tasks.remove(at: 0)
                self.tableView.reloadData()
            } else {
                self.removeFromLabels()
            }
        }
    }
    
    func stage2(){
        
        Timer.scheduledTimer(withTimeInterval:2, repeats: false) { [weak self] timer in
            self!.textFieldFaza.text = "run"
            
            if self!.tempTask.phases[2] == Set.finish {
                self!.stage3()
            } else if self!.tempTask.phases[2] == Set.empty {
                self!.stageEnd()
            }
        }
    }
    func stage3(){
        
        Timer.scheduledTimer(withTimeInterval: 2, repeats: false) { [weak self] timer in
            self!.textFieldFaza.text = "finish"
            
            self!.stageEnd()
        }
        
    }
    
    func stageEnd(){
        
        Timer.scheduledTimer(withTimeInterval:1, repeats: false) { [weak self] timer in
            
            self!.stage1()
        }
    }
    func AddToLabels(){
        textFieldIme.text = tasks[0].ime
        textFieldPrioritet.text = tasks[0].prioritet.title()
        bojaView.backgroundColor = tasks[0].boja
        
        let formatter = DateFormatter()
        formatter.dateFormat = "dd/MM/yyyy"
        textFieldDatum.text = formatter.string(from: tasks[0].date)
        
        if(tasks[0].isUrgent == true){
            textFieldHitno.text = "da"
        }
        if(tasks[0].isUrgent == false){
            textFieldHitno.text = "ne"
        }
    }
    
    func removeFromLabels(){
        textFieldIme.text = .none
        textFieldBoja.backgroundColor = .none
        textFieldFaza.text = .none
        textFieldDatum.text = .none
        textFieldHitno.text = .none
        textFieldPrioritet.text = .none
    }
}

extension ViewController: AddTableViewControllerDelegate {
    
    func done(task: Task) {
        self.task = task
        tasks.append(task)
        sorting()
        tableView.reloadData()
    }
}
