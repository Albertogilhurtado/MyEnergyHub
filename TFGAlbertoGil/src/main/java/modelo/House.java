
package modelo;

import java.io.Serializable;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;

@Entity
public class House implements Serializable {
    
    @Id
    @GeneratedValue(strategy=GenerationType.AUTO)
    private int id;
    private int habitantes;
    private String nombre;
    private Double consumo;
    private Double ahorro;
    private int tamaño;
    private int numeroPaneles;
    private Double precioPanel;
    private int id_user;

    public House() {
    }
    
    public House(int id_user) {
        this.id_user = id_user;
        this.habitantes = 0;
        this.nombre= "";
        this.consumo = 0.0;
        this.ahorro = 0.0;
        this.tamaño = 0;
        this.numeroPaneles = 0;
        this.precioPanel = 0.0;
    }

    public House(int habitantes, String nombre, Double consumo, Double ahorro, int tamaño, int numeroPaneles, Double precioPanel, int id_user) {
        this.habitantes = habitantes;
        this.nombre = nombre;
        this.consumo = consumo;
        this.ahorro = ahorro;
        this.tamaño = tamaño;
        this.numeroPaneles = numeroPaneles;
        this.precioPanel = precioPanel;
        this.id_user = id_user;
    }

    public House(int id, int habitantes, String nombre, Double consumo, Double ahorro, int tamaño, int numeroPaneles, Double precioPanel, int id_user) {
        this.id = id;
        this.habitantes = habitantes;
        this.nombre = nombre;
        this.consumo = consumo;
        this.ahorro = ahorro;
        this.tamaño = tamaño;
        this.numeroPaneles = numeroPaneles;
        this.precioPanel = precioPanel;
        this.id_user = id_user;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getHabitantes() {
        return habitantes;
    }

    public void setHabitantes(int habitantes) {
        this.habitantes = habitantes;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public Double getConsumo() {
        return consumo;
    }

    public void setConsumo(Double consumo) {
        this.consumo = consumo;
    }

    public Double getAhorro() {
        return ahorro;
    }

    public void setAhorro(Double ahorro) {
        this.ahorro = ahorro;
    }

    public int getTamaño() {
        return tamaño;
    }

    public void setTamaño(int tamaño) {
        this.tamaño = tamaño;
    }

    public int getNumeroPaneles() {
        return numeroPaneles;
    }

    public void setNumeroPaneles(int numeroPaneles) {
        this.numeroPaneles = numeroPaneles;
    }

    public double getPrecioPanel() {
        return precioPanel;
    }

    public void setPrecioPanel(Double precioPanel) {
        this.precioPanel = precioPanel;
    }

    public int getId_user() {
        return id_user;
    }

    public void setId_user(int id_user) {
        this.id_user = id_user;
    }
    
       
    
    
    
}
