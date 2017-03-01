/*
  Fritos!
  a demonstration of how to use models and views 
*/

FritosModel model;
FritosView view;

void setup() {
  size(600, 400);
  model = new FritosModel();
  view = new FritosView(model);
}

void draw() {
  model.tick();
  view.render();
}

void mousePressed() {
   view.handle_click(); 
}