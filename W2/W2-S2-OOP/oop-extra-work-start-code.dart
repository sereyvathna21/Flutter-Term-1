// Class for Window
class Window {
  String color;
  String position;
  int floor;

  Window(this.color, this.position, this.floor);
}

// Class for Roof
class Roof {
  String material;
  String shape;

  Roof(this.material, this.shape);
}

// Class for Door
class Door {
  String color;
  String position;

  Door(this.color, this.position);
}

// Class for Chimney
class Chimney {
  double height;
  String material;

  Chimney(this.height, this.material);
}

// Class for Tree
class Tree {
  String type;
  double height;

  Tree(this.type, this.height);
}

// Class for House
class House {
  String address;
  List<Window> windows = [];
  Roof? roof;
  Door? door;
  Chimney? chimney;
  List<Tree> trees = [];

  House(this.address);

  void addWindow(Window newWindow) {
    windows.add(newWindow);
  }

  void setRoof(Roof newRoof) {
    roof = newRoof;
  }

  void setDoor(Door newDoor) {
    door = newDoor;
  }

  void setChimney(Chimney newChimney) {
    chimney = newChimney;
  }

  void addTree(Tree newTree) {
    trees.add(newTree);
  }

  void displayHouseDetails() {
    print('House at $address:');
    print('- Roof: ${roof?.material ?? "No roof"} (${roof?.shape ?? ""})');
    print('- Door: ${door?.color ?? "No door"} (${door?.position ?? ""})');
    print(
        '- Chimney: ${chimney != null ? "${chimney!.height}m ${chimney!.material}" : "No chimney"}');

    print('- Windows:');
    if (windows.isNotEmpty) {
      for (var window in windows) {
        print(
            '- ${window.color} window on the ${window.position} side, floor ${window.floor}');
      }
    } else {
      print('No windows');
    }

    print('  - Trees:');
    if (trees.isNotEmpty) {
      for (var tree in trees) {
        print('- ${tree.type}, ${tree.height}m tall');
      }
    } else {
      print('No trees');
    }
  }
}

void main() {
  // Create a house
  var myHouse = House('Vathna');

  // Set roof, door, and chimney
  myHouse.setRoof(Roof('Blue', 'Gabled'));
  myHouse.setDoor(Door('Black', 'Center'));
  myHouse.setChimney(Chimney(3.5, 'Brick'));

  // Add windows
  myHouse.addWindow(Window('Red', 'left', 1));
  myHouse.addWindow(Window('Red', 'left', 1));
  myHouse.addWindow(Window('Red', 'left', 2));
  myHouse.addWindow(Window('Green', 'right', 2));

  // Add trees
  // myHouse.addTree(Tree('Oak', 5.0));
  // myHouse.addTree(Tree('Oak', 6.0));

  // Display house details
  myHouse.displayHouseDetails();
}
