/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import database.Pool;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.Locale;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import net.sf.jasperreports.engine.JRParameter;
import net.sf.jasperreports.engine.JasperRunManager;

/**
 *
 * @author Byron
 */
public class Reportes extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try (ServletOutputStream outputStream = response.getOutputStream()) {
            String accion = request.getParameter("action");
            switch (accion) {
                case "printPDF": {
                    File reportFile = null;
                    Map<String, Object> parametros = new HashMap<>();
                    String tituloVal = request.getParameter("tituloVal");
                    String titulo = "";
                    String where = request.getParameter("data");
                    switch (tituloVal) {
                        case "r_deco": {
                            titulo = "Reporte de decomisos";
                            reportFile = new File(request.getSession().getServletContext().getRealPath("Reportes/reporteDecomisos.jasper"));
                        }
                        break;
                        case "r_des": {
                            titulo = "Reporte de destrucción";
                        }
                        break;
                        case "r_dev": {
                            titulo = "Reporte de devolución";
                        }
                        break;
                        case "r_dona": {
                            titulo = "Reporte de donación";
                        }
                        break;
                    }
                    if (!where.equals("")) {
                        parametros.put("p_where", where);
                    }else {
                       parametros.put("p_where", ";"); 
                    }
                    parametros.put(JRParameter.REPORT_LOCALE, new Locale("es"));
                    byte[] bytes = JasperRunManager.runReportToPdf(reportFile.getPath(), parametros, Pool.getConnection());
                    response.setContentType("application/pdf");
                    response.setContentLength(bytes.length);
                    outputStream.write(bytes, 0, bytes.length);
                    outputStream.flush();

                }
            }
        } catch (JRException ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(Reportes.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
