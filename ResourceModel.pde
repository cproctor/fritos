// This submodel represents a generalized resource. After initializing
// a resource, it can update itself with time ticks, check whether it can
// be purchased (costs may include progress as well as certain amounts of 
// other resources), and purchase. Additionally, autobuy can be set if 
// you want the resource to be purchased on any tick when it can be bought. 
// 

class ResourceModel {
  
  int quantity, pace, progress, progress_cost;
  ResourceModel[] ingredients;
  int[] ingredient_costs;
  boolean autobuy;
  FloatList history;
  
  ResourceModel(int q, int p, int pc, ResourceModel[] ings, int[] ing_costs, boolean ab) {
    quantity = q;
    pace = p;
    progress_cost = pc;
    ingredients = ings;
    ingredient_costs = ing_costs;
    autobuy = ab;
    history = new FloatList();
  }
  
  void tick() {
    progress += int(pow(1.4, pace));
    while (autobuy && can_buy()) {
      buy();
    }
    history.append(float(quantity));
  }
  
  boolean can_buy() {
    if (progress < progress_cost) {
      return false; 
    }
    for (int i=0; i< ingredient_costs.length; i++) {
      if (ingredients[i].quantity < ingredient_costs[i]) {
          return false;
      }
    }
    return true;
  }
  
  void buy() {
    quantity += 1;
    progress -= progress_cost;
    for (int i=0; i< ingredient_costs.length; i++) {
      ingredients[i].quantity -= ingredient_costs[i];
    }
  }
}