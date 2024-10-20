enum Direction { north, east, south, west }

class Robot {
  int x;
  int y;
  Direction direction;

  Robot({required this.x, required this.y, this.direction = Direction.north});

  // Turn right
  void turnRight() {
    direction =
        Direction.values[(direction.index + 1) % Direction.values.length];
  }

  // Turn left
  void turnLeft() {
    direction = Direction.values[
        (direction.index - 1 + Direction.values.length) %
            Direction.values.length];
  }

  // Advance in the current direction
  void advance() {
    switch (direction) {
      case Direction.north:
        y += 1;
        break;
      case Direction.east:
        x += 1;
        break;
      case Direction.south:
        y -= 1;
        break;
      case Direction.west:
        x -= 1;
        break;
    }
  }

  // Process a single instruction
  void executeInstruction(String instruction) {
    switch (instruction) {
      case 'R':
        turnRight();
        break;
      case 'L':
        turnLeft();
        break;
      case 'A':
        advance();
        break;
    }
  }

  // Process a sequence of instructions
  void executeInstructions(String instructions) {
    for (var instruction in instructions.split('')) {
      executeInstruction(instruction);
    }
  }

  String getPosition() => "($x, $y)";
  String getFacing() => direction.name;
}

void main() {
  Robot robot = Robot(x: 7, y: 3);

  // Example instruction sequence
  const instructions = "RAALAL";

  // Process the instructions
  robot.executeInstructions(instructions);

  // Print the final position and direction
  print("Final position: ${robot.getPosition()}");
  print("Facing: ${robot.getFacing()}");
}
