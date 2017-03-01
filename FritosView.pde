/*
  Fritos!
  a demonstration of how to use models and views 
*/
class FritosView {
  
  FritosModel model;
  
  FritosView(FritosModel m) {
     model = m;
  }
  
  void render() {
    background(90);
    fill(0);
    textSize(24);
    text("Salt:", 10, 40);
    text(model.salt, 100, 40);
    text("Corn:", 10, 70);
    text(model.corn, 100, 70);
    text("Oil:", 10, 100);
    text(model.oil, 100, 100);
    text("Fritos:", 10, 130);
    text(model.fritos, 100, 130);
    
    if (model.can_hire_worker()) {
      fill(0);
    } else {
      fill(70);
    }
    text("Hire a worker for the salt mine", 180, 40);
    text("Hire a worker for the corn field", 180, 70);
    
    if (model.can_press_oil()) {
      fill(0);
    } else {
      fill(70);
    }
    text("Press corn oil", 180, 100);
    
    if (model.can_make_fritos()) {
      fill(0);
    } else {
      fill(70);
    }
    text("Make Fritos!", 180, 130);
  }
  
  void handle_click() {
    if (mouseX >= 180 && mouseX <= 500) {
       if (mouseY > 25 && mouseY <= 55 && model.can_hire_worker()) {
         model.hire_salt_worker();
       }
       if (mouseY > 55 && mouseY <= 85 && model.can_hire_worker()) {
         model.hire_corn_worker();
       }
       if (mouseY > 85 && mouseY <= 115 && model.can_press_oil()) {
         model.press_oil();
       }
       if (mouseY > 115 && mouseY <= 145 && model.can_make_fritos()) {
         model.make_fritos();
       }
    }
  }
}