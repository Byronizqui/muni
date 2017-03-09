/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;

/**
 *
 * @author Marco
 */
public class Decomiso implements Serializable, Jsonable{
    private int idDecomiso;
    private String categoria;
    private int cantidad;
    private String observaciones;

    public Decomiso() {
    }

    public Decomiso(int idDecomiso, String categoria, int cantidad, String observaciones) {
        this.idDecomiso = idDecomiso;
        this.categoria = categoria;
        this.cantidad = cantidad;
        this.observaciones = observaciones;
    }

    public int getIdDecomiso() {
        return idDecomiso;
    }

    public void setIdDecomiso(int idDecomiso) {
        this.idDecomiso = idDecomiso;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
    
    
}
