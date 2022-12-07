import Foundation

class FileService {
    var root: Directory
    var activeDirectory: Directory
    
    init() {
        self.root = Directory(name: "/", parent: nil)
        self.activeDirectory = root
    }
    
    func processCommand(_ input: String) -> Void {
        if(input.first != "$") {
            _add(input)
            return
        }
        
        let command = input.split(separator: " ")
        if(String(command[1]) == "cd") {
            _cd(String(command[2]))
        }
    }
    
    func _add(_ input: String) {
        let command = input.split(separator: " ")
        
        let name = String(command[1])
        
        if(String(command[0]) == "dir") {
            activeDirectory.addDirectory(name)
            return
        }
        
        guard let size = Int(command[0]) else {
            return
        }
        activeDirectory.addFile(name, size: size)
    }
    
    func _cd(_ argument: String) -> Void {
        if(argument == "/") {
            activeDirectory = root
            return
        }
        
        if(argument == "..") {
            guard let targetDirectory = activeDirectory.parent else {
                return
            }
            
            activeDirectory = targetDirectory
            return
        }
        
        guard let targetDirectory = activeDirectory.children.first(where: {$0.name == argument}) else {
            return
        }
        
        activeDirectory = targetDirectory
    }
    
    public static func readFile(_ filename: String) -> String? {
        do {
            guard let filepath = Bundle.main.path(forResource: filename, ofType: "txt") else {
                print("Unable to read file \(filename)")
                return nil
            }
            return try String(contentsOfFile: filepath)
        } catch {
            print("Unable to read file \(filename)")
            return nil
        }
    }
}

class Directory {
    var name: String
    weak var parent: Directory?
    var children: [Directory]
    var files: [File]
    
    var size: Int {
        get {
            var fileSize = 0
            
            depthFirstTraversal {
                fileSize += $0.files.map({$0.size}).reduce(0, +)
            }
            
            return fileSize
        }
    }
    
    init(name: String, parent: Directory? = nil) {
        self.name = name
        self.parent = parent
        self.children = []
        self.files = []
    }
    
    func addDirectory(_ name: String) {
        if(children.contains(where: {$0.name == name})) {
            return
        }
        
        children.append(Directory(name: name, parent: self))
    }
    
    func addFile(_ name: String, size: Int) {
        if(files.contains(where: {$0.name == name})) {
            return
        }
        
        files.append(File(name: name, size: size))
    }
    
    func depthFirstTraversal(_ visit: (Directory) -> Void) {
        visit(self)
        children.forEach{
            $0.depthFirstTraversal(visit)
        }
    }
}

struct File {
    var name: String
    var size: Int
}
