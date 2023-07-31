int cols, rows;
int w = 40; // Tamaño de cada celda
int[][] grid;
PVector start, end;
PVector current;
ArrayList<PVector> stack;

void setup() {
  size(400, 400);
  cols = width / w;
  rows = height / w;
  grid = new int[cols][rows];
  stack = new ArrayList<PVector>();
  initGrid();
  start = new PVector(0, 0);
  end = new PVector(cols - 1, rows - 1);
  current = start.get();
}

void draw() {
  background(255);
  drawGrid();
  drawPlayer();
  if (current.equals(end)) {
    displayWinMessage();
    fill(255, 255, 0);
    noStroke();
    ellipse(current.x * w + w / 2, current.y * w + w / 2, w * 0.8, w * 0.8);
  }
}

void initGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (i % 2 == 0 && j % 2 == 0) {
        grid[i][j] = 1; // Establecer líneas verticales y horizontales como bloqueadas
      } else {
        grid[i][j] = 0; // Todas las demás celdas son pasables inicialmente
      }
    }
  }
}

void drawGrid() {
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      if (grid[i][j] == 1) {
        fill(0); // Celda bloqueada (pared)
      } else {
        fill(255); // Celda libre
      }
      stroke(0);
      rect(i * w, j * w, w, w);
    }
  }
}

void drawPlayer() {
  fill(255, 255, 0); // Color amarillo
  noStroke();
  ellipse(current.x * w + w / 2, current.y * w + w / 2, w * 0.8, w * 0.8);
}

void displayWinMessage() {
  fill(0);
  textSize(40);
  textAlign(CENTER, CENTER);
  text("Ganaste!", width / 2, height / 2);
}

void keyPressed() {
  int x = round(current.x);
  int y = round(current.y);

  if (keyCode == UP && y > 0 && grid[x][y - 1] == 0) {
    current.y -= 1;
  } else if (keyCode == DOWN && y < rows - 1 && grid[x][y + 1] == 0) {
    current.y += 1;
  } else if (keyCode == LEFT && x > 0 && grid[x - 1][y] == 0) {
    current.x -= 1;
  } else if (keyCode == RIGHT && x < cols - 1 && grid[x + 1][y] == 0) {
    current.x += 1;
  }
}
