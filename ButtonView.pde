// This subview represents a button. When rendering the button,
// the data is a boolean value reporting whether it should be shown as enabled. 
// The button can also report on whether the mouse is over it. 

class ButtonView {
  
  String label;
  float font_size;
  float x, y;
  
  ButtonView(String label_value, float font_size_value, float x_value, float y_value) {
   label = label_value;
   font_size = font_size_value;
   x = x_value;
   y = y_value;
  }
  
  void render(boolean is_enabled) {
    textSize(font_size);
    textAlign(LEFT, TOP);
    if (is_enabled) {
      fill(0);
    } else {
      fill(70);
    }
    text(label, x, y);
  }
  
  boolean mouse_over() {
    boolean in_bounds_x = x <= mouseX && mouseX <= x + textWidth(label);
    boolean in_bounds_y = y <= mouseY && mouseY <= y + font_size;
    return in_bounds_x && in_bounds_y;
  }
}