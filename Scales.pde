/*
Amulya Mulakala
9/13/2024
Learn a workflow between a code IDE and GitHub to document and share computer programs. 
Design and iteratively develop programs that combine control structures, including nested loops and compound conditionals. 2-AP-12
*/

int Y_AXIS = 1; //global variables to help with gradient
int X_AXIS = 2;
color b1, b2, c1, c2;

void setup() {
    size(500, 500);  //canvas size
  
  //Defining colors
   b1 = color(255);
  b2 = color(0);
  c1 = color(204, 102, 0); //orange
  c2 = color(81, 110, 87); //green
  
  noLoop(); //stops the draw() function from repeating
}
void draw() {
 // Background gradient
  setGradient(0, 0, width/2, height, b1, b2, X_AXIS);  
  setGradient(width/2, 0, width/2, height, b2, b1, X_AXIS);
  // Foreground
  setGradient(0, 0, 500, 500, c1, c2, Y_AXIS); //impacts the size of gradient across canvas, got it to run across whole canvas
  setGradient(0, 0, 500, 500, c2, c1, X_AXIS);

        //loop for centered scales that start at (0,0)
for (int y = 0; y<501; y+=90) 
    { //vertical loop down the canvas
      for (int x = 0 ; x < 501 ; x+=120)
          { //horizontal loop across the canvas
              mainScale(x,y); //calls upon scale function defined later in program
                    }
                      }

for(int y2 = -45; y2<501; y2+=90) 
    { //loop for off centered scales but loops work the same way; scales start at (60,-45)
      for(int x2 = 60; x2<501; x2+=120) 
          {
             offScale(x2,y2);
                   }
                     }
}

void mainScale(int x, int y) { //x and y variables for main scale
  noFill();
  strokeWeight(2);
  stroke(0); //stroke of line color black

 beginShape(); //curve vertex/scale shape
curveVertex(x,y);
curveVertex(x,y);
curveVertex(x+60,y+45);
curveVertex(x,y+90);
curveVertex(x,y+90);
endShape();

}

void offScale (int x2, int y2){ //x and y variables for off centered scale
  noFill();
  
  beginShape(); //same shape but with different x and y coordinates
curveVertex(x2,y2);
curveVertex(x2,y2);
curveVertex(x2+60,y2+45);
curveVertex(x2,y2+90);
curveVertex(x2,y2+90);
endShape();
}


void setGradient(int x, int y, float w, float h, color c1, color c2, int axis ) { //function for gradient

  noFill();

  if (axis == X_AXIS) {  // Left to right gradient
    for (int i = x; i <= x+w; i++) { //for loop to create gradient
      float inter = map(i, x, x+w, 0, 1);
      color c = lerpColor(c1, c2, inter); //gradient between two colors, green to orange
      stroke(c);
      line(i, y, i, y+h);
    }
  }
}

  
