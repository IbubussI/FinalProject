package com.repairagency.web.commands.impl;

import com.repairagency.PagePath;
import com.repairagency.exceptions.ErrorMessages;
import com.repairagency.web.commands.Command;
import org.apache.logging.log4j.LogManager;
import org.apache.logging.log4j.Logger;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class InvalidCommand implements Command {

    private static final Logger logger = LogManager.getLogger();

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        logger.debug("Executing command : invalid");
        req.getSession().setAttribute("error", ErrorMessages.INVALID_COMMAND);
        logger.trace("Redirecting to error page...");
        return PagePath.ERROR;
    }

}
