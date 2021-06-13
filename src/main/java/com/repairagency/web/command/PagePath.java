package com.repairagency.web.command;

public class PagePath {

    private PagePath(){
    }

    public static final String GUEST = "/main/role-dependent/guest";
    public static final String CLIENT = "/main/role-dependent/client";
    public static final String MASTER = "/main/role-dependent/master";
    public static final String MANAGER = "/main/role-dependent/manager";
    public static final String ADMIN = "/main/role-dependent/admin";

    public static final String HOME = "/main/home.jsp";
    public static final String ERROR = "/main/error.jsp";
    public static final String LOGIN = "/main/login.jsp";

    public static final String SETTINGS = "/profile-settings.jsp";

    public static final String CLIENT_REQUESTS = "/main/role-dependent/client/client-requests.jsp";
    public static final String MANAGER_REQUESTS = "/main/role-dependent/manager/manager-requests.jsp";
    public static final String MANAGER_REQUEST_INFO = "/main/role-dependent/manager/request-info.jsp";
    public static final String MANAGER_USER_INFO = "/main/role-dependent/manager/user-info.jsp";
}
