class BarGraphView {
  
  String label;
  float font_size;
  float y, label_x, data_x, bar_width, data_max;
  
  BarGraphView(String _label, float _font_size, float _label_x, float _data_x, float _bar_width, float _y, float _data_max) {
   label = _label;
   font_size = _font_size;
   label_x = _label_x;
   data_x = _data_x;
   bar_width = _bar_width;
   y = _y;
   data_max = _data_max;
  }
  
  void render(int value) {
    // label
    colorMode(RGB, 255);
    stroke(0);
    textSize(font_size);
    textAlign(LEFT, TOP);
    text(label, label_x, y);
    
    // Map the value from [0, data_max] to [0, bar_width]
    float data_width = constrain(map(value, 0, data_max, 0, bar_width), 0, bar_width);
    
    // bar graph
    fill(100);
    rect(data_x, y, bar_width, font_size);
    fill(0);
    rect(data_x, y, data_width, font_size);
  }
}