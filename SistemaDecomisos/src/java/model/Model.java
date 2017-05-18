/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import database.Pool;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
//import java.util.Date;
import java.sql.Date;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Marco
 */
public class Model {

    public Model() {

    }

    //------------USUARIO----------------
    public Usuario login(String nick, String pass) {
        Connection con = null;
        Usuario user = null;
        try {
            con = Pool.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select 1 from Usuario "
                        + "where Usuario.nick='" + nick + "' "
                        + "and Usuario.contrasena='" + pass + "' ";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    user = new Usuario();
                    user.setNick(nick);
                    //user.setPrivilegio(rs.getInt("privilegio"));
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            user = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                user = null;
            }
        }
        return user;
    }

    public int guardarUsuario(Usuario usuario) {
        Connection con = null;
        int res = 0;//res =0 cuando hay error en conexion
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;

            ResultSet rs = null;
            if (con != null) {

                String sql = "{call prc_ins_user('" + usuario.getContrasena() + "',"
                        + "'1',"//este 1 es temporal mientras se remueve idfuncionario de tabla de usuarios
                        + "'" + usuario.getNick() + "',"
                        + "'" + usuario.getEstado() + "',"
                        + "'" + usuario.getPrivilegio() + "')}";
                pstmt = con.prepareCall(sql);

                pstmt.executeUpdate();
                res = 2;// res = 2 cuando indica exito!
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
            }
        }
        return res;
    }

    public List<Funcionario> listadoFuncionarios() {
        Connection con = null;
        List<Funcionario> funcionarios = new ArrayList<Funcionario>();
        try {
            con = Pool.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select * from FUNCIONARIO ";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                int idFuncionario = 0;
                String nombre = "";
                String puesto = "";
                while (rs.next()) {
                    idFuncionario = rs.getInt("IdFuncionario");
                    nombre = rs.getString("nombre");
                    puesto = rs.getString("puesto");
                    funcionarios.add(new Funcionario(idFuncionario, puesto, "", nombre, "", ""));
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            funcionarios = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                funcionarios = null;
            }
        }
        return funcionarios;
    }

    public List<Policia> listadoPolicias() {
        Connection con = null;
        List<Policia> policias = new ArrayList<Policia>();
        try {
            con = Pool.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select * from rh_empleado ";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                int idFuncionario = 0;
                String nombre = "";
                String apellido1, apellido2;
                while (rs.next()) {
                    nombre = rs.getString("DES_NOMBRE");
                    apellido1 = rs.getString("DES_APELLIDO1");
                    apellido2 = rs.getString("DES_APELLIDO2");
                    idFuncionario = rs.getInt("NUM_EMPLEADO");
                    policias.add(new Policia(idFuncionario, "", nombre, apellido1, apellido2));
                }
            }
        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            policias = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                policias = null;
            }
        }
        return policias;
    }

    public List<Usuario> listadoUsuarios() {
        Connection con = null;
        List<Usuario> usuarios = new ArrayList<Usuario>();
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "SELECT alias1.iduser,alias2.nombre,alias1.nick,alias1.estado,alias1.privilegio "
                        + "FROM "
                        + "    (SELECT usuariom.iduser,usuariom.nick,usuariom.idfuncionario,usuariom.estado,usuariom.privilegio "
                        + "    FROM usuariom"
                        + "    )alias1 , "
                        + "    (SELECT funcionario.idfuncionario,funcionario.nombre "
                        + "    FROM funcionario"
                        + "    )alias2  "
                        + "WHERE alias2.idfuncionario = alias1.idfuncionario";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                int idUsuario = 0;
                String nombre = "";
                String nick = "";
                int estado = 0;
                int privilegio = 0;
                while (rs.next()) {
                    idUsuario = rs.getInt("iduser");
                    nombre = rs.getString("nombre");
                    nick = rs.getString("nick");
                    estado = rs.getInt("estado");
                    privilegio = rs.getInt("privilegio");
                    usuarios.add(new Usuario(idUsuario, nick, nombre, estado, privilegio));//uso el campo contraseña para almacenar el nombre del funcionario
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            usuarios = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                usuarios = null;
            }
        }
        return usuarios;
    }

    public int guardarActaDecomiso(ActaDecomiso acta) throws SQLException {
        Connection con = null;
        int res = 0;
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;
            if (con != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
                String sql = "{call prc_ins_adecomiso('" + acta.getIdDecomiso() + "',"
                        + "'" + acta.getPolicia().getIdPolicia() + "',"
                        + "'" + acta.getInteresado().getIdInteresado() + "',"
                        + "'" + acta.getLugar().getDistrito().getIdDistrito() + "',"
                        + "'" + sdf.format(acta.getFecha()) + "',"
                        + "'111',"
                        + "'" + acta.getObservaciones() + "',"
                        + "'" + acta.getTestigo().getIdTestigo() + "',"
                        + "'" + acta.getHora()
                        + "')}";
                pstmt = con.prepareCall(sql);
                pstmt.executeUpdate();
                res = 2;
            }

        } catch (SQLException e) {
            res = 1;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                res = 1;
            }
        }
        return res;
    }

    //{call prc_ins_adonacion('1','ahda','1','1')}
    public int guardarActaDonacion(ActaDonacion actaDon) throws SQLException {
        Connection con = null;
        int res = 0;
        try {
            con = Pool.getConnection();
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
            CallableStatement pstmt = null;
            if (con != null) {
                String sql = "{call prc_ins_adonacion('" + actaDon.getIdDonacion() + "',"
                        + "'" + sdf.format(actaDon.getFecha()) + "',"
                        + "'" + actaDon.getInstitucion() + "',"
                        + "'" + actaDon.getPolicia().getIdPolicia() + "',"
                        + "'" + actaDon.getDecomiso().getIdDecomiso() + "',"
                        + "'" + actaDon.getDetalles()
                        + "')}";
                pstmt = con.prepareCall(sql);
                pstmt.executeUpdate();
                res = 2;
            }
        } catch (SQLException e) {
            res = 1;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                res = 1;
            }
        }
        return res;
    }

    public int guardarActaDestruccion(ActaDestruccion actaDestruccion) throws SQLException {
        Connection con = null;
        int res = 0;
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;
            if (con != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
                String sql = "{call prc_ins_adestruccion('" + actaDestruccion.getIdDestruccion() + "', "
                        + "'" + sdf.format(actaDestruccion.getFecha()) + "', "
                        + "'" + actaDestruccion.getPolicia().getIdPolicia() + "',"
                        + "'" + actaDestruccion.getTestigo1().getIdTestigo() + "',"
                        + "'" + actaDestruccion.getTestigo2().getIdTestigo() + "',"
                        + "'" + actaDestruccion.getLugar().getDireccionExacta() + "',"
                        + "'" + actaDestruccion.getEncargado() + "',"
                        + "'" + actaDestruccion.getActaDecomiso().getIdDecomiso()
                        + "')}";
                pstmt = con.prepareCall(sql);
                pstmt.executeUpdate();
                res = 2;
            }
        } catch (SQLException e) {
            res = 1;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                res = 1;
            }
        }
        return res;
    }

    public int guardarActaDevolucion(ActaDevolucion actaDevolucion) throws SQLException {
        Connection con = null;
        int res = 0;
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;
            if (con != null) {
                SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
                String sql = "{call prc_ins_adevolucion('" + actaDevolucion.getIdDevolucion() + "',"
                        + "'" + actaDevolucion.getPolicia().getIdPolicia() + "',"
                        + "'" + actaDevolucion.getDecomiso().getIdDecomiso() + "',"
                        + "'" + actaDevolucion.getInteresado().getIdInteresado() + "',"
                        + "'" + sdf.format(actaDevolucion.getFecha())
                        + "')}";
                pstmt = con.prepareCall(sql);
                pstmt.executeUpdate();
                res = 2;
            }

        } catch (SQLException e) {
            res = 1;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                res = 1;
            }
        }
        return res;
    }

    public int ultimaActaDonacion() {
        Connection con = null;
        int last = -1;
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select *  from ( select ActaDonacion.*, max(IdDonacion) over () as max_pk from ActaDonacion) where IdDonacion = max_pk";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                while (rs.next()) {
                    last = rs.getInt("max_pk");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return last;
    }

    public int ultimaActaDestruccion() {
        Connection con = null;
        int last = -1;
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select *  from ( select ActaDestruccion.*, max(IdDestruccion) over () as max_pk from ActaDestruccion) where IdDestruccion = max_pk";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                while (rs.next()) {
                    last = rs.getInt("max_pk");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return last;
    }

    public int ultimaActaDevolucion() {
        Connection con = null;
        int last = -1;
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select *  from ( select ActaDevolucion.*, max(IdDevolucion) over () as max_pk from ActaDevolucion) where IdDevolucion = max_pk";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                while (rs.next()) {
                    last = rs.getInt("max_pk");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return last;
    }

    public int ultimoTestigo() {
        Connection con = null;
        int last = -1;
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select *  from ( select Testigos.*, max(IdTest) over () as max_pk from Testigos) where IdTest = max_pk";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                while (rs.next()) {
                    last = rs.getInt("max_pk");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return last;
    }

    public int actualizarInteresado(Interesado interesado) {
        Connection con = null;
        int res = 0;//res =0 cuando hay error en conexion
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
            ResultSet rs = null;
            if (con != null) {

                String sql = "{call prc_upd_int('" + interesado.getNombre() + "',"
                        + "'" + interesado.getIdentificacion() + "',"
                        + "'" + interesado.getApellido1() + "',"
                        + "'" + interesado.getApellido2() + "',"
                        + "'" + sdf.format(interesado.getFechaNacimiento()) + "',"
                        + "'" + interesado.getDomicilio().getDireccionExacta() + "',"
                        + "'" + interesado.getFoto()
                        + "')}";
                pstmt = con.prepareCall(sql);

                pstmt.executeUpdate();
                res = 2;// res = 2 cuando indica exito!
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
            }
        }
        return res;
    }

    public int guardarInteresado(Interesado interesado) {
        Connection con = null;
        int res = 0;//res =0 cuando hay error en conexion
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MMM/yyyy");
            ResultSet rs = null;
            if (con != null) {

                String sql = "{call prc_ins_int('" + interesado.getNombre() + "',"
                        + "'" + interesado.getIdentificacion() + "',"
                        + "'" + interesado.getApellido1() + "',"
                        + "'" + interesado.getApellido2() + "',"
                        + "'" + sdf.format(interesado.getFechaNacimiento()) + "',"
                        + "'" + interesado.getDomicilio().getDireccionExacta() + "',"
                        + "'" + interesado.getFoto()
                        + "')}";
                pstmt = con.prepareCall(sql);

                pstmt.executeUpdate();
                res = 2;// res = 2 cuando indica exito!
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
            }
        }
        return res;
    }

    public int guardarPolicia(Policia policia) {
        Connection con = null;
        int res = 0;//res =0 cuando hay error en conexion
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;

            ResultSet rs = null;
            if (con != null) {

                String sql = "{call prc_ins_pm('"
                        + "1','" + policia.getNombre() + "')}";
                pstmt = con.prepareCall(sql);

                pstmt.executeUpdate();
                res = 2;// res = 2 cuando indica exito!
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
            }
        }
        return res;
    }

    public int guardarTestigo(Testigo testigo) {
        Connection con = null;
        int res = 0;//res =0 cuando hay error en conexion
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;

            ResultSet rs = null;
            if (con != null) {

                String sql = "{call prc_ins_test('" + testigo.getNombre() + "',"
                        + "'" + testigo.getApellido1() + "',"
                        + "'" + testigo.getApellido2()
                        + "')}";
                pstmt = con.prepareCall(sql);

                pstmt.executeUpdate();
                res = 2;// res = 2 cuando indica exito!
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
            }
        }
        return res;
    }

    public static java.sql.Date convertFromJAVADateToSQLDate(java.util.Date javaDate) {
        java.sql.Date sqlDate = null;
        if (javaDate != null) {
            sqlDate = new Date(javaDate.getTime());
        }
        return sqlDate;
    }

    public int ultimaActaDecomiso() {
        Connection con = null;
        int last = -1;
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select *  from ( select ActaDecomiso.*, max(IdDecomiso) over () as max_pk from ActaDecomiso) where IdDecomiso = max_pk";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                while (rs.next()) {
                    last = rs.getInt("max_pk");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return last;

    }

    public int getIdInteresado(String cedula) {
        Connection con = null;
        int id = -1;
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select idInteresado from Interesado where cedula='" + cedula + "'";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                if (rs.next()) {
                    id = rs.getInt("idinteresado");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return id;
    }

    public int getIdPolicia(String cedula) {
        Connection con = null;
        int id = -1;
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select idInteresado from Interesado where PoliciaMunicipal=" + cedula;
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                if (rs.next()) {
                    id = rs.getInt("idinteresado");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return id;
    }

    public int guardarObjetos(Contenedor lD, int uAc) {
        Connection con = null;
        int res = 0;//res =0 cuando hay error en conexion
        try {
            con = Pool.getConnection();
            CallableStatement pstmt = null;

            ResultSet rs = null;
            if (con != null) {
                for (Decomiso d : lD.getItems()) {
                    String sql = "{call prc_ins_obj('" + d.getObservaciones() + "',"
                            + d.getCantidad() + ","
                            + uAc + ","
                            + "'" + d.getCategoria()
                            + "')}";
                    pstmt = con.prepareCall(sql);
                    pstmt.executeUpdate();
                }

                res = 2;// res = 2 cuando indica exito!
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                res = 1;//res  = 1 cuando hay excepcion, ejemplo: llave primaria repetida
            }
        }
        return res;
    }

    public List<ActaDecomiso> imprimeDecomisos() {
        Connection con = null;
        String decomisos = "";
        List<ActaDecomiso> list = new ArrayList();

        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = " select A.idDecomiso as idD, A.fecha as fecha,A.hora as hora, A.lugar as lugar,\n"
                        + "                        DES_NOMBRE as pNombre,DES_APELLIDO1 as pApellido1,DES_APELLIDO2 as pApellido2, I.nombre as iNombre, I.primerapellido as iApellido1, I.segundoapellido as iApellido2\n"
                        + "                        FROM ActaDecomiso A\n"
                        + "                        INNER JOIN rh_empleado P ON P.NUM_EMPLEADO = A.idPolicia\n"
                        + "                        INNER JOIN interesado I ON I.idInteresado = A.idInteresado";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                int idD = 0;
                Date fecha;
                String pName;
                String pApellido1;
                String pApellido2;
                String iName;
                String iApellido1;
                String iApellido2;
                String hora;
                int lugar;
                while (rs.next()) {
                    java.sql.Timestamp t = rs.getTimestamp("fecha");
                    idD = rs.getInt("idD");
                    fecha = rs.getDate("fecha");
                    hora = rs.getString("hora");
                    pName = rs.getString("pNombre");
                    pApellido1 = rs.getString("pApellido1");
                    pApellido2 = rs.getString("pApellido2");
                    iName = rs.getString("iNombre");
                    iApellido1 = rs.getString("iApellido1");
                    iApellido2 = rs.getString("iApellido2");

                    lugar = rs.getInt("LUGAR");
                    ActaDecomiso acta = new ActaDecomiso(idD, new Policia(0, "0", pName, pApellido1, pApellido2),
                            new Testigo(), new Lugar(new Distrito(lugar, ""), ""), fecha, hora, new Interesado(0, fecha, new Lugar(), "",
                                    iName, iApellido1, iApellido2, ""), new Contenedor(), "");
                    list.add(acta);
                }

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            // usuarios = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                //usuarios = null;
            }
        }
        //return usuarios;
        return list;
    }

    public int ultimoInteresado() {
        Connection con = null;
        int last = -1;
        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select *  from ( select Interesado.*, max(IdInteresado) over () as max_pk from Interesado) where IdInteresado = max_pk";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                while (rs.next()) {
                    last = rs.getInt("max_pk");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return last;
    }

    public List<Interesado> listadoInteresados() {
        Connection con = null;
        List<Interesado> interesados = new ArrayList<Interesado>();
        try {
            con = Pool.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select * from Interesado ";
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                int idInteresado = 0;
                Date fechaNac;
                Lugar domicilio = new Lugar();
                String nombre = "";
                String apellido1 = "";
                String apellido2 = "";
                String identificacion = "";
                while (rs.next()) {
                    idInteresado = rs.getInt("IdInteresado");
                    identificacion = rs.getString("cedula");
                    nombre = rs.getString("nombre");
                    apellido1 = rs.getString("primerapellido");
                    apellido2 = rs.getString("segundoapellido");
                    //fechaNac = rs.getDate("fechanac");
                    domicilio.setDireccionExacta(rs.getString("residencia"));
                    interesados.add(new Interesado(idInteresado, null, domicilio, identificacion,
                            nombre, apellido1, apellido2, ""));
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            interesados = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                interesados = null;
            }
        }
        return interesados;
    }

    public Interesado getInteresado(String cedula) {
        Connection con = null;
        Interesado interesado = null;
        try {
            con = Pool.getConnection();
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "select * from Interesado where cedula=" + cedula;
                pstmt = con.prepareStatement(sql);
                rs = pstmt.executeQuery();
                int idInteresado = 0;
                Date fechaNac;
                Lugar domicilio = new Lugar();
                String nombre = "";
                String apellido1 = "";
                String apellido2 = "";
                String identificacion = "";
                while (rs.next()) {
                    idInteresado = rs.getInt("IdInteresado");
                    identificacion = rs.getString("cedula");
                    nombre = rs.getString("nombre");
                    apellido1 = rs.getString("primerapellido");
                    apellido2 = rs.getString("segundoapellido");
                    fechaNac = rs.getDate("fechanac");
                    domicilio.setDireccionExacta(rs.getString("residencia"));
                    interesado = new Interesado(idInteresado, fechaNac, domicilio, identificacion,
                            nombre, apellido1, apellido2, "");
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            interesado = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                interesado = null;
            }
        }
        return interesado;
    }

    public Integer[] obtenerCantidadDecomisos() {

        Connection con = null;
        Integer[] list = new Integer[5];

        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql = "SELECT lugar, count(lugar) as cantidad FROM actadecomiso group by lugar order by lugar";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                while (rs.next()) {
                    int lugar = rs.getInt("lugar");
                    int cantidad = rs.getInt("cantidad");
                    list[lugar] = cantidad;
                }
            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());

        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
            }
        }
        return list;
    }

    /////////////////////////////////////reportes
    public List<ActaDevolucion> imprimeDevolucion() {
        Connection con = null;
        String devolucion = "";
        List<ActaDevolucion> list = new ArrayList();

        try {
            con = Pool.getConnection();
            Statement pstmt = null;
            ResultSet rs = null;
            if (con != null) {

                String sql
                        = "select a.IdDevolucion as IdD, a.fecha as fecha\n"
                        + "i.idInteresado as idinte,P.NUM_EMPLEADO as numemp,P.DESNOMBRE as dnom,P.DES_APELLIDO1 as dap1,d.IdDecomiso as iddec\n"
                        + "FROM PoliciaMunicipal.ActaDevolucion a\n"
                        + "INNER JOIN rh_empleado P ON P.NUM_EMPLEADO = a.idPolicia\n"
                        + "INNER JOIN ActaDecomiso d ON d.IdDecomiso = a.IdDecomiso\n"
                        + "INNER JOIN interesado i ON i.idInteresado = a.idInteresado";
                pstmt = con.createStatement();
                rs = pstmt.executeQuery(sql);
                Date fecha;
                String nombrepol;
                String apepol;
                int piddev;
                int NUMEMP;
                int idACTADECOMISO;
                int idINTERESADO;
                while (rs.next()) {
                    java.sql.Timestamp t = rs.getTimestamp("fecha");
                    idACTADECOMISO = rs.getInt("iddec");
                    idINTERESADO = rs.getInt("idinte");
                    fecha = rs.getDate("fecha");
                    nombrepol = rs.getString("dnom");
                    apepol = rs.getString("dap1");
                    NUMEMP = rs.getInt("numemp");
                    piddev = rs.getInt("idD");

                    ActaDecomiso acta = new ActaDecomiso(0, new Policia(0, "0", "", "", ""),
                            new Testigo(), new Lugar(new Distrito(0, ""), ""), fecha, "", new Interesado(0, fecha, new Lugar(), "",
                                    "", "", "", ""), new Contenedor(), "");

                    ActaDevolucion aux = new ActaDevolucion(piddev, new Policia(NUMEMP, "0", nombrepol, apepol, ""),
                            acta, new Interesado(idINTERESADO, fecha, new Lugar(new Distrito(0, ""), ""), "", "", "", "", ""), fecha);

                    list.add(aux);
                }

            }

        } catch (SQLException ex) {
            System.out.println(ex.getMessage());
            // usuarios = null;
        } finally {
            try {
                con.close();
            } catch (SQLException ex) {
                System.out.println(ex.getMessage());
                //usuarios = null;
            }
        }
        //return usuarios;
        return list;
    }

    //////////////////////////////////////////////////////
//    public List<ActaDonacion> imprimeDonacion() {
//        Connection con = null;
//        String donacion = "";
//        List<ActaDonacion> list = new ArrayList();
//
//        try {
//       public List<ActaDonacion> imprimeDonacion()     con = Pool.getConnection();
//            Statement pstmt = null;
//            ResultSet rs = null;
//            if (con != null) {
//
//                String sql = " select a.IdDonacion as iddon,a.Institucion as ins,P.NUM_EMPLEADO as numemp,P.DESNOMBRE as dnom,P.DES_APELLIDO1 as dap1,d.IdDecomiso as iddec\n"
//                        + "FROM PoliciaMunicipal.ActaDonacion\n"
//                        + "INNER JOIN rh_empleado P ON P.NUM_EMPLEADO = a.idPolicia\n"
//                        + "INNER JOIN ActaDecomiso d ON d.IdDecomiso = a.IdDecomiso";
//
//                pstmt = con.createStatement();
//                rs = pstmt.executeQuery(sql);
//                //Date fecha;
//                String nombrepol;
//                String apepol;
//                int piddon;
//                int NUMEMP;
//                String institucion;
//                while (rs.next()) {
//                    java.sql.Timestamp t = rs.getTimestamp("fecha");
//                    piddon = rs.getInt("iddon");
//                    institucion = rs.getString("ins");
//                    nombrepol = rs.getString("dnom");
//                    apepol = rs.getString("dap1");
//                    NUMEMP = rs.getInt("numemp");
//
//                    ActaDecomiso acta = new ActaDecomiso(0, new Policia(0, "0", "", "", ""),
//                            new Testigo(), new Lugar(new Distrito(0, ""), ""), new Date(0, 0, 0), "", new Interesado(0, new Date(0, 0, 0), new Lugar(), "",
//                                    "", "", "", ""), new Contenedor(), "");
//
//                    ActaDonacion aux = new ActaDonacion(piddon, institucion, new Policia(0, "", nombrepol, apepol, ""), acta);
//                    list.add(aux);
//                }
//
//            }
//
//        } catch (SQLException ex) {
//            System.out.println(ex.getMessage());
//            // usuarios = null;
//        } finally {
//            try {
//                con.close();
//            } catch (SQLException ex) {
//                System.out.println(ex.getMessage());
//                //usuarios = null;
//            }
//        }
//        //return usuarios;
//        return list;
//    }

}
