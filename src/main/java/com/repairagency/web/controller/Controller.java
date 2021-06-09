package com.repairagency.web.controller;

import com.repairagency.web.commands.CommandContainer;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/controller")
public class Controller extends HttpServlet {

    private static final Logger logger = LogManager.getLogger();
    private static final String COMMAND = "command";

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.debug("Controller receives 'get' request");
        String command = req.getParameter(COMMAND);
        logger.trace("{} : {}", COMMAND, command);
        String view = CommandContainer.getCommand(command).execute(req, resp);
        req.removeAttribute(COMMAND);
        req.getRequestDispatcher(view).forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        logger.debug("Controller receives 'post' request");
        req.setCharacterEncoding("UTF-8");
        String command = req.getParameter(COMMAND);
        logger.trace("{} : {}", COMMAND, command);
        String view = CommandContainer.getCommand(command).execute(req, resp);
        resp.sendRedirect(view);
    }

}