/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Mery Zúñiga
 */
public class ActaDevolucion implements Serializable,Jsonable{
    private int idDevolucion;
    private Policia policia;
    private ActaDecomiso decomiso;
    private Interesado interesado;
    private Date fecha;
    
    
    public ActaDevolucion(){
        
    }

    public ActaDevolucion(int idDevolucion, Policia policia, ActaDecomiso decomiso, Interesado interesado, Date fecha) {
        this.idDevolucion = idDevolucion;
        this.policia = policia;
        this.decomiso = decomiso;
        this.interesado = interesado;
        this.fecha = fecha;
    }

    public int getIdDevolucion() {
        return idDevolucion;
    }

    public Policia getPolicia() {
        return policia;
    }

    public ActaDecomiso getDecomiso() {
        return decomiso;
    }

    public Interesado getInteresado() {
        return interesado;
    }

    public Date getFecha() {
        return fecha;
    }

    public void setIdDevolucion(int idDevolucion) {
        this.idDevolucion = idDevolucion;
    }

    public void setPolicia(Policia policia) {
        this.policia = policia;
    }

    public void setDecomiso(ActaDecomiso decomiso) {
        this.decomiso = decomiso;
    }

    public void setInteresado(Interesado interesado) {
        this.interesado = interesado;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }
    
    
}
