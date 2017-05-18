/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.io.Serializable;
import java.util.Date;


/**
 *
 * @author Mery Zúñiga
 */
public class ActaDonacion implements Serializable,Jsonable{
    private int idDonacion;
    private Date fecha;
    private String institucion;
    private Policia policia;
    private ActaDecomiso decomiso;
    private String detalles;

    public ActaDonacion(){
        
    }
    
    public ActaDonacion(int idDonacion, Date fecha, String institucion, Policia policia, ActaDecomiso decomiso, String detalles) {
        this.idDonacion = idDonacion;
        this.fecha = fecha;
        this.institucion = institucion;
        this.policia = policia;
        this.decomiso = decomiso;
        this.detalles = detalles;
    }

    public int getIdDonacion() {
        return idDonacion;
    }

    public Policia getPolicia() {
        return policia;
    }

    

    public String getInstitucion() {
        return institucion;
    }

    

    public ActaDecomiso getDecomiso() {
        return decomiso;
    }

    public void setIdDonacion(int idDonacion) {
        this.idDonacion = idDonacion;
    }

    public void setPolicia(Policia policia) {
        this.policia = policia;
    }

    

    public void setInstitucion(String institucion) {
        this.institucion = institucion;
    }


    public void setDecomiso(ActaDecomiso decomiso) {
        this.decomiso = decomiso;
    }
    
    public Date getFecha() {
        return fecha;
    }

    public void setFecha(Date fecha) {
        this.fecha = fecha;
    }

    public String getDetalles() {
        return detalles;
    }

    public void setDetalles(String detalles) {
        this.detalles = detalles;
    }
    
    
}
