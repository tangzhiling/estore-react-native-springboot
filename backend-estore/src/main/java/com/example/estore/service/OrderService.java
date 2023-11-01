package com.example.estore.service;

import com.example.estore.model.LocalUser;
import com.example.estore.model.WebOrder;
import com.example.estore.model.dao.WebOrderDAO;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Service for handling order actions.
 */
@Service
public class OrderService {

  /** The Web Order DAO. */
  private WebOrderDAO webOrderDAO;

  /**
   * Constructor for spring injection.
   * @param webOrderDAO
   */
  public OrderService(WebOrderDAO webOrderDAO) {
    this.webOrderDAO = webOrderDAO;
  }

  /**
   * Gets the list of orders for a given user.
   * @param user The user to search for.
   * @return The list of orders.
   */
  public List<WebOrder> getOrders(LocalUser user) {
    return webOrderDAO.findByUser(user);
  }

}
