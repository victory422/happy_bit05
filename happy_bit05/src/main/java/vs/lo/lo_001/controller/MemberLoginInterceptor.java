package vs.lo.lo_001.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class MemberLoginInterceptor extends HandlerInterceptorAdapter {

    @Override
    public boolean preHandle(HttpServletRequest request,
                             HttpServletResponse response, Object session) throws Exception {

        HttpSession sessionCheck = request.getSession(false);
        if(sessionCheck != null) {
            Object obj = sessionCheck.getAttribute("sessionVO");
            if(obj != null)
                return true;
        }

        response.sendRedirect(request.getContextPath() + "/lo");
        return false;
    }

}

