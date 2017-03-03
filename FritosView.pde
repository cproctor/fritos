class FritosView {
  
  BarGraphView salt_view, corn_view, oil_view, fritos_view;
  ButtonView salt_worker_button, corn_worker_button, oil_button, fritos_button;
  GraphView graph;
  
  FritosView() {
    float font_size = 24;
    float label_x = 40;
    float data_x = 120;
    float bar_width = 50;
    float resource_max = 60;
    
    salt_view          = new BarGraphView("Salt:",   font_size, label_x, data_x, bar_width, 40,  resource_max);
    corn_view          = new BarGraphView("Corn:",   font_size, label_x, data_x, bar_width, 70,  resource_max);
    oil_view           = new BarGraphView("Oil:",    font_size, label_x, data_x, bar_width, 100, resource_max);
    fritos_view        = new BarGraphView("Fritos:", font_size, label_x, data_x, bar_width, 130, resource_max);
    
    salt_worker_button = new ButtonView("Hire a worker for the salt mine", 24, 180, 40);
    corn_worker_button = new ButtonView("Hire a worker for the corn field", 24, 180, 70);
    oil_button         = new ButtonView("Press corn oil", 24, 180, 100);
    fritos_button      = new ButtonView("Make Fritos!", 24, 180, 130);
    
    graph = new GraphView(40, 160, 500, 200);
  }
  
  void render(FritosModel model) {
    colorMode(RGB, 255);
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
    graph.render(model.history());
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