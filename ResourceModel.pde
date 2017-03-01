// This submodel represents a resource. 
class ResourceModel {
  
  int quantity, pace, progress, progress_cost;
  ResourceModel[] ingredients;
  int[] ingredient_costs;
  boolean autobuy;
  
  ResourceModel(int q, int p, int pc, ResourceModel[] ings, int[] ing_costs, boolean ab) {
    quantity = q;
    pace = p;
    progress_cost = pc;
    ingredients = ings;
    ingredient_costs = ing_costs;
    autobuy = ab;
  }
  
  void tick() {
    progress += pace;
    if (autobuy && can_buy()) {
      buy();
    }
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