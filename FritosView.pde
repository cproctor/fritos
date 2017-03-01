class FritosView {
  
  DataLabelView salt_view, corn_view, oil_view, fritos_view;
  ButtonView salt_worker_button, corn_worker_button, oil_button, fritos_button;
  
  FritosView() {
    salt_view          = new DataLabelView("Salt:",   24, 40, 120, 40);
    corn_view          = new DataLabelView("Corn:",   24, 40, 120, 70);
    oil_view           = new DataLabelView("Oil:",    24, 40, 120, 100);
    fritos_view        = new DataLabelView("Fritos:", 24, 40, 120, 130);
    
    salt_worker_button = new ButtonView("Hire a worker for the salt mine", 24, 180, 40);
    corn_worker_button = new ButtonView("Hire a worker for the corn field", 24, 180, 70);
    oil_button         = new ButtonView("Press corn oil", 24, 180, 100);
    fritos_button      = new ButtonView("Make Fritos!", 24, 180, 130);
  }
  
  void render(FritosModel model) {
    background(90);
    fill(0);

    salt_view.render(model.salt_quantity());
    corn_view.render(model.corn_quantity());
    oil_view.render(model.oil_quantity());
    fritos_view.render(model.fritos_quantity());
    salt_worker_button.render(model.can_hire_worker());
    corn_worker_button.render(model.can_hire_worker());
    oil_button.render(model.can_press_oil());
    fritos_button.render(model.can_make_fritos());
  }
  
  void handle_click() {
    if (salt_worker_button.mouse_over() && model.can_hire_worker()) {
      model.hire_salt_worker();
    }
    if (corn_worker_button.mouse_over() && model.can_hire_worker()) {
      model.hire_corn_worker();
    }
    if (oil_button.mouse_over() && model.can_press_oil()) {
      model.press_oil();
    }
    if (fritos_button.mouse_over() && model.can_make_fritos()) {
      model.make_fritos();
    }
  }
}