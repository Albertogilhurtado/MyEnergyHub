
package modelo;

import controllers.ControllerPersistencia;
import controllers.exceptions.NonexistentEntityException;
import java.util.List;

public class Controller {
    ControllerPersistencia controller = new ControllerPersistencia();
    
    public void createUser(User usu){
        controller.createUser(usu);
    }
    public User getUser(int id){
        return controller.getUserById(id);
    }
    public List<User> getUsers(){
        return controller.getClientes();
    }
    public void updateUser(User us) throws Exception{
        controller.updateUser(us);
    }
    public void deleteUser(int id) throws NonexistentEntityException{
        controller.deleteUser(id);
    }
    
    public void createHouse(House ho){
        controller.createHouse(ho);
    }
    public House getHouse(int id){
        return controller.getHouseById(id);
    }
    public List<House> getHouses(){
        return controller.getHouses();
    }
    public void updateHouse(House ho) throws Exception{
        controller.updateHouse(ho);
    }
    public void deleteHouse(int id) throws NonexistentEntityException{
        controller.deleteHouse(id);
    }
    
}


