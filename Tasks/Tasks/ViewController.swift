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
    let textFieldIme = UITextField()
    let textFieldPrioritet = UITextField()
    let textFieldBoja = UITextField()
    let textFieldDatum = UITextField()
    let textFieldHitno = UITextField()
    let textFieldFaza = UITextField()
    let boja = UIView()
    
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
        firstStack.spacing = 20
        
//stack ime
        
        let labelIme = UILabel()
        firstStack.addArrangedSubview(labelIme)
        labelIme.translatesAutoresizingMaskIntoConstraints = false
        labelIme.text = "Ime:"
        labelIme.textColor = .black
        labelIme.heightAnchor.constraint(equalTo: firstStack.heightAnchor).isActive = true
        labelIme.widthAnchor.constraint(equalTo: firstStack.widthAnchor).isActive = true
        
        
        firstStack.addArrangedSubview(textFieldIme)
        textFieldIme.translatesAutoresizingMaskIntoConstraints = false
        textFieldIme.placeholder = "Imee"
        textFieldIme.heightAnchor.constraint(equalTo: firstStack.heightAnchor).isActive = true
        textFieldIme.widthAnchor.constraint(equalTo: firstStack.widthAnchor).isActive = true
        textFieldIme.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor, constant: 40).isActive = true
//prezime
        
        let labelPrioritet = UILabel()
        firstStack.addArrangedSubview(labelPrioritet)
        labelPrioritet.translatesAutoresizingMaskIntoConstraints = false
        labelPrioritet.text = "Prioritet:"
        labelPrioritet.textColor = .black
        labelPrioritet.heightAnchor.constraint(equalTo: firstStack.heightAnchor).isActive = true
        labelIme.widthAnchor.constraint(equalTo: firstStack.widthAnchor).isActive = true
        labelPrioritet.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor, constant: 150).isActive = true
        
        
        firstStack.addArrangedSubview(textFieldPrioritet)
        textFieldPrioritet.translatesAutoresizingMaskIntoConstraints = false
        textFieldPrioritet.placeholder = "Prioritet"
        textFieldPrioritet.heightAnchor.constraint(equalTo: firstStack.heightAnchor).isActive = true
        textFieldPrioritet.widthAnchor.constraint(equalTo: firstStack.widthAnchor).isActive = true
        textFieldPrioritet.leadingAnchor.constraint(equalTo: firstStack.leadingAnchor, constant: 240).isActive = true
 //drugi stack
        
        let secondStack = UIStackView()
        mainStack.addArrangedSubview(secondStack)
        secondStack.translatesAutoresizingMaskIntoConstraints = false
        secondStack.axis = .horizontal
        secondStack.alignment = .fill
        secondStack.distribution = .fill
        secondStack.spacing = 20
        
        let labelBoja = UILabel()
        secondStack.addArrangedSubview(labelBoja)
        labelBoja.translatesAutoresizingMaskIntoConstraints = false
        labelBoja.text = "Boja:"
        labelBoja.textColor = .black
        labelBoja.heightAnchor.constraint(equalTo: secondStack.heightAnchor).isActive = true
        labelBoja.widthAnchor.constraint(equalTo: secondStack.widthAnchor).isActive = true
        labelBoja.leadingAnchor.constraint(equalTo: secondStack.leadingAnchor).isActive = true
        
        secondStack.addArrangedSubview(boja)
        boja.translatesAutoresizingMaskIntoConstraints = false
        boja.widthAnchor.constraint(equalToConstant: 10).isActive = true
        boja.heightAnchor.constraint(equalToConstant: 20).isActive = true
        boja.leadingAnchor.constraint(equalTo: secondStack.leadingAnchor, constant: 40).isActive = true
        
//datum
        let labelDatum = UILabel()
        secondStack.addArrangedSubview(labelDatum)
        labelDatum.translatesAutoresizingMaskIntoConstraints = false
        labelDatum.text = "Datum:"
        labelDatum.textColor = .black
        labelDatum.heightAnchor.constraint(equalTo: secondStack.heightAnchor).isActive = true
        labelDatum.widthAnchor.constraint(equalTo: secondStack.widthAnchor).isActive = true
        labelDatum.leadingAnchor.constraint(equalTo: secondStack.leadingAnchor, constant: 150).isActive = true
        
        
        secondStack.addArrangedSubview(textFieldDatum)
        textFieldDatum.translatesAutoresizingMaskIntoConstraints = false
        textFieldDatum.placeholder = "Datuum"
        textFieldDatum.heightAnchor.constraint(equalTo: secondStack.heightAnchor).isActive = true
        textFieldDatum.widthAnchor.constraint(equalTo: secondStack.widthAnchor).isActive = true
        textFieldDatum.leadingAnchor.constraint(equalTo: secondStack.leadingAnchor, constant: 250).isActive = true
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
        labelHitno.widthAnchor.constraint(equalTo: thirdStack.widthAnchor).isActive = true
        labelHitno.leadingAnchor.constraint(equalTo: thirdStack.leadingAnchor).isActive = true
        
        
        thirdStack.addArrangedSubview(textFieldHitno)
        textFieldHitno.translatesAutoresizingMaskIntoConstraints = false
        textFieldHitno.placeholder = "Hitnoo"
        textFieldHitno.heightAnchor.constraint(equalTo: thirdStack.heightAnchor).isActive = true
        textFieldHitno.widthAnchor.constraint(equalTo: thirdStack.widthAnchor).isActive = true
        textFieldHitno.leadingAnchor.constraint(equalTo: thirdStack.leadingAnchor, constant: 60).isActive = true
//faze
        let labelFaza = UILabel()
        thirdStack.addArrangedSubview(labelFaza)
        labelFaza.translatesAutoresizingMaskIntoConstraints = false
        labelFaza.text = "Faza:"
        labelFaza.textColor = .black
        labelFaza.heightAnchor.constraint(equalTo: thirdStack.heightAnchor).isActive = true
        labelFaza.widthAnchor.constraint(equalTo: thirdStack.widthAnchor).isActive = true
        labelFaza.leadingAnchor.constraint(equalTo: thirdStack.leadingAnchor, constant: 150).isActive = true
        
        thirdStack.addArrangedSubview(textFieldFaza)
        textFieldFaza.translatesAutoresizingMaskIntoConstraints = false
        textFieldFaza.placeholder = "Hitnoo"
        textFieldFaza.heightAnchor.constraint(equalTo: thirdStack.heightAnchor).isActive = true
        textFieldFaza.widthAnchor.constraint(equalTo: thirdStack.widthAnchor).isActive = true
        textFieldFaza.leadingAnchor.constraint(equalTo: thirdStack.leadingAnchor, constant: 250).isActive = true
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
        tableView.widthAnchor.constraint(equalTo: fourthStack.widthAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: fourthStack.leadingAnchor).isActive = true
        
        tableView.allowsSelection = false
        
        let set = [Set.prepare, Set.finish]
        let set2 = [Set.prepare, Set.run]
        
        let task1 = Task(ime: "task1", prioritet: Prioritet.cetiri, boja: .red, date: Date(), isUrgent: false, phases: set )
        let task2 = Task(ime: "task2", prioritet: Prioritet.tri, boja: .orange, date: Date(), isUrgent: true, phases: set2)
        let task3 = Task(ime: "task3", prioritet: Prioritet.devet, boja: .blue, date: Date(), isUrgent: true, phases: set1)
        let task4 = Task(ime: "task4", prioritet: Prioritet.dva, boja: .orange, date: Date(), isUrgent: true, phases: set2)
        let task5 = Task(ime: "task5", prioritet: Prioritet.osam, boja: .blue, date: Date(), isUrgent: true, phases: set1)
        tasks.append(task1)
        tasks.append(task2)
        tasks.append(task3)
        tasks.append(task4)
        tasks.append(task5)
        
        
        start()
        
        

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
            if !self!.tasks.isEmpty{
            self!.AddToLabels()
            self!.textFieldFaza.text = "prepare"
            
            if(self!.tasks[0].phases[0] == Set.prepare){
                
                if(self!.tasks[0].phases[1] == Set.run){
                    self!.stage2()
                }
                if(self!.tasks[0].phases[1] == Set.finish){
                    self!.stage3()
                }
            }
            self!.tasks.remove(at: 0)
            self!.tableView.reloadData()
        }
        }
    }
    func stage2(){
        
        Timer.scheduledTimer(withTimeInterval:2, repeats: false) { [weak self] timer in
            self!.textFieldFaza.text = "run"
            self!.stageEnd()
            
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
        switch(tasks[0].prioritet){
        case Prioritet.jedan:
             textFieldPrioritet.text = "prvi"
        case Prioritet.dva:
             textFieldPrioritet.text = "drugi"
        case Prioritet.tri:
             textFieldPrioritet.text = "treci"
        case Prioritet.cetiri:
             textFieldPrioritet.text = "cetvrti"
        case Prioritet.pet:
             textFieldPrioritet.text = "peti"
        case Prioritet.sest:
             textFieldPrioritet.text = "sesti"
        case Prioritet.sedam:
             textFieldPrioritet.text = "sedmi"
        case Prioritet.osam:
             textFieldPrioritet.text = "osmi"
        case Prioritet.devet:
             textFieldPrioritet.text = "deveti"
        case Prioritet.deset:
             textFieldPrioritet.text = "deseti"
        }
        
        boja.backgroundColor = tasks[0].boja
        
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
}
extension ViewController: AddTableViewControllerDelegate {
    func done(task: Task) {
        self.task = task
        tasks.append(task)
        tableView.reloadData()
        start()

    }
}

