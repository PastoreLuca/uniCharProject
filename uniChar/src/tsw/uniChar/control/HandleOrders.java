package tsw.uniChar.control;

import java.io.IOException;
import java.util.Map;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import tsw.uniChar.Beans.cartBean;
import tsw.uniChar.Beans.orderBean;
import tsw.uniChar.Beans.productBean;
import tsw.uniChar.model.orderDAO;

/**
 * Servlet implementation class HandleOrders
 */
@WebServlet("/HandleOrders")
public class HandleOrders extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private orderDAO oD = null;
    /**
     * @see HttpServlet#HttpServlet()
     */
    public HandleOrders() {
        super();
        oD = new orderDAO();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		RequestDispatcher dispatcher = null;
		Integer orderID = 0;
		cartBean cart = (cartBean) request.getSession().getAttribute("cart");
		
		String action = (String)request.getParameter("action");
		
		if (action == null)
			action = (String)request.getAttribute("action");
		
		if (cart == null)
			return;
		
		if (action.equals("createorder")) {
			orderBean order = new orderBean();
			
			Integer userID = (Integer)request.getSession().getAttribute("userid");
			if (userID == null)
				return;
			
			order.setCart(cart);
			order.setUserID(userID);
			
			try {
				
				orderID = oD.insertOrder(order);
				
			} catch (Exception e) {
				e.printStackTrace();
			}
			
			request.getSession().removeAttribute("cart");
			
			dispatcher = getServletContext().getRequestDispatcher("/HandleInvoices?id=" + orderID.toString()); 
			dispatcher.forward(request, response);
			
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
