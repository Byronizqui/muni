/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.List;

/**
 *
 * @author Marco
 */
public class Contenedor implements Serializable,Jsonable{
    private List<Decomiso> items;

    public Contenedor() {
    }

    public Contenedor(List<Decomiso> items) {
        this.items = items;
    }

    public List<Decomiso> getItems() {
        return items;
    }

    public void setItems(List<Decomiso> items) {
        this.items = items;
    }
}
