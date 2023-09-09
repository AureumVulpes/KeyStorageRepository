//
//  CoreDataManager.swift
//  KeyStorage
//
//  Created by Дмитрий on 01.09.2023.
//

import UIKit
import CoreData

protocol CoreDataManagerProtocol {
    func createProfile(platform: String, login: String, password: String)
    func fetchProfiles() -> [Profile]
    func fetchProfile(with platform: String) -> Profile?
    func updateProfile(with platform: String, login: String, password: String)
    func deleteProfiles()
    func deleteProfile(with platform: String)
}

public final class CoreDataManager: NSObject {
    
    public static let shared = CoreDataManager()
    
    private override init() {}
    private var appDelegate: AppDelegate {
        UIApplication.shared.delegate as! AppDelegate
    }
    
    private var context: NSManagedObjectContext {
        appDelegate.persistentContainer.viewContext
    }
    
}

extension CoreDataManager: CoreDataManagerProtocol {
    func createProfile(platform: String, login: String, password: String) {
        guard let profileEntityDescription = NSEntityDescription.entity(forEntityName: "Profile", in: context) else { return }
        let profile = Profile(entity: profileEntityDescription, insertInto: context)
        profile.platform = platform
        profile.login = login
        profile.password = password
        appDelegate.saveContext()
    }
    
    func fetchProfiles() -> [Profile] {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do {
            return (try! context.fetch(fetchRequest) as? [Profile] ) ?? []
        }
    }
    
    func fetchProfile(with platform: String) -> Profile? {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do {
            let profiles = try? context.fetch(fetchRequest) as? [Profile]
            return profiles?.first(where: { $0.platform == platform})
        }
    }
    
    func updateProfile(with platform: String, login: String, password: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do {
            guard let profiles = try? context.fetch(fetchRequest) as? [Profile],
                  let profile = profiles.first(where: { $0.platform == platform }) else { return }
            profile.login = login
            profile.password = password
        }
        appDelegate.saveContext()
    }
    
    func deleteProfiles() {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        let profiles = try? context.fetch(fetchRequest) as? [Profile]
        profiles?.forEach { context.delete($0) }
        appDelegate.saveContext()
    }
    
    func deleteProfile(with platform: String) {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Profile")
        do {
            guard let profiles = try? context.fetch(fetchRequest) as? [Profile],
                  let profile = profiles.first(where: { $0.platform == platform }) else { return }
            context.delete(profile)
        }
        appDelegate.saveContext()
    }
}
