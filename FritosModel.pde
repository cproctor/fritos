/*
  Fritos!
  a demonstration of how to use models and views
*/

class FritosModel {
  // Settings (stay constant while the program runs)
  int salt_cost = 150;
  int corn_cost = 8;
  int oil_corn_cost = 10;
  int worker_fritos_cost = 5;
  int fritos_salt_cost = 1;
  int fritos_corn_cost = 10;
  int fritos_oil_cost = 2;
  
  // Variables
  int salt = 0;
  int corn = 0;
  int oil = 0; 
  int fritos = 0; 
  
  int salt_progress = 0;
  int corn_progress = 0;
  
  int salt_workers = 1;
  int corn_workers = 1;
  
  // Interface. This is how the view will interact with the model.
  boolean can_hire_worker() {
    return fritos >= worker_fritos_cost;
  }
  
  boolean can_press_oil() {
    return  corn >= oil_corn_cost;
  }
  
  boolean can_make_fritos() {
    return salt >= fritos_salt_cost && corn >= fritos_corn_cost && oil >= fritos_oil_cost;
  }
  
  void hire_salt_worker() {
    salt_workers += 1;
    fritos -= worker_fritos_cost;
  }
  
  void hire_corn_worker() {
    corn_workers += 1;
    fritos -= worker_fritos_cost;
  }
  
  void press_oil() {
    oil += 1;
    corn -= oil_corn_cost;
  }

  void make_fritos() {
    fritos += 1;
    salt -= fritos_salt_cost;
    corn -= fritos_corn_cost;
    oil -= fritos_oil_cost;
  }  
  
  void tick() {
    salt_progress += salt_workers;
    while (salt_progress >= salt_cost) {
      salt += 1;
      salt_progress -= salt_cost;
    }
    
    corn_progress += corn_workers;
    while (corn_progress >= corn_cost) {
      corn += 1;
      corn_progress -= corn_cost;
    }
  }
}


// Run!