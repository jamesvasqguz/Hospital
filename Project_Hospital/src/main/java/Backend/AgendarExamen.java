/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import java.io.InputStream;

/**
 *
 * @author jara
 */
public class AgendarExamen {

    private int aE;
    private String examen;
    private int paciente;
    private String doctor;
    private String fecha;
    private InputStream inptArchivo;
    private byte[] archivo;

    public AgendarExamen(int aE, String examen, int paciente, String doctor, String fecha, byte[] archivo) {
        this.aE = aE;
        this.examen = examen;
        this.paciente = paciente;
        this.doctor = doctor;
        this.fecha = fecha;
        this.archivo = archivo;
    }

    public AgendarExamen() {
    }

    public String getDoctor() {
        return doctor;
    }

    public void setDoctor(String doctor) {
        this.doctor = doctor;
    }
    
    public int getaE() {
        return aE;
    }

    public void setaE(int aE) {
        this.aE = aE;
    }

    public String getExamen() {
        return examen;
    }

    public void setExamen(String examen) {
        this.examen = examen;
    }

    public int getPaciente() {
        return paciente;
    }

    public void setPaciente(int paciente) {
        this.paciente = paciente;
    }

    public String getFecha() {
        return fecha;
    }

    public void setFecha(String fecha) {
        this.fecha = fecha;
    }

    public InputStream getInptArchivo() {
        return inptArchivo;
    }

    public void setInptArchivo(InputStream inptArchivo) {
        this.inptArchivo = inptArchivo;
    }

    public byte[] getArchivo() {
        return archivo;
    }

    public void setArchivo(byte[] archivo) {
        this.archivo = archivo;
    }

}
