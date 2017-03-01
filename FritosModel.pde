/*
  Fritos!
  Now the model relies on a submodel called a ResourceModel--we noticed that 
  the same patterns were being used for salt, corn, and oil, so why not create 
  a general ResourceModel which can keep track of each? 
*/

class FritosModel {
  
  ResourceModel salt, corn, oil, fritos, salt_workers, corn_workers;
  
  FritosModel() {
    salt         = new ResourceModel(0, 1, 150, new ResourceModel[]{},                new int[]{},         true);
    corn         = new ResourceModel(0, 1, 8,   new ResourceModel[]{},                new int[]{},         true);
    oil          = new ResourceModel(0, 0, 0,   new ResourceModel[]{corn},            new int[]{10},       false);
    fritos       = new ResourceModel(0, 0, 0,   new ResourceModel[]{salt, corn, oil}, new int[]{1, 10, 2}, true);
    salt_workers = new ResourceModel(1, 0, 0,   new ResourceModel[]{fritos},          new int[]{5},        false);
    corn_workers = new ResourceModel(1, 0, 0,   new ResourceModel[]{fritos},          new int[]{5},        false);
  }
  
  // Are these really necessary? Couldn't the view just call model.salt.quantity? 
  // Yes, certainly. This layer of indirection is a slightly better practice 
  // because then you can freely change how the model works without needing to 
  // make changes to the view. This encapsulation is what keeps your code bug-free.
  int salt_quantity()       { return salt.quantity;          }
  int corn_quantity()       { return corn.quantity;          }
  int oil_quantity()        { return oil.quantity;           }
  int fritos_quantity()     { return fritos.quantity;        }
  boolean can_hire_worker() { return salt_workers.can_buy(); }
  boolean can_press_oil()   { return oil.can_buy();          }
  boolean can_make_fritos() { return fritos.can_buy();       }
  void press_oil()          { oil.buy();                     }
  void make_fritos()        { fritos.buy();                  }  

  void hire_salt_worker() {
    salt_workers.buy();
    salt.pace += 1;
  }
  
  void hire_corn_worker() {
    corn_workers.buy();
    corn.pace += 1;
  }
  
  void tick() {
    salt.tick();
    corn.tick(); 
    oil.tick(); 
    fritos.tick(); 
    salt_workers.tick(); 
    corn_workers.tick();
    
    // Let's save your keyboard some wear and tear.
    oil.autobuy = corn.quantity > 100;
  }
}