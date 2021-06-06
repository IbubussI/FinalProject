package com.repairagency.web.commands.impl;

import com.repairagency.PagePath;
import com.repairagency.entities.User;
import com.repairagency.web.commands.Command;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Personal implements Command {

    @Override
    public String execute(HttpServletRequest req, HttpServletResponse resp) {
        User user = (User) req.getSession().getAttribute("user");
        switch(user.getRole()) {
            case CLIENT:
            case MASTER:
            case MANAGER:
            case ADMIN:
            default:
        }
        return PagePath.HOME;
    }

}
