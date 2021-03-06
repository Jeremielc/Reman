package com.fimelab.reman.utils;

import com.fimelab.reman.controller.RegisterPageController;

import javax.servlet.*;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

public class Filter implements javax.servlet.Filter {
    private FilterConfig filterConfig;

    public Filter() {

    }

    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.filterConfig = filterConfig;
    }

    @Override
    public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException {
        HttpServletRequest request = (HttpServletRequest) servletRequest;
        HttpServletResponse response =(HttpServletResponse) servletResponse;

        if (request.getRequestURI().contains("upload_registered")) {
            if (RegisterPageController.sessions.get(request.getSession()) != null) {
                if (!RegisterPageController.sessions.get(request.getSession()).isAdmin()) {
                    response.sendRedirect("/Reman/index_registered.jsp");
                    return;
                }
            } else {
                response.sendRedirect("/Reman/index.jsp");
                return;
            }
        } else if (request.getRequestURI().contains("_registered")) {
            if (RegisterPageController.sessions.get(request.getSession()) == null) {
                response.sendRedirect("/Reman/index.jsp");
                return;
            }
        }

        filterChain.doFilter(request, response);
    }

    @Override
    public void destroy() {
        this.filterConfig = null;
    }
}
