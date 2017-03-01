/*
  Fritos!
  a demonstration of how to use models and views
*/

class FritosModel {
  
  ResourceModel salt, corn, oil, fritos, salt_workers, corn_workers;
  
  FritosModel() {
    salt         = new ResourceModel(0, 1, 150, new ResourceModel[]{},                new int[]{},         true);
    corn         = new ResourceModel(0, 1, 8,   new ResourceModel[]{},                new int[]{},         true);
    oil          = new ResourceModel(0, 0, 0,   new ResourceModel[]{corn},            new int[]{10},       false);
    fritos       = new ResourceModel(0, 0, 0,   new ResourceModel[]{salt, corn, oil}, new int[]{1, 10, 5}, false);
    salt_workers = new ResourceModel(1, 0, 0,   new ResourceModel[]{fritos},          new int[]{5},        false);
    corn_workers = new ResourceModel(1, 0, 0,   new ResourceModel[]{fritos},          new int[]{5},        false);
  }
  
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
    
    oil.autobuy = corn.quantity > 200;
  }
}