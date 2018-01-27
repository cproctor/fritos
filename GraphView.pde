// A view which graphs one or more series of data. 
// When rendered, requires an array of FloatLists, 
// each containing one series of data to graph. 

class GraphView {
  float x, y, graph_width, graph_height, font_size;
  float min_x = 10.0;
  float min_y = 10.0;
  float marker_radius = 4.0;
  String[] labels;
 
  GraphView(float _x, float _y, float _graph_width, float _graph_height, float _font_size, String[] _labels) {
    x = _x;
    y = _y; 
    graph_width = _graph_width;
    graph_height = _graph_height;
    font_size = _font_size;
    labels = _labels;
  }
 
  void render(FloatList[] data) {
    
    float mx = max_x(data);
    float my = max_y(data);
    
    for (int series=0; series < data.length; series++) {
      set_color(series, data.length);
      textSize(font_size);
      text(labels[series], x, y + font_size * series);
      for (int i=1; i < data[series].size(); i++) {
        float x_old = map(i-1, 0, mx, x, x + graph_width);
        float y_old = map(data[series].get(i-1), 0, my, y + graph_height, y);
        float x_new = map(i, 0, mx, x, x + graph_width);
        float y_new = map(data[series].get(i), 0, my, y + graph_height, y);
        
        line(x_old, y_old, x_new, y_new);
      }
    }
  }
 
  float max_x(FloatList[] data) {
    float mx = min_x;
    for (int series=0; series < data.length; series++) {
      if (data[series].size() > mx) {
        mx =  float(data[series].size());
      }
    }
    return mx;
  }
  
  float max_y(FloatList[] data) {
    float my = min_y;
    for (int series=0; series < data.length; series++) {
      for (int i=0; i < data[series].size(); i++) {
        if (data[series].get(i) > my) {
          my = data[series].get(i);
        }
      }
    }
    return my;
  }
  
  void set_color(int series, int seriesCount) {
    colorMode(HSB, 1.0);
    fill(float(series) / seriesCount, 0.8, 0.5);
    stroke(float(series) / seriesCount, 0.8, 0.5);
  }
}