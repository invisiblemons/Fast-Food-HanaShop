/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package minhdc.servlet.search;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import javax.naming.NamingException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import minhdc.tblProduct.TblProductDAO;
import minhdc.tblProduct.TblProductDTO;
import minhdc.tblUser.TblUserDTO;

/**
 *
 * @author MONS
 */
@WebServlet(name = "SearchByPriceServlet", urlPatterns = {"/SearchByPriceServlet"})
public class SearchByPriceServlet extends HttpServlet {

    private final String SHOPPING_PAGE = "shopping-page.jsp";

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
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        HttpSession session = request.getSession();
        session.removeAttribute("ITEMSLIST");
        String minValue = request.getParameter("minPrice");
        String maxValue = request.getParameter("maxPrice");
        float min = 0;
        float max = 0;
        if (!"".equals(minValue.trim())) 
            min = Float.parseFloat(minValue);
            
        if(!"".equals(maxValue.trim()))
                max = Float.parseFloat(maxValue);
        
        TblProductDAO dao = new TblProductDAO();
        //chk admin
        boolean isAdmin = false;
        TblUserDTO user = (TblUserDTO) session.getAttribute("USER");
        if (user != null) {
            isAdmin = user.isIsAdmin();
            try {
                if (min < max||min==max) {
                    ArrayList<TblProductDTO> arrListItem = (ArrayList<TblProductDTO>) session.getAttribute("ITEMSLIST");
                    if (arrListItem == null) {
                        arrListItem = new ArrayList<>();
                    } else {
                        arrListItem.clear();
                    }
                    arrListItem = dao.loadPriceSearchResult(min, max, isAdmin);
                    Collections.sort(arrListItem);
                    session.setAttribute("ITEMSLIST", arrListItem);
                    request.setAttribute("minPrice", minValue);
                    request.setAttribute("maxPrice", maxValue);
                    request.setAttribute("ACTION", "searchByPrice");
                    
                } else {
                    request.setAttribute("ERROR", "Min can not small than Max! Input Again!");
                }

            } catch (SQLException ex) {
                log("SearchByPriceServlet_SQL " + ex.getMessage());
            } catch (NamingException ex) {
                log("SearchByPriceServlet_Naming " + ex.getMessage());
            } finally {
                RequestDispatcher rd = request.getRequestDispatcher(SHOPPING_PAGE);
                rd.forward(request, response);
                out.close();
            }
        } else if (user == null) { // is Customer
            try {
                if (min < max||min==max) {
                    ArrayList<TblProductDTO> arrListItem = (ArrayList<TblProductDTO>) session.getAttribute("ITEMSLIST");
                    if (arrListItem == null) {
                        arrListItem = new ArrayList<>();
                    } else {
                        arrListItem.clear();
                    }
                    arrListItem = dao.loadPriceSearchResult(min, max, isAdmin);
                    Collections.sort(arrListItem);
                    session.setAttribute("ITEMSLIST", arrListItem);
                    request.setAttribute("minPrice", minValue);
                    request.setAttribute("maxPrice", maxValue);
                    request.setAttribute("ACTION", "searchByPrice");
                } else {
                    request.setAttribute("ERROR", "Min can not bigger than Max! Input Again!");
                }

            } catch (SQLException ex) {
                log("SearchByPriceServlet_SQL " + ex.getMessage());
            } catch (NamingException ex) {
                log("SearchByPriceServlet_Naming " + ex.getMessage());
            } finally {
                RequestDispatcher rd = request.getRequestDispatcher(SHOPPING_PAGE);
                rd.forward(request, response);
                out.close();
            }
        }//is Customer 
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
