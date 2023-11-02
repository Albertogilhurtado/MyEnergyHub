
package controllers;

import controllers.exceptions.NonexistentEntityException;
import java.util.List;
import modelo.House;
import modelo.User;


public class ControllerPersistencia {
    
   UserJpaController umjc = new UserJpaController();
   HouseJpaController hjc = new HouseJpaController();
   
   public void createUser(User us){
        umjc.create(us);
   }

   public User getUserById(int id){
       return umjc.findUser(id);
   }
   
   public List<User> getClientes(){
       return umjc.findUserEntities();
   }
   
   public void deleteUser(int id) throws NonexistentEntityException{
       umjc.destroy(id);
   }
   
   public void updateUser(User us) throws Exception{
       umjc.edit(us);
   }
   
   public void createHouse(House ho){
        hjc.create(ho);
   }

   public House getHouseById(int id){
       return hjc.findHouse(id);
   }
   
   public List<House> getHouses(){
       return hjc.findHouseEntities();
   }
   
   public void deleteHouse(int id) throws NonexistentEntityException{
       hjc.destroy(id);
   }
   
   public void updateHouse(House ho) throws Exception{
       hjc.edit(ho);
   }

}
