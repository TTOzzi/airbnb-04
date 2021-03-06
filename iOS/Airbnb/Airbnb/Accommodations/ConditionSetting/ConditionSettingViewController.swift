//
//  ConditionSettingViewController.swift
//  Airbnb
//
//  Created by Cloud on 2020/05/27.
//  Copyright © 2020 Cloud. All rights reserved.
//

import UIKit

class ConditionSettingViewController: UIViewController {
    
    // MARK: - Properties
    private var dimmedView: UIView!
    var interfaceView: InterfaceView!
    
    // MARK: - Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        makeConstraints()
    }
    
    // MARK: - Methods
    // MARK: Configure
    private func configure() {
        view.backgroundColor = .clear
        configureDimmedView()
        configureInterfaceView()
        configureDismissButton()
    }
    
    private func configureDimmedView() {
        dimmedView = UIView()
        dimmedView.backgroundColor = UIColor.black.withAlphaComponent(0.66)
        let recognizer = UITapGestureRecognizer()
        recognizer.addTarget(self,
                             action: #selector(dismissViewController))
        dimmedView.addGestureRecognizer(recognizer)
        view.addSubview(dimmedView)
    }
    
    private func configureInterfaceView() {
        interfaceView = InterfaceView()
        view.addSubview(interfaceView)
    }
    
    private func configureDismissButton() {
        interfaceView.dismissButton
            .addTarget(self,
                       action: #selector(dismissViewController),
                       for: .touchUpInside)
    }
    
    // MARK: Constraints
    private func makeConstraints() {
        makeConstraintsDimmedView()
        makeConstraintsInterfaceView()
    }
    
    private func makeConstraintsDimmedView() {
        dimmedView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
    
    func makeConstraintsInterfaceView() {
        interfaceView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
    
    // MARK: Objc
    @objc private func dismissViewController() {
        dismiss(animated: true)
    }
}
