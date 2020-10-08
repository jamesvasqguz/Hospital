/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Backend;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.sql.Connection;
import java.sql.Date;
import static java.sql.JDBCType.NULL;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Time;
import java.util.ArrayList;

/**
 *
 * @author jara
 */
public class GestorDB {

    private Connection cn = null;
    private Statement s = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    EnviarCorreo ec = new EnviarCorreo();

    public boolean insertA(String codigo, String dpi, String nombre, String pass) {
        String rol = "ADMINISTRADOR";
        String sql = "INSERT INTO ADMINISTRADOR VALUES(?,?,?);";
        String sql1 = "INSERT INTO USUARIO VALUES(?,?,?,?);";
        cn = conexionDB.conector();
        try {
            ps = cn.prepareStatement(sql);
            ps.setString(1, codigo);
            ps.setString(2, dpi);
            ps.setString(3, nombre);
            ps.executeUpdate();
            try {
                ps=cn.prepareStatement(sql1);
                ps.setString(1, codigo);
                ps.setString(2, nombre);
                ps.setString(3, rol);
                ps.setString(4, pass);
                ps.executeUpdate();
                return true;
            } catch (SQLException ex) {
            System.out.println("Error al ingresar al usuario administrador: " + ex);
            return false;    
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al administrador: " + e);
            return false;
        }
    }

    public boolean insertP(String nombre, String sexo, String fecha, String dpi, String telefono, double peso, String sangre, String correo) {
        int resultUpdate = 0;
        try {
            cn = conexionDB.conector();
            s = cn.createStatement();
            resultUpdate = s.executeUpdate("INSERT INTO PACIENTE VALUES(" + 0 + ",'" + nombre + "','" + sexo + "','" + fecha + "','" + dpi + "','" + telefono + "'," + peso + ",'" + sangre + "','" + correo + "');");
            if (resultUpdate != 0) {
                conexionDB.cerrar();
                return true;
            } else {
                conexionDB.cerrar();
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al paciente: " + e);
            e.printStackTrace();
            return false;
        }
    }

    public String selectIP(String name, String pass) {
        String id = "";
        String rol = "PACIENTE";
        String sql = "SELECT id_paciente FROM PACIENTE WHERE nombre='" + name + "';";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                id = String.valueOf(rs.getInt("id_paciente"));
                String sql1 = "INSERT INTO USUARIO VALUES(" + id + ",'" + name + "','" + rol + "','" + pass + "');";
                ps = cn.prepareStatement(sql1);
                ps.executeUpdate();
            } else {
                id = "";
                conexionDB.cerrar();
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al paciente: " + e);
        }
        return id;
    }

    public boolean insertD(String codigo, String nombre, String colegiado, String dpi, String telefono, String correo, String horario1, String horario2, String fechaI) {
        int resultUpdate = 0;
        try {
            cn = conexionDB.conector();
            s = cn.createStatement();
            resultUpdate = s.executeUpdate("INSERT INTO DOCTOR VALUES('" + codigo + "','" + nombre + "','" + colegiado + "','" + dpi + "','" + telefono + "','" + correo + "','" + horario1 + "','" + horario2 + "','" + fechaI + "');");
            if (resultUpdate != 0) {
                conexionDB.cerrar();
                return true;
            } else {
                conexionDB.cerrar();
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al Doctor: " + e);
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertUD(String id, String name, String pass) {
        String rol = "DOCTOR";
        String sql = "SELECT * FROM USUARIO WHERE id_user='" + id + "';";
        String sql1 = "INSERT INTO USUARIO VALUES('" + id + "','" + name + "','" + rol + "','" + pass + "');";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                conexionDB.cerrar();
                return false;
            } else {
                ps = cn.prepareStatement(sql1);
                ps.executeUpdate();
                conexionDB.cerrar();
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al paciente: " + e);
            return false;
        }
    }

    public boolean insertDESP(String id, String especialidades) {
        String linea = especialidades.trim();
        String[] arreglo;
        arreglo = linea.split(",");
        try {
            cn = conexionDB.conector();
            for (int i = 0; i < arreglo.length; i++) {
                String sql = "INSERT INTO ESPECIALIDAD VALUES(" + 0 + ",'" + id + "','" + arreglo[i].toLowerCase().trim() + "');";
                ps = cn.prepareStatement(sql);
                ps.executeUpdate();
            }
            return true;
        } catch (SQLException e) {
            System.out.println("Error al ingresar al paciente: " + e);
            return false;
        }
    }

    public boolean insertNEXAMEN(String codigo, String nombre, boolean orden, String desc, double costo, String informe) {
        String sql = "SELECT * FROM EXAMEN WHERE id_examen='" + codigo + "';";
        String sql1 = "INSERT INTO EXAMEN VALUES('" + codigo + "','" + nombre + "'," + orden + ",'" + desc + "'," + costo + ",'" + informe + "');";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                conexionDB.cerrar();
                return false;
            } else {
                ps = cn.prepareStatement(sql1);
                ps.executeUpdate();
                conexionDB.cerrar();
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al paciente: " + e);
            return false;
        }
    }

    public boolean insertL(String codigo, String nombre, String registro, String dpi, String telefono, String examen, String correo, String fechaI) {
        String sql = "SELECT * FROM LABORATORISTA WHERE id_labo='" + codigo + "'";
        String sql1 = "INSERT INTO LABORATORISTA VALUES('" + codigo + "','" + nombre + "','" + registro + "','" + dpi + "','" + telefono + "','" + examen + "','" + correo + "','" + fechaI + "');";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                conexionDB.cerrar();
                return false;
            } else {
                ps = cn.prepareStatement(sql1);
                ps.executeUpdate();
                conexionDB.cerrar();
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al Doctor: " + e);
            e.printStackTrace();
            return false;
        }
    }

    public boolean insertUL(String id, String name, String pass) {
        String rol = "LABORATORISTA";
        String sql = "SELECT * FROM USUARIO WHERE id_user='" + id + "';";
        String sql1 = "INSERT INTO USUARIO VALUES('" + id + "','" + name + "','" + rol + "','" + pass + "');";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                conexionDB.cerrar();
                return false;
            } else {
                ps = cn.prepareStatement(sql1);
                ps.executeUpdate();
                conexionDB.cerrar();
                return true;
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al paciente: " + e);
            return false;
        }
    }

    public void insertDL(String id, String dias) {
        try {
            cn = conexionDB.conector();
            String sql = "INSERT INTO DIAS_LABORATORISTA VALUES(" + 0 + ",'" + id + "','" + dias + "');";
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();
        } catch (SQLException e) {
            System.out.println("Error al ingresar al paciente: " + e);
        }
    }

    public boolean editEXAMEN(String codigo, String nombre, boolean orden, String desc, double costo, String informe) {
        String sql = "UPDATE EXAMEN SET nombre='" + nombre + "',orden=" + orden + ",descripcion='" + desc + "',costo=" + costo + ",tipo_informe='" + informe + "' WHERE id_examen='" + codigo + "';";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.executeUpdate();
            conexionDB.cerrar();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al ingresar al paciente: " + e);
            return false;
        }
    }

    public boolean insertCONS(String espe, double cost) {
        Consulta cna = new Consulta(espe, cost);
        try {
            cn = conexionDB.conector();
            String sql = "INSERT INTO CONSULTA VALUES(?,?);";
            ps = cn.prepareStatement(sql);
            ps.setString(1, cna.getEspecialidad());
            ps.setDouble(2, cna.getCosto());
            ps.executeUpdate();
            conexionDB.cerrar();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al ingresar al consulta: " + e);
            conexionDB.cerrar();
            return false;
        }
    }

    public boolean editCONS(String espe, double cost) {
        Consulta cna = new Consulta(espe, cost);
        try {
            cn = conexionDB.conector();
            String sql = "UPDATE CONSULTA SET costo=? WHERE especialidad=?;";
            ps = cn.prepareStatement(sql);
            ps.setDouble(1, cna.getCosto());
            ps.setString(2, cna.getEspecialidad());
            ps.executeUpdate();
            conexionDB.cerrar();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al editar consulta: " + e);
            conexionDB.cerrar();
            return false;
        }
    }

    public boolean insertCITA(int id, String doc, String espe, String fecha, String hora) {
        Cita ct = new Cita(0, id, doc, espe, fecha, hora);
        String sql = "SELECT D.id_doctor, E.tipo_especialidad FROM DOCTOR D INNER JOIN ESPECIALIDAD E ON D.id_doctor='" + doc + "' AND E.tipo_especialidad='" + espe + "';";
        String sql1 = "INSERT INTO CITA VALUES(?,?,?,?,?,?);";
        String sql2 = "SELECT * FROM DOCTOR WHERE id_doctor='" + doc + "' AND '" + hora + "' BETWEEN hora_inicio AND hora_fin;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            if (rs.next()) {
                ps = cn.prepareStatement(sql2);
                rs = ps.executeQuery();
                if (rs.next()) {
                    ps = cn.prepareStatement(sql1);
                    ps.setInt(1, 0);
                    ps.setInt(2, ct.getPaciente());
                    ps.setString(3, ct.getMedico());
                    ps.setString(4, ct.getEspecialidad());
                    ps.setString(5, ct.getFecha());
                    ps.setString(6, ct.getHora());
                    ps.executeUpdate();
                    conexionDB.cerrar();
                    return true;
                } else {
                    System.out.println("La hora ingresada no esta en el rango de atencion del doctor");
                    conexionDB.cerrar();
                    return false;
                }
            } else {
                System.out.println("El doctor y la especialidad estan mal");
                conexionDB.cerrar();
                return false;
            }
        } catch (SQLException e) {
            System.out.println("Error al ingresar al CITA: " + e);
            return false;
        }
    }

    public boolean insertAEXAMEN(String exam, int pac, String fecha) throws FileNotFoundException {
        boolean orden = false;
        String sql = "SELECT orden FROM EXAMEN WHERE id_examen=?;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setString(1, exam);
            rs = ps.executeQuery();
            if (rs.next()) {
                orden = rs.getBoolean("orden");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el boolean del examen");
        }
        FileInputStream input = null;
        String sql1 = "INSERT INTO AGENDAR_EXAMEN (id_agex,id_exam,id_pcnt,fecha,requiere)VALUES(?,?,?,?,?);";
        String sql2 = "INSERT INTO AGENDAR_EXAMEN (id_agex,id_exam,id_pcnt,fecha) VALUES(?,?,?,?);";
        File pdf = new File(getClass().getResource("/ORDEN.pdf").getFile());
        input = new FileInputStream(pdf);
        try {
            cn = conexionDB.conector();
            if (orden) {
                ps = cn.prepareStatement(sql1);
                ps.setInt(1, 0);
                ps.setString(2, exam);
                ps.setInt(3, pac);
                ps.setString(4, fecha);
                ps.setBlob(5, input);
                ps.executeUpdate();
                conexionDB.cerrar();
                return true;
            } else {
                ps = cn.prepareStatement(sql2);
                ps.setInt(1, 0);
                ps.setString(2, exam);
                ps.setInt(3, pac);
                ps.setString(4, fecha);
                ps.executeUpdate();
                conexionDB.cerrar();
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error al editar consulta: " + e);
            conexionDB.cerrar();
            return false;
        }
    }

    public ArrayList<AgendarExamen> listarEXAM(String id) {
        int idp = Integer.parseInt(id);
        ArrayList<AgendarExamen> list = new ArrayList<AgendarExamen>();
        String sql = "SELECT * FROM AGENDAR_EXAMEN WHERE id_pcnt=? ORDER BY fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idp);
            rs = ps.executeQuery();
            while (rs.next()) {
                AgendarExamen ae = new AgendarExamen();
                ae.setaE(rs.getInt("id_agex"));
                ae.setExamen(rs.getString("id_exam"));
                ae.setDoctor(rs.getString("id_dctr"));
                ae.setPaciente(rs.getInt("id_pcnt"));
                ae.setFecha(rs.getString("fecha"));
                ae.setArchivo(rs.getBytes("requiere"));
                list.add(ae);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public ArrayList<Cita> listarCITA(String id) {
        int idp = Integer.parseInt(id);
        ArrayList<Cita> list = new ArrayList<Cita>();
        String sql = "SELECT * FROM CITA WHERE id_pacnt=? ORDER BY fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idp);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita c = new Cita();
                c.setId(rs.getInt("id_cita"));
                c.setPaciente(rs.getInt("id_pacnt"));
                c.setMedico(rs.getString("id_doc"));
                c.setEspecialidad(rs.getString("especialidad"));
                c.setFecha(rs.getString("fecha"));
                c.setHora(rs.getString("hora"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public ArrayList<Cita> listarCITADOCTOR(String id) {
        ArrayList<Cita> list = new ArrayList<Cita>();
        String sql = "SELECT * FROM CITA WHERE id_doc=? ORDER BY fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita c = new Cita();
                c.setId(rs.getInt("id_cita"));
                c.setPaciente(rs.getInt("id_pacnt"));
                c.setMedico(rs.getString("id_doc"));
                c.setEspecialidad(rs.getString("especialidad"));
                c.setFecha(rs.getString("fecha"));
                c.setHora(rs.getString("hora"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    /*
    public ArrayList<Cita> listarCITASHOY() {
        ArrayList<Cita> list = new ArrayList<Cita>();
        String sql = "SELECT * FROM CITA WHERE fecha=curdate() ORDER BY hora ASC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idp);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita c = new Cita();
                c.setId(rs.getInt("id_cita"));
                c.setPaciente(rs.getInt("id_pacnt"));
                c.setMedico(rs.getString("id_doc"));
                c.setEspecialidad(rs.getString("especialidad"));
                c.setFecha(rs.getString("fecha"));
                c.setHora(rs.getString("hora"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }*/
    public boolean insertINFORME(int paciente, String doc, String info, String fecha, String hora) {
        Informe i = new Informe(0, paciente, doc, info, fecha, hora);
        String sql = "INSERT INTO INFORME VALUES(?,?,?,?,?,?);";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, i.getIdInfo());
            ps.setInt(2, i.getPacInfo());
            ps.setString(3, i.getDocInfo());
            ps.setString(4, i.getInforme());
            ps.setString(5, i.getFechaInfo());
            ps.setString(6, i.getHoraInfo());
            ps.executeUpdate();
            conexionDB.cerrar();
            return true;
        } catch (Exception e) {
            System.out.println("Error al editar consulta: " + e);
            conexionDB.cerrar();
            return false;
        }
    }

    public boolean insertAEXAMD(String exam, String doc, int pac, String fecha) throws FileNotFoundException {
        boolean orden = false;
        String sql = "SELECT orden FROM EXAMEN WHERE id_examen=?;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setString(1, exam);
            rs = ps.executeQuery();
            if (rs.next()) {
                orden = rs.getBoolean("orden");
            }
        } catch (SQLException e) {
            System.out.println("Error al obtener el boolean del examen");
        }
        FileInputStream input = null;
        String sql1 = "INSERT INTO AGENDAR_EXAMEN (id_agex,id_exam,id_dctr,id_pcnt,fecha,requiere)VALUES(?,?,?,?,?);";
        String sql2 = "INSERT INTO AGENDAR_EXAMEN (id_agex,id_exam,id_dctr,id_pcnt,fecha) VALUES(?,?,?,?);";
        File pdf = new File(getClass().getResource("/ORDEN.pdf").getFile());
        input = new FileInputStream(pdf);
        try {
            cn = conexionDB.conector();
            if (orden) {
                ps = cn.prepareStatement(sql1);
                ps.setInt(1, 0);
                ps.setString(2, exam);
                ps.setString(3, doc);
                ps.setInt(4, pac);
                ps.setString(5, fecha);
                ps.setBlob(6, input);
                ps.executeUpdate();
                conexionDB.cerrar();
                return true;
            } else {
                ps = cn.prepareStatement(sql2);
                ps.setInt(1, 0);
                ps.setString(2, exam);
                ps.setString(3, doc);
                ps.setInt(4, pac);
                ps.setString(5, fecha);
                ps.executeUpdate();
                conexionDB.cerrar();
                return true;
            }
        } catch (Exception e) {
            System.out.println("Error al editar consulta: " + e);
            conexionDB.cerrar();
            return false;
        }
    }

    public ArrayList<AgendarExamen> listarEXAMLAB(String exm) {
        ArrayList<AgendarExamen> list = new ArrayList<AgendarExamen>();
        String sql = "SELECT A.id_agex,A.id_exam,A.id_dctr,A.id_pcnt,A.fecha,A.requiere FROM AGENDAR_EXAMEN A LEFT JOIN RESULTADO R ON (A.id_agex=R.id_agex) WHERE (R.id_agex is null) AND A.fecha=curdate() AND A.id_exam='" + exm + "' ORDER BY A.fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                AgendarExamen ae = new AgendarExamen();
                ae.setaE(rs.getInt("id_agex"));
                ae.setExamen(rs.getString("id_exam"));
                ae.setDoctor(rs.getString("id_dctr"));
                ae.setPaciente(rs.getInt("id_pcnt"));
                ae.setFecha(rs.getString("fecha"));
                ae.setArchivo(rs.getBytes("requiere"));
                list.add(ae);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {
            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public boolean insertResult(int agex, int paciente, String doc, String exam, String lab, String orden, String file, String fecha, String hora) throws FileNotFoundException {
        String sql1 = "SELECT correo FROM PACIENTE WHERE id_paciente=?;";
        String correo;
        String msj = "Su examen de laboratorio ha sido realizado pasar por el!";
        String asnt = "Resultado de Examen";
        FileInputStream input = null;
        File fl = null;
        String sql = "INSERT INTO RESULTADO (id_resultado,id_agex,id_paciente,id_medico,id_examen,id_laboratorista,orden,informe,fecha,hora) VALUES(?,?,?,?,?,?,?,?,?,?);";
        switch (file) {
            case ".jpg":
                fl = new File(getClass().getResource("/ORDEN.jpg").getFile());
                break;
            case ".png":
                fl = new File(getClass().getResource("/hospital.png").getFile());
                break;
            case ".gif":
                fl = new File(getClass().getResource("/Trabajador.gif").getFile());
                break;
            case ".pdf":
                fl = new File(getClass().getResource("/ORDEN.pdf").getFile());
                break;
            default:
                System.out.println("No hay!");
                break;
        }
        input = new FileInputStream(fl);
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, 0);
            ps.setInt(2, agex);
            ps.setInt(3, paciente);
            ps.setString(4, doc);
            ps.setString(5, exam);
            ps.setString(6, lab);
            ps.setString(7, orden);
            ps.setBlob(8, input);
            ps.setString(9, fecha);
            ps.setString(10, hora);
            ps.executeUpdate();
            try {
                ps = cn.prepareStatement(sql1);
                ps.setInt(1, paciente);
                rs = ps.executeQuery();
                if (rs.next()) {
                    correo = rs.getString("correo");
                    ec.Email(correo, msj, asnt);
                }
            } catch (SQLException e) {
            }
            conexionDB.cerrar();
            return true;
        } catch (SQLException e) {
            System.out.println("Error al insertar resultado: " + e);
            conexionDB.cerrar();
            return false;
        }
    }

    public ArrayList<Informe> listarRESULT(String id) {
        int idp = Integer.parseInt(id);
        ArrayList<Informe> list = new ArrayList<Informe>();
        String sql = "SELECT * FROM INFORME WHERE id_pac=? ORDER BY fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idp);
            rs = ps.executeQuery();
            while (rs.next()) {
                Informe i = new Informe();
                i.setIdInfo(rs.getInt("id_informe"));
                i.setPacInfo(rs.getInt("id_pac"));
                i.setDocInfo(rs.getString("id_dct"));
                i.setInforme(rs.getString("info"));
                i.setFechaInfo(rs.getString("fecha"));
                i.setHoraInfo(rs.getString("hora"));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtner results: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {
            System.out.println("Error alobtener results: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public ArrayList<Resultado> listarEXAMREALIZADO(String id) {
        int idp = Integer.parseInt(id);
        ArrayList<Resultado> list = new ArrayList<Resultado>();
        String sql = "SELECT * FROM RESULTADO WHERE id_paciente=? ORDER BY fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idp);
            rs = ps.executeQuery();
            while (rs.next()) {
                Resultado r = new Resultado();
                r.setIdRslt(rs.getInt("id_resultado"));
                r.setIdAgex(rs.getInt("id_agex"));
                r.setPacRslt(rs.getInt("id_paciente"));
                r.setDocRslt(rs.getString("id_medico"));
                r.setExamRslt(rs.getString("id_examen"));
                r.setLabRslt(rs.getString("id_laboratorista"));
                r.setOrdenRslt(rs.getString("orden"));
                r.setArchivo(rs.getBytes("informe"));
                r.setFechaRslt(rs.getString("fecha"));
                r.setHoraRslt(rs.getString("hora"));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public ArrayList<Informe> listarRESULTD() {
        ArrayList<Informe> list = new ArrayList<Informe>();
        String sql = "SELECT * FROM INFORME ORDER BY fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Informe i = new Informe();
                i.setIdInfo(rs.getInt("id_informe"));
                i.setPacInfo(rs.getInt("id_pac"));
                i.setDocInfo(rs.getString("id_dct"));
                i.setInforme(rs.getString("info"));
                i.setFechaInfo(rs.getString("fecha"));
                i.setHoraInfo(rs.getString("hora"));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtner results: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {
            System.out.println("Error alobtener results: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public ArrayList<Resultado> listarEXAMREALIZADOCTOR() {
        ArrayList<Resultado> list = new ArrayList<Resultado>();
        String sql = "SELECT * FROM RESULTADO ORDER BY fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Resultado r = new Resultado();
                r.setIdRslt(rs.getInt("id_resultado"));
                r.setIdAgex(rs.getInt("id_agex"));
                r.setPacRslt(rs.getInt("id_paciente"));
                r.setDocRslt(rs.getString("id_medico"));
                r.setExamRslt(rs.getString("id_examen"));
                r.setLabRslt(rs.getString("id_laboratorista"));
                r.setOrdenRslt(rs.getString("orden"));
                r.setArchivo(rs.getBytes("informe"));
                r.setFechaRslt(rs.getString("fecha"));
                r.setHoraRslt(rs.getString("hora"));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public ArrayList<Resultado> listarEXAMREALIZADOR(String id) {
        int idp = Integer.parseInt(id);
        ArrayList<Resultado> list = new ArrayList<Resultado>();
        String sql = "SELECT distinct * FROM RESULTADO WHERE id_paciente=? ORDER BY fecha DESC LIMIT 5;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idp);
            rs = ps.executeQuery();
            while (rs.next()) {
                Resultado r = new Resultado();
                r.setIdRslt(rs.getInt("id_resultado"));
                r.setIdAgex(rs.getInt("id_agex"));
                r.setPacRslt(rs.getInt("id_paciente"));
                r.setDocRslt(rs.getString("id_medico"));
                r.setExamRslt(rs.getString("id_examen"));
                r.setLabRslt(rs.getString("id_laboratorista"));
                r.setOrdenRslt(rs.getString("orden"));
                r.setArchivo(rs.getBytes("informe"));
                r.setFechaRslt(rs.getString("fecha"));
                r.setHoraRslt(rs.getString("hora"));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public ArrayList<Cita> listarCITAREP(String id) {
        int idp = Integer.parseInt(id);
        ArrayList<Cita> list = new ArrayList<Cita>();
        String sql = "SELECT distinct * FROM CITA WHERE id_pacnt=? AND fecha<=curdate() ORDER BY fecha DESC LIMIT 5;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, idp);
            rs = ps.executeQuery();
            while (rs.next()) {
                Cita c = new Cita();
                c.setId(rs.getInt("id_cita"));
                c.setPaciente(rs.getInt("id_pacnt"));
                c.setMedico(rs.getString("id_doc"));
                c.setEspecialidad(rs.getString("especialidad"));
                c.setFecha(rs.getString("fecha"));
                c.setHora(rs.getString("hora"));
                list.add(c);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }

    public ArrayList<Resultado> listarREPORTEHOY(String id) {
        ArrayList<Resultado> list = new ArrayList<Resultado>();
        String sql = "SELECT * FROM RESULTADO WHERE id_laboratorista=? AND fecha=curdate() order by hora ASC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            ps.setString(1, id);
            rs = ps.executeQuery();
            while (rs.next()) {
                Resultado r = new Resultado();
                r.setIdRslt(rs.getInt("id_resultado"));
                r.setIdAgex(rs.getInt("id_agex"));
                r.setPacRslt(rs.getInt("id_paciente"));
                r.setDocRslt(rs.getString("id_medico"));
                r.setExamRslt(rs.getString("id_examen"));
                r.setLabRslt(rs.getString("id_laboratorista"));
                r.setOrdenRslt(rs.getString("orden"));
                r.setArchivo(rs.getBytes("informe"));
                r.setFechaRslt(rs.getString("fecha"));
                r.setHoraRslt(rs.getString("hora"));
                list.add(r);
            }
        } catch (SQLException e) {
            System.out.println("Error: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {

            System.out.println("Error: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }
    /*public ArrayList<Informe> informeREPORTAD() {
        ArrayList<Informe> list = new ArrayList<Informe>();
        String sql = "SELECT * FROM INFORME ORDER BY fecha DESC;";
        try {
            cn = conexionDB.conector();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();
            while (rs.next()) {
                Informe i = new Informe();
                i.setIdInfo(rs.getInt("id_informe"));
                i.setPacInfo(rs.getInt("id_pac"));
                i.setDocInfo(rs.getString("id_dct"));
                i.setInforme(rs.getString("info"));
                i.setFechaInfo(rs.getString("fecha"));
                i.setHoraInfo(rs.getString("hora"));
                list.add(i);
            }
        } catch (SQLException e) {
            System.out.println("Error al obtner results: " + e);
            System.out.println(e.getMessage());
        } catch (Exception ex) {
            System.out.println("Error alobtener results: " + ex);
            System.out.println(ex.getMessage());
        } finally {
            try {
                cn.close();
                ps.close();
                rs.close();
            } catch (Exception e) {
            }
        }
        return list;
    }*/
}
