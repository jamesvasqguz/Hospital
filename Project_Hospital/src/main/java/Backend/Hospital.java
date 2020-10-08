/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import java.util.ArrayList;
import javax.xml.bind.annotation.XmlElement;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author jara
 */
@XmlRootElement(name = "hospital")
public class Hospital {

    private String name;
    private ArrayList<Administrador> admin = new ArrayList();
    private ArrayList<Doctor> dc = new ArrayList();
    private ArrayList<Laboratorista> la = new ArrayList();
    private ArrayList<Paciente> pa = new ArrayList();
    private ArrayList<Consulta> con = new ArrayList();
    private ArrayList<Cita> ci = new ArrayList();
    private ArrayList<Examen> ex = new ArrayList();
    private ArrayList<Resultado> res = new ArrayList();
    private ArrayList<Informe> in = new ArrayList();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    @XmlElement(name = "admin")
    public ArrayList<Administrador> getAdmin() {
        return admin;
    }

    public void setAdmin(ArrayList<Administrador> admin) {
        this.admin = admin;
    }

    @XmlElement(name = "doctor")
    public ArrayList<Doctor> getDc() {
        return dc;
    }

    public void setDc(ArrayList<Doctor> dc) {
        this.dc = dc;
    }

    @XmlElement(name = "laboratorista")
    public ArrayList<Laboratorista> getLa() {
        return la;
    }

    public void setLa(ArrayList<Laboratorista> la) {
        this.la = la;
    }

    @XmlElement(name = "paciente")
    public ArrayList<Paciente> getPa() {
        return pa;
    }

    public void setPa(ArrayList<Paciente> pa) {
        this.pa = pa;
    }

    @XmlElement(name = "consulta")
    public ArrayList<Consulta> getCon() {
        return con;
    }

    public void setCon(ArrayList<Consulta> con) {
        this.con = con;
    }

    @XmlElement(name = "cita")
    public ArrayList<Cita> getCi() {
        return ci;
    }

    public void setCi(ArrayList<Cita> ci) {
        this.ci = ci;
    }

    @XmlElement(name = "examen")
    public ArrayList<Examen> getEx() {
        return ex;
    }

    public void setEx(ArrayList<Examen> ex) {
        this.ex = ex;
    }

    @XmlElement(name = "resultado")
    public ArrayList<Resultado> getRes() {
        return res;
    }

    public void setRes(ArrayList<Resultado> res) {
        this.res = res;
    }

    @XmlElement(name = "reporte")
    public ArrayList<Informe> getIn() {
        return in;
    }

    public void setIn(ArrayList<Informe> in) {
        this.in = in;
    }

}
