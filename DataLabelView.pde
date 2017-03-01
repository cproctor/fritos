// This subview represents a horizontally-aligned integer value with a label.
// When rendering it must be passed the value. 

class DataLabelView {
  
  String label;
  float font_size;
  float y, label_x, data_x;
  
  DataLabelView(String label_value, float font_size_value, float label_x_value, float data_x_value, float y_value) {
   label = label_value;
   font_size = font_size_value;
   label_x = label_x_value;
   data_x = data_x_value;
   y = y_value;
  }
  
  void render(int value) {
    textSize(font_size);
    textAlign(LEFT, TOP);
    text(label, label_x, y);
    text(value, data_x, y);
  }
}